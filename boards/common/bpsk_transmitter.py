from pynq import DefaultIP
from pynq import allocate
import numpy as np
import async_radio as ar
from random import randint

class BpskTransmitter():
    def __init__(self, axi_dma, bpsk_transmitter):
        """Create a BPSK Transmitter object that controls the transmitter
        and corresponding AXI DMA for data movement between the PS and PL."""
        super().__init__()
        
        self.axi_dma = axi_dma
        self.controller = bpsk_transmitter
        
        self.controller.enable_data = 1
        self.controller.enable_transmitter = 1
        
        self.frame_size = 27
        self.random_size = 10
        
        self._flags = 0
        self._frame_number = 0
        self._tx_buff = self.create_buffer()
        
        self._message = self._prepare_message(np.array([72, 101, 108, 108, 111,  32,  87, 111, 114, 108, 100,  33], dtype=np.uint8))
        self.mode = 'single'
        
        # Create a new radio transmitter object
        self.monitor = ar.AsyncRadioTx(rate=1, timer_callback=self.transfer)
        
    def start(self):
        if self.monitor.is_running:
            raise RuntimeError('Transmitter already started.')
        else:
            if self.mode == 'repeat':
                self.monitor.start()
            elif self.mode == 'single':
                self.transfer()
            else:
                raise ValueError('Transmitter mode should be repeat or single.')
        
    def data(self, data='Hello World'):
        if isinstance(data, str):
            msg = self._ascii_to_numpy(data)
        elif isinstance(data, bytes):
            msg = np.frombuffer(data, dtype=np.uint8)
        elif isinstance(data, np.ndarray):
            msg = message
        else:
            raise TypeError('Message must be string, numpy array, or bytes/bytearray.')
        self._message = self._prepare_message(msg)
        
    def stop(self):
        self.monitor.stop()
        
    def clear(self):
        self._message = self._prepare_message(self._ascii_to_numpy('\x00'))
        self._frame_number = 0
        
    def create_buffer(self, data=np.array([72, 101, 108, 108, 111,  32,  87, 111, 114, 108, 100,  33], dtype=np.uint8), eof=1, padding=0):
        """Create a buffer that is loaded user data. Append the Extended Barker sequence
        to the user data and then pad with zeros
        """
        self._flags = eof
        if data.size == 0:
            raise ValueError('Message size should be greater than 0.')
        msg = np.array(data, dtype=np.uint8)
        # Append Barker and Random Data
        bkr = np.array([0, 0, 63, 112, 28, len(msg) + 5, self._frame_number, self._flags, 5, len(msg)-padding, padding], dtype=np.uint8)
        rnd = np.array([randint(0, 255) for p in range(0, self.random_size)], dtype=np.uint8)
        seq = np.append(bkr, msg)
        seq = np.append(rnd, seq)
        pad = np.append(seq, np.zeros(int(np.ceil((len(rnd) + len(bkr) + len(msg))/32) * 32 - (len(rnd) + len(bkr) + len(msg))), dtype=np.uint8))
        buf = allocate(shape=(len(pad),), dtype=np.uint8)
        buf[:] = pad[:]
        return buf
        
    def _transfer(self, pynqbuffer):
        self.axi_dma.sendchannel.transfer(pynqbuffer)
        self.axi_dma.sendchannel.wait()
        
    def transfer(self):
        # Create new send buffer for message
        sof = 2
        eof = 0
        padding = 0
        for i in range(self._message["nframes"]):
            if i > 0:
                sof = 0
            if i == self._message["nframes"] - 1:
                eof = 1
                padding = self._message["padding"]
            self._tx_buff.freebuffer()
            self._tx_buff = self.create_buffer(self._message["message"][i], sof+eof, padding)

            # Send the message
            self._transfer(self._tx_buff)
            self._frame_number += 1
        self._frame_number = 0
        
    def _ascii_to_numpy(self, message='Thou shall not sample higher than Nyquist... unless Bob says so.'):
        """Given a custom ascii message, create a send and receive buffer, packages the message
        into a frame with extended barker sequence, and transmits the frame.
        """
        if not message:
            raise ValueError('Message should contain data.')
        # Format the message as an integer
        return np.array(np.array(message, 'c').view(np.uint8), dtype = np.uint8)
    
    def _prepare_message(self, msg):
        
        if len(msg) > self.frame_size:
            # Get the number of packets that will be sent
            ncols = int(np.ceil(len(msg)/self.frame_size))

            # Pad the message with zeros as required by the number of packets
            nzeros = ncols*self.frame_size - len(msg)
            pad = np.append(msg, np.zeros(nzeros, dtype=np.uint8))

            # Reshape the array into packets by self.frame_size
            pckts = np.reshape(pad, (ncols, self.frame_size))

            # Create data frame
            data = {
                "message" : pckts,
                "padding" : nzeros,
                "nframes" : ncols
            }
        else:
            data = {
                "message" : np.reshape(msg, (1, len(msg))),
                "padding" : 0,
                "nframes" : 1
            }

        return data
        
class BpskTransmitterCore(DefaultIP):
    """Driver for BPSK Transmitter's core logic IP
    Exposes all the configuration registers by name via data-driven properties
    """
    def __init__(self, description):
        super().__init__(description=description)
        
    bindto = ['UoS:RFSoC:bpsk_transmitter:1.0']
    
# LUT of property addresses for our data-driven properties
_bpskTransmitter_props = [("enable_data", 0),
                          ("enable_transmitter", 4)]
    
# Function to return a MMIO Getter and Setter based on a relative address
def _create_mmio_property(addr):
    def _get(self):
        return self.read(addr)
        
    def _set(self, value):
        self.write(addr, value)
            
    return property(_get, _set)
    
# Generate getters and setters based on _bpskTransmitter_props
for (name, addr) in _bpskTransmitter_props:
    setattr(BpskTransmitterCore, name, _create_mmio_property(addr))