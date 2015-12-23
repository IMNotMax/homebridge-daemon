#!/bin/bash

## remove autostart plist, stop processes
echo 'Uninstalling Homebridge Daemon...'
echo
echo First unload the Daemon
## unload plist
launchctl unload ~/Library/LaunchAgents/org.homebridge.daemon.plist
##forever stop /usr/local/bin/homebridge
echo done.
echo
echo Then remove files
## remove autostart plist from the /Library/LaunchDameons folder
rm ~/Library/LaunchAgents/org.homebridge.daemon.plist
echo done.
## remove the bash file used to launch the daemon
##rm /usr/local/bin/homebridge-daemon.bash
echo if a line appears below, please uninstall again
## display the running status of Homnebridge Daemon
launchctl list | grep org.homebridge.daemon
