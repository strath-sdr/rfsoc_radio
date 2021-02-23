from pynq import Overlay
from pynq import allocate
import xrfclk
import xrfdc
import os
import numpy as np
import ipywidgets as ipw
import time
import rfsoc_radio.quick_widgets as qw

# Import overlay specific drivers
from .bpsk_receiver import *
from .bpsk_transmitter import *
from .data_inspector import *

class BpskOverlay(Overlay):
    
    def __init__(self, bitfile_name=None, init_rf_clks=True, **kwargs):
        
        # Generate default bitfile name
        if bitfile_name is None:
            this_dir = os.path.dirname(__file__)
            bitfile_name = os.path.join(this_dir, 'bitstream', 'rfsoc_radio.bit')
            
        # Set FPD and LPD interface widths
        from pynq import MMIO
        fpd_cfg = MMIO(0xfd615000, 4)
        fpd_cfg.write(0, 0x00000A00)
        lpd_cfg = MMIO(0xff419000, 4)
        lpd_cfg.write(0, 0x00000000)
        
        # Create Overlay
        super().__init__(bitfile_name, **kwargs)
        
        # Extract friendly dataconverter names
        self.rf = self.usp_rf_data_converter
        self.dac_tile = self.rf.dac_tiles[1]
        self.dac_block = self.dac_tile.blocks[2]
        self.adc_tile = self.rf.adc_tiles[0]
        self.adc_block = self.adc_tile.blocks[0]
        
        # Start up LMX clock
        if init_rf_clks:
            xrfclk.set_all_ref_clks(409.6)
            
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
        self.receiver = bpsk_receiver.BpskReceiver(self.axi_dma_rx, self.bpsk_receiver, self.DataInspector) # The receiver is coupled with an inspector
        self.transmitter = bpsk_transmitter.BpskTransmitter(self.axi_dma_tx, self.bpsk_transmitter)
        
        # Receiver setup requirements - pull resets low
        self.receiver.controller.reset_time_sync = 0
        self.receiver.controller.reset_phase_sync = 0
        self.receiver.controller.reset_frame_sync = 0
        
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
            buttons[i] = qw.Button(description=desc_b[i],
                                   state=True,
                                   callback=dashboard_callback,
                                   button_id=i)
            
        # Create float text objects for entering the ADC & DAC mixer frequencies
        adc_fc = ipw.FloatText(
            value=64,
            description='ADC Frequency:',
            style={'description_width': 'initial'},
            disabled=False
        )
        dac_fc = ipw.FloatText(
            value=64,
            description='DAC Frequency:',
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
                                str(self.receiver.controller.freq_offset))

        return ipw.VBox(children=[ipw.Label('Radio Dashboard'),
                         ipw.HBox(children=[dac_fc,
                                            buttons[0].get_widget()],
                                  layout=layout),
                         ipw.HBox(children=[adc_fc,buttons[1].get_widget(),
                                            buttons[2].get_widget(),
                                            buttons[3].get_widget(),
                                            buttons[4].get_widget()], 
                                  layout=layout),
                                  freq_label
                                 ],
                        layout=layout
                       )