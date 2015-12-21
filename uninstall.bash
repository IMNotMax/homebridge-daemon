#!/bin/bash

## remove autostart plist, stop processes
echo 'Uninstalling Homebridge Daemon...'

## unload plist
launchctl unload /Library/LaunchDaemons/org.homebridge.daemon.plist
forever stop /usr/local/bin/homebridge

## remove autostart plist from the /Library/LaunchDameons folder
rm /Library/LaunchDaemons/org.homebridge.daemon.plist

## remove the bash file used to launch the daemon
rm /usr/local/bin/homebridge-daemon.bash

## display the running status of Homnebridge Daemon
launchctl list | grep org.homebridge.daemon
