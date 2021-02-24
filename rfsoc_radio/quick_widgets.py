__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_radio"

import ipywidgets as ipw


class DropdownMenu():
    """Creates a new drop-down widget.
    """
    def __init__(self, options, name, init_value):
        super().__init__()
        
        self._dropdown_menu = ipw.Dropdown(
            options=options,
            value=init_value,
            description=name,
            style={'description_width': 'initial'},
            disabled=False
        )
            
    def get_widget(self):
        return self._dropdown_menu

    
class ImageViewer():
    """Creates a new image viewer widget for display an image in bytes format.
    Useful for updating an image inline with Jupyter Labs.
    """
    def __init__(self, description='Image Viewer', 
                 width='200px', height='200px'):
        super().__init__()
        
        # Create a label object to act as a description for the image
        self._title = ipw.Label(
            value=description)
        
        # Create the image viewer object to display an image
        self._image_viewer = ipw.Image(
            format='png',
            width=width,
            height=height)
        
    def update(self, image):
        if isinstance(image, (bytes,bytearray)):
            self._image_viewer.value = image
        else:
            raise ValueError('Image should be given in bytes.')
        
    def get_widget(self):
        return ipw.VBox([self._title, self._image_viewer])


class TransmitTerminal():
    """Creates a new textbox area widget that should be interacted with by the user.
    The textbox area is primarily used to display text. Buttons are used to control
    whether the text is written to the textbox area through self._listening. A clear 
    button is provided to clear the text from the textbox area.
    """
    def __init__(self, description='Terminal', height='200px', width='400px'):
        super().__init__()

        # Create the text area object that acts as a terminal
        self._text_terminal = ipw.Textarea(
            value='',
            placeholder='',
            description='',
            layout={'height' : height, 'width' : width},
            disabled=False
        )

        # Create label for terminal description
        self._label_terminal = ipw.Label(
            value=description,
            style={'description_width': 'initial'},
        )
        
        self.callback = []
        
        # Create a start button to enable listening
        self._start_button = ipw.Button(description='Send',
                                  layout=ipw.Layout(margin='auto',
                                                    border='solid white'))
        self._start_button.on_click(lambda _: self.start())
        self._start_button.style.button_color = 'lightgray'

        # Create a clear button for our text terminal
        self._clear_button = ipw.Button(description='Clear', 
                                        layout=ipw.Layout(margin='auto',
                                                          border='solid white'))
        self._clear_button.on_click(lambda _: self.clear())
        self._clear_button.style.button_color = 'lightgray'

        # Create accordion
        self._accordion = ipw.Accordion(children=[
            ipw.HBox([ipw.VBox([self._text_terminal]),
                      ipw.VBox([self._start_button,
                                self._clear_button],
                                layout=ipw.Layout(align_self='flex-start'))
                      ])
            ])
        self._accordion.set_title(0, description)
        
    def value(self):
        return self._text_terminal.value
    
    def clear(self):
        self._text_terminal.value = ''
        
    def start(self):
        self._start_button.style.button_color = 'lightgreen'
        for callback in self.callback:
            callback()
        self._start_button.style.button_color = 'lightgray'
        
    def get_widget(self):
        return self._accordion

    
class ReceiveTerminal():
    """Creates a new textbox area widget that should not be interacted with by user.
    The textbox area is primarily used to display text. Buttons are used to control
    whether the text is written to the textbox area through self._listening. A clear 
    button is provided to clear the text from the textbox area.
    """
    def __init__(self, description='Terminal', height='200px', width='400px'):
        super().__init__()

        # Create the text area object that acts as a terminal
        self._text_terminal = ipw.Textarea(
            value='',
            placeholder='',
            description='',
            layout={'height' : height, 'width' : width},
            disabled=True
        )

        # Create label for terminal description
        self._label_terminal = ipw.Label(
            value=description,
            style={'description_width': 'initial'},
        )
        
        self._counter = 0
        self._auto_clear = True
        
        # Create a autoclear button for our text terminal
        self._auto_clear_button = ipw.Button(description='Auto Clear',
                                             layout=ipw.Layout(margin='auto',
                                                               border='solid white'))
        self._auto_clear_button.on_click(lambda _: self.autoclear())
        self._auto_clear_button.style.button_color = 'lightblue'
        
        # Create a clear button for our text terminal
        self._clear_button = ipw.Button(description='Clear', 
                                        layout=ipw.Layout(margin='auto',
                                                          border='solid white'))
        self._clear_button.on_click(lambda _: self.clear())
        self._clear_button.style.button_color = 'lightgray'
        
        # Create a start button to enable listening
        self._start_button = ipw.Button(description=u'\u25B6', 
                                  layout=ipw.Layout(margin='auto',
                                                    border='solid white'))
        self._start_button.on_click(lambda _: self.start())
        self._start_button.style.button_color = 'lightgray'
        
        # Create a stop button to disable listening
        self._stop_button = ipw.Button(description=u'\u25A0', 
                                 layout=ipw.Layout(margin='auto',
                                                   border='solid white'))
        self._stop_button.on_click(lambda _: self.stop())
        self._stop_button.style.button_color = 'tomato'
        
        # Set listening to false
        self._listening = False

        # Create Accordion
        self._accordion = ipw.Accordion(children=[
            ipw.HBox([ipw.VBox([self._text_terminal]),
            ipw.VBox([self._start_button, 
                      self._stop_button, 
                      self._clear_button,
                      self._auto_clear_button],
                      layout=ipw.Layout(align_self='flex-start'))
            ])
        ])
        self._accordion.set_title(0, description)
        
    def value(self):
        return self._text_terminal.value
    
    def append(self, value):
        if self._listening:
            if isinstance(value, str):
                if self._auto_clear and self._counter >= 10:
                    self.clear()
                    self._counter = 0
                self._text_terminal.value = self._text_terminal.value + value
                self._counter += 1
            else:
                raise ValueError('Terminal value must be a string.')
            
    def start(self):
        self._listening = True
        self._start_button.style.button_color = 'lightgreen'
        self._stop_button.style.button_color = 'lightgray'
        
    def stop(self):
        self._listening = False
        self._start_button.style.button_color = 'lightgray'
        self._stop_button.style.button_color = 'tomato'
        
    def clear(self):
        self._text_terminal.value = ('')
        self._counter = 0
        
    def autoclear(self):
        self._auto_clear = not self._auto_clear
        if self._auto_clear:
            self._auto_clear_button.style.button_color = 'lightblue'
        else:
            self._auto_clear_button.style.button_color = 'lightgray'            
        
    def get_widget(self):
        return self._accordion

    
class Button():
    def __init__(self, description, callback, state = True, button_id = 0):
        
        # Set the button state
        self._state = state
        
        # Set button ID
        self._button_id = button_id
        
        # The callback to be ran
        self._callback = callback
        
        # Create a button object
        self._button = ipw.Button(description=description,
                                  layout=ipw.Layout(margin='auto',
                                                    border='solid white'))
        self._button.on_click(lambda _: self.on_click())
        
        if self._state:
            self._button.style.button_color = 'lightgreen'
        else:
            self._button.style.button_color = 'tomato'
        
    def on_click(self):
        self._state = not self._state
        self._callback(value = self._state, button_id = self._button_id)
        if self._state:
            self._button.style.button_color = 'lightgreen'
        else:
            self._button.style.button_color = 'tomato'
            
    def get_widget(self):
        return self._button
