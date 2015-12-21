#!bin/bash
findme="forever-agent"
file=$(npm list | grep $findme)
##file="/etc/hosts"
if [ -z "$file" ]
then
	echo "$findme not found."
else
	echo "$findme found: $file"
fi
