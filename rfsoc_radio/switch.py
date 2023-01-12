__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_radio"

from pynq import DefaultIP

class Switch(DefaultIP):
    def __init__(self, description):
        super().__init__(description=description)
        self._si_slots = int(description['parameters']['C_NUM_SI_SLOTS'])
        self._mi_slots = int(description['parameters']['C_NUM_MI_SLOTS'])
        
    bindto = ["xilinx.com:ip:axis_switch:1.1"]
        
    @property
    def _control(self):
        return self.read(0x00)
    
    @_control.setter
    def _control(self, value):
        self.write(0x00, value)
        
    @property
    def master_mux(self):
        reg = []
        for mi in range(self._mi_slots):
            temp = self.read(0x40+mi*4)
            if temp == 0x80000000:
                temp = 0
            reg.append(temp)
        return reg
    
    @master_mux.setter
    def master_mux(self, value):
        if len(value) != self._mi_slots:
            raise ValueError(''.join(["Master Mux expects a list of size ", str(self._mi_slots)]))
        for mi in range(self._mi_slots):
            if value[mi] >= self._si_slots:
                raise ValueError(''.join(["Master Mux expects elements less than ", str(self._si_slots)]))
            if value[mi] < 0:
                value[mi] = 0x80000000
            self.write(0x40+mi*4, value[mi])
        self.update_switch()
        
    def update_switch(self):
        reg = self._control
        reg |= 0x00000002
        self._control = reg
        