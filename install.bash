#!/bin/bash
## created using the PlexConnect bash files for installing the daemon
InstallerPath=$(PWD)
CurrentUser=$(USERS)
findme="forever-agent"
echo
echo
## check if NPM Forever agent is installed
file=$(npm list | grep $findme)

if [ -z "$file" ]
then
	echo "$findme not found."
  echo Installing Forever agent
  npm install -g forever
else
	echo "Forever agent found"
fi


echo -------------------------------
## create autostart plist for next boot
echo 'Installing Homebridge-Daemon...'
echo Install from: $InstallerPath
echo -------------------------------
echo

## Copy the bash file used in the PList file to launch Homebridge through Forever
##cp ${InstallerPath}/homebridge-daemon.bash /usr/local/bin/homebridge-daemon.bash


## Modify the VAR names in the PList file and save it in the Library directory
sed -e "s/__CURRENTUSER__/${CurrentUser}/" "${InstallerPath}/org.homebridge.daemon.plist" > ~/Library/LaunchAgents/org.homebridge.daemon.plist

## Copy directly to the /Library/LaunchDameons folder
##cp ${InstallerPath}/org.homebridge.daemon.plist ~/Library/LaunchAgents/org.homebridge.daemon.plist

## change ownership and permissions of the plist file to make it launchctl compatible
##chmod 755 /usr/local/bin/homebridge-daemon.bash
chmod 0700 ~/Library/LaunchAgents/org.homebridge.daemon.plist
##chown root ~/Library/LaunchAgents/org.homebridge.daemon.plist

## start Homebridge-Daemon for this session
echo 'Starting Homebridge-Daemon...'
echo
## launch the plist so that we can use it without a reboot
launchctl load ~/Library/LaunchAgents/org.homebridge.daemon.plist
## sh /usr/local/bin/forever-homebridge.bash

## wait a couple seconds to allow Homebridge to load
sleep 5

## display the running status of Homebridge
echo   - below the running status of Homebridge-daemon.
echo   - if nothing appears, the daemon is not launched
echo
launchctl list | grep org.homebridge.daemon
echo
echo display if Homebridge has been started with Forever:
forever list | grep "Homebridge"
echo
## end
