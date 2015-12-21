#!/bin/bash

## stop and restart processes
echo 'Restarting Homebridge Daemon...'

## unload plist
launchctl unload /Library/LaunchDaemons/org.homebridge.daemon.plist
forever stop /usr/local/bin/homebridge

## unload plist
launchctl load /Library/LaunchDaemons/org.homebridge.daemon.plist

## wait a second to allow Homebridge to load
sleep 5

## display the running status of Homebridge

launchctl list | grep org.homebridge.daemon.plist
