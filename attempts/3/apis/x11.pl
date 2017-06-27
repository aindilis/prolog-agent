%% xautomation

%% xte

       %% A summary of options is included below.

       %% -i id  XInput 2.x device to use. List devices with 'xinput list'.

       %% -x display
       %%        Send  commands  to  remote X server. Note that some commands may not work correctly unless the display is on the console, e.g. the display is
       %%        currently controlled by the keyboard and mouse and not in the background. This seems to be a limitation of the XTest extension.

       %% --help, -h
       %%        Show summary of options.

       %% key k  Press and release key k
       %% keydown  k
       %%        Press key k down
       %% keyup k
       %%        Release key k
       %% str string
       %%        Do a bunch of key X events for each char in string
       %% mouseclick i
       %%        Click mouse button i
       %% mousemove x y
       %%        Move mouse to screen position x, y
       %% mousermove x y
       %%        Move mouse relative from current location by x, y
       %% mousedown i
       %%        Press mouse button i down
       %% mouseup i
       %%        Release mouse button i
       %% sleep x
       %%        Sleep x seconds
       %% usleep x
       %%        Usleep x microseconds


%% xdotool