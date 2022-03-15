__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_radio"

import threading
import asyncio
import ipywidgets as ipw
import time

def default_callback():
    pass

class AsyncRadioRx():
    """Class for monitoring hardware interrupts and executing radio 
    data transfer functions for the receiver.
    """    
    def __init__(self, 
                 irq, 
                 irq_callback, 
                 func_callback = [default_callback]):
        """Create new asynchronous radio receiver class.
        """        
        self._interrupt = irq
        self._irq_callback = irq_callback
        self._loop = asyncio.get_event_loop()
        self.callback = func_callback
        self.is_running = False
        
    async def _wait(self):
        await self._interrupt.wait() # Wait for IRQ level
        self._irq_callback()
        await self._interrupt.wait() # Discard the next IRQ assertion
        
    def _do(self):
        while True:
            self.is_running = True
            future = asyncio.run_coroutine_threadsafe(self._wait(), self._loop)
            future.result()
            for i in range(len(self.callback)):
                self.callback[i]()
        
    def start(self):
        """Start the async irq routine."""
        thread = threading.Thread(target=self._do)
        thread.start()
        
    def get_widget(self):
        """Get ipywidget controls to stop and start the generator thread."""
        return self._start_button, self._stop_button
    
class AsyncRadioTx():
    """Class for executing radio data transfer functions for the transmitter.
    """    
    def __init__(self,
                 rate = 1,
                 callback=[default_callback],
                 timer_callback=default_callback):
        """Create new radio transmitter class
        """
        self._timer_callback = timer_callback
        self.callback = callback
        self.is_running = False
        self._stopping = True
        self.rate = rate
        
    def _do(self):
        while not self._stopping:
            next_timer = time.time() + self.rate
            self._timer_callback()
            for i in range(len(self.callback)):
                self.callback[i]()
            sleep_time = next_timer - time.time()
            if sleep_time > 0:
                time.sleep(sleep_time)
            
    def start(self):
        if self._stopping:
            self._stopping = False
            self.is_running = True
            for i in range(len(self.callback)):
                self.callback[i]()
            self._thread = threading.Thread(target=self._do)
            self._thread.start()
            
    def stop(self):
        self._stopping = True
        self.is_running = False
