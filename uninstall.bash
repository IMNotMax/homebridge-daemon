#!/bin/bash

## remove autostart plist, stop processes
echo 'Uninstalling Homebridge Daemon...'

## unload plist
launchctl unload /Library/LaunchDaemons/org.homebridge.daemon.plist

## remove autostart plist from the /Library/LaunchDameons folder
rm /Library/LaunchDaemons/org.homebridge.daemon.plist

## display the running status of Homnebridge Daemon
launchctl list | grep org.homebridge.daemon
