# homebridge-daemon (not functional for me on OS X 10.7.5 - for the moment)
Script to run Homebridge as a daemon on OS X

##ToDo
Check if the NPM Forever Agent is previously installed to skip the install in `install.bash`

##Installation
Download the files on your Mac.

in Terminal:
Go to the directory you extract the zip
`$ chmod 777 install.bash`
This command allow all .bash file to be executed directly (with ./NameOfTheBashFile.bash)

Then:
`$ sudo ./install.bash`

if this command fails:
`$ sudo sh install.bash`


##Restarting Homebridge (if you modify the config.json file for example)

in Terminal:
Go to the directory you extract the zip
`$ chmod 777 restart.bash`
`$ sudo ./restart.bash`

if this command fails:
`$ sudo sh restart.bash`

##Uninstalling Homebridge as a daemon in OS X

in Terminal:
Go to the directory you extract the zip
`$ chmod 777 uninstall.bash`
`$ sudo ./uninstall.bash`

if this command fails:
`$ sudo sh uninstall.bash`

##Credits
All the scritps I've created are directly inspired by the [PlexConnect](https://github.com/iBaa/PlexConnect) OS X scripts
