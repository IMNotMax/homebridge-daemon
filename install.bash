#!/bin/bash
## created using the PlexConnect bash files for installing the daemon
InstallerPath=${PWD}
CurrentUser=${USERS}

echo -------------------------------
## create autostart plist for next boot
echo 'Installing Homebridge-Daemon...'
echo Install from: $InstallerPath
echo -------------------------------
echo   

## Copy directly to the /Library/LaunchDameons folder

cp ${InstallerPath}/org.homebridge.daemon.plist /Library/LaunchDaemons/org.homebridge.daemon.plist

## change ownership and permissions of the plist file to make it launchctl compatible
chown root /Library/LaunchDaemons/org.homebridge.daemon.plist
chmod 644 /Library/LaunchDaemons/org.homebridge.daemon.plist

## start Homebridge-Daemon for this session
echo 'Starting Homebridge-Daemon...'

## launch the plist so that we can use it without a reboot
launchctl load /Library/LaunchDaemons/org.homebridge.daemon.plist

## wait a couple seconds to allow Homebridge to load
sleep 5

## display the running status of Homebridge
echo   - below the running status of Homebridge-daemon.
echo   - if nothing appears, the daemon is not launched
echo  
launchctl list | grep org.homebridge.daemon
echo  
echo  
## end