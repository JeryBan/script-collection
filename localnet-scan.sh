#!/bin/bash

echo "Scanning local network for responses..."
echo 
readarray -t scans <<< "$(arp-scan --localnet -xdg -F '${ip}\t${vendor}\t${name}' | column -t -l 4)"

while true; do

	scans+=("Retry arp scan" "quit")
	PS3="Select the target you want to scan: "
	select option in "${scans[@]}"; do
		case $option in
			"quit")
				echo
				echo "Exiting..."
				sleep 1
				exit 0;
				;;
		
			"Retry arp scan")
				echo "Re scanning local network..."
				echo
				readarray -t scans <<< "$(arp-scan --localnet -xdg -F '${ip}\t${vendor}\t${name}' | column -t -l 4)"
				break;
				;;
			
			*)
				if [[ -n $option ]]; then
					ip="$(echo $option | cut -d' ' -f1)"
					
					sudo nmap -sV -O $ip
					echo
				
				fi
				;;
		esac 
			
	done
	
done
