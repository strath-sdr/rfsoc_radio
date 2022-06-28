__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_radio"

from pynq import Overlay
from pynq import allocate
import xrfclk
import xrfdc
import os
import numpy as np
import ipywidgets as ipw
import time

# Import overlay specific drivers
from .quick_widgets import Button, TransmitTerminal, ReceiveTerminal
from .bpsk_receiver import BpskReceiver
from .bpsk_transmitter import BpskTransmitter
from .data_inspector import *


class BpskOverlay(Overlay):
    
    def __init__(self, bitfile_name=None, init_rf_clks=True, **kwargs):
        
        # Generate default bitfile name
        if bitfile_name is None:
            this_dir = os.path.dirname(__file__)
            bitfile_name = os.path.join(this_dir, 'bitstream', 'rfsoc_radio.bit')
            
        # Create Overlay
        super().__init__(bitfile_name, **kwargs)

        # Initialise I2C
        self.init_i2c()
        
        # Extract friendly dataconverter names
        self.rf = self.usp_rf_data_converter
        self.dac_tile = self.rf.dac_tiles[2]
        self.dac_block = self.dac_tile.blocks[0]
        self.adc_tile = self.rf.adc_tiles[2]
        self.adc_block = self.adc_tile.blocks[1]
        
        # Start up LMX clock
        if init_rf_clks:
            xrfclk.set_ref_clks(245.76, 409.6)
            
        # Set DAC defaults
        self.dac_tile.DynamicPLLConfig(1, 409.6, 1024)
        self.dac_block.NyquistZone = 1
        self.dac_block.MixerSettings = {
            'CoarseMixFreq'  : xrfdc.COARSE_MIX_BYPASS,
            'EventSource'    : xrfdc.EVNT_SRC_IMMEDIATE,
            'FineMixerScale' : xrfdc.MIXER_SCALE_1P0,
            'Freq'           : 64,
            'MixerMode'      : xrfdc.MIXER_MODE_C2R,
            'MixerType'      : xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset'    : 0.0
        }
        self.dac_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.dac_tile.SetupFIFO(True)
        
        # Set ADC defaults
        self.adc_tile.DynamicPLLConfig(1, 409.6, 1024)
        self.adc_block.NyquistZone = 1
        self.adc_block.MixerSettings = {
            'CoarseMixFreq'  : xrfdc.COARSE_MIX_BYPASS,
            'EventSource'    : xrfdc.EVNT_SRC_TILE,
            'FineMixerScale' : xrfdc.MIXER_SCALE_1P0,
            'Freq'           : 64,
            'MixerMode'      : xrfdc.MIXER_MODE_R2C,
            'MixerType'      : xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset'    : 0.0
        }
        self.adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.adc_tile.SetupFIFO(True)
        
        # Obtain friendly names for IP Cores and associated drivers
        self.receiver = BpskReceiver(self.axi_dma_rx, self.bpsk_receiver, self.DataInspector) # The receiver is coupled with an inspector
        self.transmitter = BpskTransmitter(self.axi_dma_tx, self.bpsk_transmitter)
        
        # Receiver setup requirements - pull resets low
        self.receiver.controller.reset_time_sync = 0
        self.receiver.controller.reset_phase_sync = 0
        self.receiver.controller.reset_frame_sync = 0

    def init_i2c(self):
        """Initialize the I2C control drivers on RFSoC2x2.
        This should happen after a bitstream is loaded since I2C reset
        is connected to PL pins. The I2C-related drivers are made loadable
        modules so they can be removed or inserted."""
        module_list = ['i2c_dev', 'i2c_mux_pca954x', 'i2c_mux']
        for module in module_list:
            cmd = "if lsmod | grep {0}; then rmmod {0}; fi".format(module)
            ret = os.system(cmd)
            if ret:
                raise RuntimeError(
                    'Removing kernel module{} failed.'.format(module))
                
        module_list.reverse()
        for module in module_list:
            cmd = "modprobe {}".format(module)
            ret = os.system(cmd)
            if ret:
                raise RuntimeError(
                    'Inserting kernel module {} failed.'.format(module))
        
    def dashboard(self):
        
        def dashboard_callback(value, button_id = 0):
            if button_id == 0:
                self.transmitter.controller.enable_transmitter = int(value)
            elif button_id == 1:
                self.receiver.controller.coarse_passthrough = int(not value)
            elif button_id == 2:
                self.receiver.controller.reset_time_sync = int(not value)
            elif button_id == 3:
                self.receiver.controller.reset_phase_sync = int(not value)
            elif button_id == 4:
                self.receiver.controller.reset_frame_sync = int(not value)
            else:
                pass
            
        def adc_callback(change):
            self.adc_block.MixerSettings["Freq"] = change['new']
            self.adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
            freq_label.value = 'Reported Frequency Offset: ' + \
                                str(self.receiver.controller.freq_offset)
            
        def dac_callback(change):
            self.dac_block.MixerSettings["Freq"] = change['new']
            self.dac_block.UpdateEvent(xrfdc.EVENT_MIXER)
            freq_label.value = 'Reported Frequency Offset: ' + \
                                str(self.receiver.controller.freq_offset)
        
        # Create button descriptions
        desc_b = ['Transmit Enable', 
                  'Coarse Sync', 
                  'Time Sync', 
                  'Carrier Sync', 
                  'Frame Sync']
        
        buttons = [None]*5
        widgets = [None]*5
        
        # Create buttons
        for i in range(5):
            buttons[i] = Button(description=desc_b[i],
                                state=True,
                                callback=dashboard_callback,
                                button_id=i)
            
        # Create float text objects for entering the ADC & DAC mixer frequencies
        adc_fc = ipw.FloatText(
            value=64,
            description='ADC Frequency (MHz):',
            style={'description_width': 'initial'},
            disabled=False
        )
        dac_fc = ipw.FloatText(
            value=64,
            description='DAC Frequency (MHz):',
            style={'description_width': 'initial'},
            disabled=False
        )
        adc_fc.observe(adc_callback, names='value')
        dac_fc.observe(dac_callback, names='value')
        
        layout = ipw.Layout(display='inline-flex',
                justify_content='flex-start',
                align_items='flex-start',
                align_content='flex-start')
        
        freq_label =  ipw.Label('Reported Frequency Offset: ' + \
                                str(self.receiver.controller.freq_offset) + \
                                    ' Hz')

        button_container = ipw.VBox([ipw.HBox([buttons[1].get_widget(), buttons[2].get_widget()]),
                               ipw.HBox([buttons[3].get_widget(), buttons[4].get_widget()])])

        dashboard = ipw.VBox(children=[
                         ipw.HBox(children=[dac_fc,
                                            buttons[0].get_widget()],
                                  layout=layout),
                         ipw.HBox(children=[adc_fc,
                                            button_container], 
                                  layout=layout),
                                  freq_label
                                 ],
                        layout=layout
                       )

        dashboard_accordion = ipw.Accordion(children=[dashboard])
        dashboard_accordion.set_title(0, 'System Control')
        
        return dashboard_accordion

    def _bpsk_radio_generator(self):
        sidebar = ipw.VBox([self.dashboard(), self.receiver.visualise()])
        msgbar = ipw.VBox([self.transmitter.terminal(), self.receiver.terminal()])
        return ipw.HBox([sidebar, msgbar])

    def bpsk_radio_application(self):
        return self._bpsk_radio_generator()
