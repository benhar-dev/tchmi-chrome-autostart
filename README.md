# tchmi-chrome-autostart (NetArg.bat)

## How to auto start Chrome when TwinCAT HMI Server starts
In most instances the user will want Chrome to auto start when their IPC first boots. We run into an issue whereby placing the Chrome shortcut in the same startup folder as the server could result in Chrome starting first. This leads to the user being shown an "Unable to load page" warning. If the user has Chrome set on Kiosk mode then there is no way to recover from this.

## Previous solutions
Some methods have involved running Chrome after a time delay. With all time delays this is not a preferred solution. If the timer is too short, the problem remains. If the timer is too long then this impacts the loading time of the machine / device.

## Recommended solution
NetArg.bat checks for a listening port on TcHMI Server. If found then this triggers Chrome to start.

### Use
If you run NetArg.bat with no arguments then by default it will use the following settings,
```
C:\NetArg.bat
```

is the same as
```
C:\NetArg.bat "ip=127.0.0.1" "port=1010" "application="C:\Program Files (x86)\Google\Chrome\Application\chrome.
exe"" "arguments=--kiosk http://127.0.0.1:1010 --incognito --disable-pinch --overscroll-history-navigation=0 --
no-user-gesture-required" "restart=n"
```

### Twincat Startup Shortcut
You must not place the NetArg.bat file directly in the C:\TwinCAT\3.1\Target\Startup folder.
We recommend placing the NetArg.bat file in the user documents folder. Right click and select "Create Shortcut". Then place the shortcut in to the Twincat startup directory alongside the shortcut for TwinCAT Hmi Server.

You can start NetArg.bat hidden by opening the shortcut properties and change the parameter Run to Minimized.

### Configuration
You can change any of the defaults by supplying any number of them on the command line.
```
Changing IP address of the server.
C:\NetArg.bat "ip=10.0.0.8"

Changing port of the server.
C:\NetArg.bat "port=1020"

Changing IP address and port of the server.
C:\NetArg.bat "ip=10.0.0.8" "port=1020"

Changing the launching application (Remember the double quotes)
C:\NetArg.bat "application="C:\Program Files\Google\Chrome\Application\chrome.exe"

Changing the launching application arguments
C:\NetArg.bat "arguments=--kiosk http://www.google.com"

Restart the application if the user shuts it down.
C:\NetArg.bat "restart=y"
```
