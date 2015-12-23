#!/bin/bash

## stop and restart processes
echo 'Restarting Homebridge Daemon...'
echo '---------------------------------'

echo 'Stopping Daemon'
## unload plist
launchctl unload ~/Library/LaunchAgents/org.homebridge.daemon.plist
forever stop /usr/local/bin/homebridge

echo 'Starting Daemon'
## unload plist
launchctl load ~/Library/LaunchAgents/org.homebridge.daemon.plist

## wait a second to allow Homebridge to load
sleep 5

## display the running status of Homebridge

launchctl list | grep org.homebridge.daemon.plist
