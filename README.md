# tchmi-chrome-autostart (StartTcHmiServer.bat)

## How to auto start Chrome when TwinCAT HMI Server starts
In most instances the user will want Chrome to auto start when their IPC first boots. We run into an issue whereby placing the Chrome shortcut in the same startup folder as the server could result in Chrome starting first. This leads to the user being shown an "Unable to load page" warning. If the user has Chrome set on Kiosk mode then there is no way to recover from this.

## Previous solutions
Some methods have involved running Chrome after a time delay. With all time delays this is not a preferred solution. If the timer is too short, the problem remains. If the timer is too long then this impacts the loading time of the machine / device.

## Recommended solution
StartTcHmiServer.bat first starts TcHMI Server and then checks for a listening port before triggering Chrome to start.

### Use
If you run StartTcHmiServer.bat with no arguments it will use the following settings by default,
```
C:\StartTcHmiServer.bat
```

Default
```
server="C:\TwinCAT\Functions\TF2000-HMI-Server\TcHmiSrv.exe"
serverParams="--extensionDir=""all=C:\TwinCAT\Functions\TF2000-HMI-Server"""
serverWorkingDirectory="C:\ProgramData\Beckhoff\TF2000 TwinCAT 3 HMI Server"
clearHistorize=n
historizeDb="historize.db"
historizeDbJournal="historize.db-journal"
ip=127.0.0.1
port=1010
application="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
arguments= --kiosk http://127.0.0.1:1010 --incognito --disable-pinch --overscroll-history-navigation=0 --no-user-gesture-required
restart=n
```

### Twincat Startup Shortcut
You must not place the StartTcHmiServer.bat file directly in the C:\TwinCAT\3.1\Target\Startup folder.
We recommend placing the StartTcHmiServer.bat file in the user documents folder. Right click and select "Create Shortcut". Then place the shortcut in to the Twincat startup directory.

### Configuration
You can change any of the defaults by supplying any number of them from the list above on the command line.
```
Changing IP address of the server.
C:\StartTcHmiServer.bat "ip=10.0.0.8"

Changing port of the server.
C:\StartTcHmiServer.bat "port=1020"

Changing IP address and port of the server.
C:\StartTcHmiServer.bat "ip=10.0.0.8" "port=1020"

Changing the launching application (Remember the double quotes)
C:\StartTcHmiServer.bat "application="C:\Program Files\Google\Chrome\Application\chrome.exe"

Changing the launching application arguments
C:\StartTcHmiServer.bat "arguments=--kiosk http://www.google.com"

Restart the application if the user shuts it down.
C:\StartTcHmiServer.bat "restart=y"

Delete the historize data before starting the server.
C:\StartTcHmiServer.bat "clearHistorize=y"
```

### Running hiden
You can use the supplied RunHidden.vbs to execute the BAT file if you wish the whole process to remain hidden from the user. 

```
Changing IP address and port of the server while starting hidden.
C:\RunHidden.vbs StartTcHmiServer.bat "ip=10.0.0.8" "port=1020"
'''
