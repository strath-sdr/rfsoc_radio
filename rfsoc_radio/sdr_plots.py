__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_radio"

import numpy as np
import plotly.graph_objs as go
import ipywidgets as ipw
from contextlib import contextmanager

                
class SpectrumAnalyser():
    def __init__(self,
                 data,
                 fs,
                 animation_period=50,
                 width=800,
                 height=400,
                 autosize=True):
        """Create a new Spectrum Analyser object for plotting frequency against power."""
        
        self._fs = fs
        self._data = self._data = [{'y' : self._fft_psd(data, self._fs),
                                    'name' : 'IQ Freq (dB)'}]
        self._animation_period = animation_period
        self._width = width
        self._height = height
        self._yaxisrange = [-150, -50]
        lim = int(self._fs/2)
        self._xaxisrange = [-lim, lim - (self._fs/len(data))]
        self._autosize = autosize
        self._complex = isinstance(data[0], complex)
        
        self._layout = {
            'height' : self._height,
            'width' : self._width,
            'autosize' : True,
            'xaxis' : {
                'range' : self._xaxisrange,
                'title' : 'Frequency (Hz)',
            },
            'yaxis' : {
                'title' : 'Log Scale Power Spectra (dB)',
            },
            'title' : 'Frequency Spectrum'
        }
        
        self._plot = go.FigureWidget(
            layout = self._layout,
            data = self._data
        )
        
        self._plot.layout.xaxis.range = self._xaxisrange
        self._plot.data[0].x = [x for x in np.arange(-lim, lim, (self._fs/len(data)))]
        
    def _fft_psd(self, data, fs):
        fft = np.fft.fftshift(np.fft.fft(data))
        mag = np.array([abs(y)**2/(len(fft)) for y in fft])
        with np.errstate(divide='ignore'):
            psd = 10 * np.where(mag>0, np.log10(mag), 0)
        return psd
    
    def set_frequency(self, fs):
        self._fs = fs
    
    def update_data(self, data):
        lim = int(self._fs/2)
        self._xaxisrange = [-lim, lim - (self._fs/len(data))]
        self._plot.layout.xaxis.range = self._xaxisrange
        self._data = self._fft_psd(data, self._fs)
        self._plot.data[0].y = self._data
        self._plot.data[0].x = [x for x in np.arange(-lim, lim, (self._fs/len(data)))]
            
    def get_widget(self):
        return self._plot    
        

class TimePlot():
    def __init__(self,
                 data,
                 sample_frequency=100e3,
                 animation_period=50,
                 width=800,
                 height=400,
                 autosize=True):
        """Create a new plot object for plotting data against time."""
        
        self._data = np.empty(len(data))
        self._sample_frequency = sample_frequency
        self._animation_period = animation_period
        self._width = width
        self._height = height
        self._yaxisrange = [-0.6, 0.6]
        self._autosize = autosize
        self._complex = isinstance(data[0], complex)
        
        if self._complex:
            self._data = [{'y' : np.real(data),
                           'x' : np.arange(0, len(data)/sample_frequency, 1/sample_frequency),
                           'name' : 'In-Phase Signal'},
                          {'y' : np.imag(data),
                           'x' : np.arange(0, len(data)/sample_frequency, 1/sample_frequency),
                           'name' : 'Quadrature Signal'}]
        else:
            self._data = [{'y' : data, 'name' : 'Time Signal',
                           'x' : np.arange(0, len(data)/sample_frequency, 1/sample_frequency)}]
        
        self._layout = {
            'height' : self._height,
            'width' : self._width,
            'autosize' : True,
            'xaxis' : {
                'title' : 'Seconds (s)',
            },
            'yaxis' : {
                'title' : 'Amplitude',
            },
            'title' : 'Time Domain Signal'
        }
        
        self._plot = go.FigureWidget(
            layout = self._layout,
            data = self._data
        )
        
    @property
    def sample_frequency(self):
        return self._sample_frequency
    
    @sample_frequency.setter
    def sample_frequency(self, value):
        self._sample_frequency = value
        
    def set_axisrange(self, axisrange):
        self._yaxisrange = axisrange
        self._plot.layout.yaxis.range = axisrange
        
    def update_data(self, data):
        """Update the frame of data currently on the canvas
        """
        #self._xaxisrange = [0, len(data)/self._sample_frequency-1/self._sample_frequency]
        #self._plot.layout.xaxis.range = [-0.5, self._xaxisrange-0.5]
        
        if self._complex:
            self._data = [{'y' : np.real(data),
                           'x' : np.arange(0, len(data)/self._sample_frequency, 1/self._sample_frequency)},
                          {'y' : np.imag(data),
                           'x' : np.arange(0, len(data)/self._sample_frequency, 1/self._sample_frequency)}]
        else:
            self._data = [{'y' : data,
                           'x' : np.arange(0, len(data)/self._sample_frequency, 1/self._sample_frequency)}]

        self._plot.data[0].y = self._data[0].get('y')
        self._plot.data[0].x = self._data[0].get('x')
        if self._complex:
            self._plot.data[1].y = self._data[1].get('y')
            self._plot.data[1].x = self._data[1].get('x')
                
    def get_widget(self):
        return self._plot

    
class ConstellationPlot():
    def __init__(self,
                 data,
                 animation_period=50,
                 height=400,
                 width=400,
                 autosize=True):
        """Creates a new plot object for plotting IQ constellations."""
        
        self._data = data
        self._animation_period = 50
        self._width = width
        self._height = height
        self._axisrange = [-1.2, 1.2]
        self._autosize = autosize
        self._complex = isinstance(self._data[0], complex)
        
        if not self._complex:
            raise Exception('Input data is not of type complex.')
        
        self._layout = {
            'hovermode' : 'closest',
            'height' : self._height,
            'width' : self._width,
            'autosize' : self._autosize,
            'xaxis' : {
                'range' : self._axisrange,
                'title' : 'In-phase Amplitude'
            },
            'yaxis' : {
                'range' : self._axisrange,
                'title' : 'Quadrature Amplitude'
            },
            'title' : 'Constellation Plot'
        }
        
        self._plot = go.FigureWidget(
            layout = self._layout,
            data = [{
                'mode' : 'markers',
                'x' : np.real(self._data),
                'y' : np.imag(self._data)
            }])
        
    def set_axisrange(self, axisrange):
        self._axisrange = axisrange
        self._plot.layout.yaxis.range = axisrange
        self._plot.layout.xaxis.range = axisrange
        
    def update_data(self, data):
        """Update the frame of data currently on the canvas
        """
        
        if not isinstance(data[0], complex):
            raise Exception('Input data is not of type complex.')
            
        if len(data) > 8:
            step = int(len(data)/8)
            self._data = data[::step]
        else:
            self._data = data
        
        self._plot.data[0].update({'x' : np.real(self._data),
                                   'y' : np.imag(self._data)})        
        
    def get_widget(self):
        return self._plot
