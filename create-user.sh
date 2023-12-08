#!/bin/bash

read -p "Enter a user name: " user

if [[ -n $(cut -d: -f1 /etc/passwd | grep -w $user) ]]; then

	echo "User $user already exists!"

else
	
	sudo useradd -m "$user"
	if [[ $? -eq 0 ]]; then echo "User $user was added successfully."; fi
	sleep 1
	
	read -p "Add $user to one or more groups? y/n : " choice
		
	if [[ choice=y || choice=yes  ]]; then
		PS3="Select an OPTION: "
		
		readarray -t grps< <(cut -d: -f1 /etc/group) 
		select choice in "Display all groups" "Create new group" "Add group to user" "Remove group from user" "Continue"
		do
		
			if [[ $REPLY -eq 1 ]]; then
				
				echo ${grps[@]}
				echo
					
			elif [[ $REPLY -eq 2 ]]; then
			
				read -p "Name of the new group: " new_grp
				sudo groupadd $new_grp
					
			elif [[ $REPLY -eq 3 ]]; then
				
				read -p "Select a group to add: " grp_add
				sudo usermod -a -G $grp_add $user
				
			elif [[ $REPLY -eq 4 ]]; then 
			
				echo "$user groups: $(groups $user)"
				read -p "Select a group to remove: " grp_rm
				sudo usermod -r -G $grp_rm $user
				
			else
			
				break;
			
			fi
		done
	fi
	echo
	echo "$user created."
	tail -n 1 /etc/passwd
		
fi
