#!/bin/bash

# change this to your prefered backup destination
backup_target_dir=$HOME/backups


echo "Initiating backups.."

if [[ ! -e "$backup_target_dir" ]]; then 

	echo "Creating backup directory tree.."
	sleep 1
	mkdir -p "$backup_target_dir"/etc
	mkdir "$backup_target_dir"/user_config
	mkdir "$backup_target_dir"/boot_files
	touch "$backup_target_dir"/exclude_files.txt # add to this txt file, the paths of the files you want to exclude.
	sleep 1
		
fi

echo "Backing up /etc ..."
sleep 1
sudo rsync -va -delete --exclude-from="$backup_target_dir"/exclude_files.txt /etc/ "$backup_target_dir"/etc/
echo

echo "Backing up /boot ..."
sleep 1
sudo rsync -va -delete --exclude-from="$backup_target_dir"/exclude_files.txt /boot/ "$backup_target_dir"/boot_files
echo

if [[ -e $HOME/.config ]]; then
	 
	echo "Backing up user configuration files ..."
	sleep 1
	rsync -va -delete --exclude-from="$backup_target_dir"/exclude_files.txt $HOME/.config "$backup_target_dir"/user_config
	echo

fi
