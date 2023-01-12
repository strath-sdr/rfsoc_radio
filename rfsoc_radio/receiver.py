__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_radio"

from pynq import DefaultIP
from pynq import allocate
import ipywidgets as ipw
import numpy as np
from .quick_widgets import DropdownMenu, ReceiveTerminal
from .async_radio import AsyncRadioRx


class Receiver():
    def __init__(self, axi_dma, receiver, inspector):
        """Create a Receiver object that controls the receiver
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
        
        # Create Receive Controller
        self.controller = receiver
        
        # Create inspector module
        self.inspector = inspector
        
        # Create asynchronous radio receiver
        self.monitor = AsyncRadioRx(irq = self.controller.irq, 
                                       irq_callback = self._transfer)
        
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
                                    1)
        
        # Observe the dropdown menu for changes
        self._s_sel._dropdown_menu.observe(on_signal_change, names='value')
        
        # Set default observation point to 1
        self.controller.observation_point = 1

        # Create a receiver terminal object and set callback
        self._terminal = ReceiveTerminal(description='Received Messages:')
        self.monitor.callback = [terminal_callback]
        self._terminal.start()

        # Create a debug button for our text terminal
        self._debug_button = ipw.Button(description='Debug',
                                        layout=ipw.Layout(margin='auto',
                                                          border='solid white'))
        self._debug_button.on_click(lambda _: self._toggle_debug())
        self._debug_button.style.button_color = 'lightgray'
        
        """Monitor initialisation"""
        #self.monitor.start()

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
        
    def _dma_transfer(self, pynqbuffer):
        self.axi_dma.recvchannel.transfer(pynqbuffer)
        self.controller.transfer = 1
        self.axi_dma.recvchannel.wait()
        self.controller.transfer = 0
        
    def _transfer(self):
        buff_len = self.controller.receive_size
        
        if buff_len > 0:
            # Create new receive buffer for message
            self._rx_buff.freebuffer()
            self._rx_buff = allocate(shape=(buff_len,), dtype = np.uint8)

            # Prepare to receive the message
            self._dma_transfer(self._rx_buff)
            
            # Obtain the message
            self._message = np.array(self._rx_buff.astype(np.uint32), \
                                     dtype = np.uint8)[5:len(self._rx_buff)]
            
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
        name = ['Constellation', 'Time', 'Spectrum']
        children = [self.inspector.constellation_plot(),
                    self.inspector.time_plot(),
                    self.inspector.spectrum_plot()]
        tab = ipw.Tab(children=children,
                      layout=ipw.Layout(height='initial',
                                        width='initial'))
        for i in range(0, len(children)):
            tab.set_title(i, name[i])
        control_buttons = self.inspector.plot_control()
        rx_accordion = ipw.Accordion(children=[
            ipw.VBox([tab, 
            ipw.HBox([self._s_sel.get_widget(), control_buttons[0], control_buttons[1]])])])
        rx_accordion.set_title(0, 'Receiver Visualisation')
        return rx_accordion

    def terminal(self):
        """Returns a receiver terminal object for printing Ascii data
        for the receiver.
        """
        terminal = self._terminal.get_widget()
        terminal.children[0].children[1].children = tuple(list(terminal.children[0].children[1].children) +
            [self._debug_button])
        return terminal
        
class ReceiverCore(DefaultIP):
    """Driver for Receiver's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    def __init__(self, description):
        super().__init__(description=description)
        
    bindto = ['UoS:RFSoC:receiver:1.0']
    
# LUT of property addresses for our data-driven properties
_receiver_props = [("reset_time_sync", 0),
                   ("reset_phase_sync", 4),
                   ("reset_frame_sync", 8),
                   ("threshold", 12),
                   ("transfer", 28),
                   ("observation_point", 36),
                   ("fifo_count", 32),
                   ("receive_size", 20),
                   ("packet_count_qpsk", 24),
                   ("coarse_passthrough", 44),
                   ("freq_offset", 40),
                   ("modulation", 48),
                   ("packet_count_bpsk", 52),
                   ("global_reset_sync", 56)]
    
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
    
# Generate getters and setters based on _receiver_props
for (name, addr) in _receiver_props:
    setattr(ReceiverCore, name, _create_mmio_property(addr))
