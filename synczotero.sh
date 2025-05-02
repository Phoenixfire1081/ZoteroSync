#!/bin/bash

# First, check if any command line argument is entered

if [ $# -lt 1 ]; then
	
	echo "Usage: bash synczotero.sh {pull|push}"
	echo "pull|push - to pull|push data from|to server"
	exit 1
	
fi

directory_name="Zotero"
current_path="$(pwd)"

# Set the server information
username="username"
hostname="serverIP"
hostpath="/path/to/Zotero/"
hostpathpush="/path/to/" # Similar to hostpath without Zotero

echo "Script is operating at path:$current_path"

# If directory exists, move contents to Zotero-old
# If not, create a new one (for first use)
# If Zotero-old exists from a previous run, remove it. 

if [ $1 == "pull" ]; then

	if [ -d "$directory_name" ]; then

		echo "$directory_name folder already exists. Attempting to move it to $directory_name old."
		
		# Check if Zotero-old already exists
		
		if [ -d "$directory_name-old" ]; then
		
			echo "$directory_name-old folder already exists. Attempting to remove it."
			rm -rf "$directory_name-old"
			echo "Removed $directory_name-old"
		
		fi
		
		# Rename folder as a backup
		
		cp -R "$directory_name" "$directory_name-old"
		echo "Copied folder contents to $directory_name-old"
		
		# Use rsync to update the folder from server

		echo "Running rsync"
		rsync -avz --progress "${username}@${hostname}:${hostpath}" "$current_path/$directory_name"
		echo "Sync complete"
			
	else
		
		# For first time use, create the folder at start
		
		echo "$directory_name folder doesn't exist. Attempting to create one."
		mkdir "$directory_name"
		echo "Created $directory_name at $(pwd)"
		
		# Use rsync to copy the folder from server

		echo "Running rsync"
		rsync -avz --progress "${username}@${hostname}:${hostpath}" "$current_path/$directory_name"
		echo "Sync complete"

	fi

elif [ $1 == "push" ]; then

	# Use rsync to make changes to hostpath in server
	# In case of corruption in server, restore backup from Zotero-old in local machine
	
	echo "Running rsync"
	rsync -avz --progress "$current_path/$directory_name" "${username}@${hostname}:${hostpathpush}"
	echo "Sync complete"

else

	echo "Unknown argument"
	echo "Usage: bash synczotero.sh {pull|push}"
	echo "pull|push - to pull|push data from|to server"
	exit 1

fi
