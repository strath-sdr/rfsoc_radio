__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_radio"

from pynq import DefaultIP
from pynq import allocate
import ipywidgets as ipw
import numpy as np
from .quick_widgets import DropdownMenu, ReceiveTerminal
from .async_radio import AsyncRadioRx


class BpskReceiver():
    def __init__(self, axi_dma, bpsk_receiver, inspector):
        """Create a BPSK Receiver object that controls the receiver
        and corresonding AXI DMA for data movement between PS and PL."""
        super().__init__()
        
        def on_signal_change(change):
            shape = ((64, ), (64, ), (512, ), (2048, ), (2048, ))
            freq = (100000, 100000, 3200000, 12800000, 12800000)
            self.inspector.set_frequency(freq[change['new']])
            self.controller.observation_point = change['new']
            self.inspector.set_shape(shape[change['new']])

        def terminal_callback():
            frame = self.frame
            payload = np.where(frame["payload"] > 127, 0, frame["payload"]).tostring().decode('ascii')
            if self._debug:
                data = 'Header: ' + str({i:frame[i] for i in frame if i!="payload"}) \
                + '\rPayload: ' + payload + '\r\r'
            else:
                data = payload
            self._terminal.append(data)
        
        """Initialise objects"""
        # Create AXI DMA object
        self.axi_dma = axi_dma
        
        # Create BPSK Receive Controller
        self.controller = bpsk_receiver
        
        # Create inspector module
        self.inspector = inspector
        
        # Create asynchronous radio receiver
        self.monitor = AsyncRadioRx(irq = self.controller.irq, 
                                       irq_callback = self.transfer)
        
        """AXI DMA Buffer initialisation"""
        # Allocate default memory for the _rx_buffer receiver buffer
        self._rx_buff = allocate(shape=(32,), dtype = np.uint8)
        
        """Inspector initialisation"""
        # Create a new signal selector widget
        self._s_sel = DropdownMenu([('Phase Synchronisation', 0),
                                    ('Time Synchronisation', 1),
                                    ('Raised Cosine Filter', 2),
                                    ('Coarse Synchronisation', 3),
                                    ('CIC Decimator', 4)],
                                    'Observation Point:',
                                    0)
        
        # Observe the dropdown menu for changes
        self._s_sel._dropdown_menu.observe(on_signal_change, names='value')

        # Create a receiver terminal object and set callback
        self._terminal = ReceiveTerminal(description='Received Messages:')
        self.monitor.callback = [terminal_callback]

        # Create a debug button for our text terminal
        self._debug_button = ipw.Button(description='Debug',
                                        layout=ipw.Layout(margin='auto'))
        self._debug_button.on_click(lambda _: self._toggle_debug())
        self._debug_button.style.button_color = 'lightgray'
        
        """Monitor initialisation"""
        self.monitor.start()

        """Receiver initialisation"""
        # Create empty receiver frame
        self.frame = {
            "number" : 0,
            "flags" : 0,
            "length" : {
                "total" : 0,
                "header" : 0,
                "payload" : 0,
                "padding" : 0
            },
            "payload" : 0
        }

        # Set terminal debug mode
        self._debug = False

    def _toggle_debug(self):
        if self._debug:
            self._debug = False
            self._debug_button.style.button_color = 'lightgray'
        else:
            self._debug = True
            self._debug_button.style.button_color = 'lightblue'
        
    def signal_selector(self):
        return self._s_sel.get_widget()
        
    def _transfer(self, pynqbuffer):
        self.axi_dma.recvchannel.transfer(pynqbuffer)
        self.controller.transfer = 1
        self.axi_dma.recvchannel.wait()
        self.controller.transfer = 0
        
    def transfer(self):
        buff_len = self.controller.receive_size
        
        if buff_len > 0:
            # Create new receive buffer for message
            self._rx_buff.freebuffer()
            self._rx_buff = allocate(shape=(buff_len,), dtype = np.uint8)

            # Prepare to receive the message
            self._transfer(self._rx_buff)
            
            # Obtain the message
            self._message = np.array(self._rx_buff.astype(np.uint32), \
                                     dtype = np.uint8)[5:len(self._rx_buff) - self._rx_buff[4]]
            
            # Set frame to allow the user to read the frame data
            self.frame = {
                "number" : self._rx_buff[0],
                "flags" : self._rx_buff[1],
                "length" : {
                    "total" : buff_len,
                    "header" : self._rx_buff[2],
                    "payload" : self._rx_buff[3],
                    "padding" : self._rx_buff[4]
                },
                "payload" : self._message
            }
    
    def visualise(self):
        """Returns widgets for inspecting and controlling signal paths in our radio.
        """
        control_buttons = self.inspector.plot_control()
        return ipw.VBox([self.signal_selector(),
                         ipw.HBox([self.inspector.time_plot(), 
                                   self.inspector.constellation_plot(),
                                   ipw.VBox([control_buttons[0], 
                                             control_buttons[1]
                                            ]),
                                  ]),
                         self.inspector.spectrum_plot()
                        ])

    def terminal(self):
        """Returns the ReceiveTerminal object widgets.
        """
        terminal = self._terminal.get_widget()
        terminal.children[1].children = tuple(list(terminal.children[1].children) +
                                        [self._debug_button])
        return terminal
        
class BpskReceiverCore(DefaultIP):
    """Driver for BPSK Receiver's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    def __init__(self, description):
        super().__init__(description=description)
        
    bindto = ['strath.ac.uk:RFSoC:bpsk_receiver:1.0']
    
# LUT of property addresses for our data-driven properties
_bpskReceiver_props = [("reset_time_sync", 0),
                       ("reset_phase_sync", 4),
                       ("reset_frame_sync", 8),
                       ("threshold", 12),
                       ("transfer", 28),
                       ("observation_point", 36),
                       ("fifo_count", 32),
                       ("receive_size", 20),
                       ("packet_count", 24),
                       ("coarse_passthrough", 44),
                       ("freq_offset", 40)]
    
# Function to return a MMIO Getter and Setter based on a relative address
def _create_mmio_property(addr):
    def _get(self):
        value = self.read(addr)
        if addr == 40:
            data = -((value-(2**32)*int(str((value)>>32-1)))*2**-10)
        else:
            data = value
        return data
        
    def _set(self, value):
        self.write(addr, value)
            
    return property(_get, _set)
    
# Generate getters and setters based on _bpskReceiver_props
for (name, addr) in _bpskReceiver_props:
    setattr(BpskReceiverCore, name, _create_mmio_property(addr))
