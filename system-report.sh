#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
	echo "Run this command with sudo to get access to all files!!!"
	sleep 2
fi

################################################
# Change these values depending on the services you are using.
ssh_service="sshd"
sql_service="mssql-server"
web_service="apache2"

menu_items=("Services status"
			"Network info"
			"Hardware info"
			"Exit")

services=("SSH"
		  "SQL"
		  "Docker"
		  "Web"
		  "Back")
			
hardware=("CPU"
		  "Memory"
		  "USB"
		  "Devices"
		  "Disk"
		  "BIOS"
		  "Back")

PS3="Select an OPTION: "

select option in "${menu_items[@]}"; do
	case $option in
		"Services status")
			
			echo
			select service in "${services[@]}"; do
				case $service in
					"SSH")
						systemctl status "$ssh_service" | head -n 5
						echo
						;;
					"SQL")
						systemctl status "$sql_service" | head -n 5
						echo
						;;
					"Docker")
						systemctl status docker | head -n 5
						echo
						;;
					"Web")
						systemctl status "$web_service" | head -n 5
						;;
					"Back")
						break;
						;;
				esac
			done
			;;
						
		"Network info")
			echo
			echo "------------------------------------------------------------------------"
			ip route | head -n 1
			echo "------------------------------------------------------------------------"
			ss -tupan
			echo
			echo "------------------------------------------------------------------------"
			ping -q -w 3 8.8.8.8
			echo
			;;
			
		"Hardware info")
			
			echo
			select hw in "${hardware[@]}"; do
				case $hw in
					"CPU")
					    echo
						echo "------------------------------------------------------------------------"
						dmidecode --type processor
						echo
						;;
					"Memory")
						echo
						echo "------------------------------------------------------------------------"
						dmidecode --type memory
						echo
						;;
					"USB")
						echo
						echo "------------------------------------------------------------------------"
						findmnt | grep /dev
						echo "------------------------"
						df -hT | grep /dev/
						echo
						echo "(Run findmnt -p, to monitor changes)"
						echo
						;;
					"Devices")
						echo
						echo "------------------------------------------------------------------------"
						lspci -v
						echo
						;;
					"Disk")
						echo
						echo "------------------------------------------------------------------------"
						df -hT --total
						echo
						;;
					"BIOS")
						echo
						echo "------------------------------------------------------------------------"
						dmidecode --type bios
						echo
						;;
					"Back")
						break;
						;;
				esac
			done
			;;
			
		"Exit")
			break;
			;;
	esac
done

