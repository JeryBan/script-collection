# About
A collection of scripts for new programmers, for basic admin opperations and other utilities. I encourage you to play around with these scripts, understand them and customize them as you want.

## Table of Contents
1. [system-report](#system-report)
2. [custom-backup](#custom-backup)
3. [create-user](#create-user)
4. [localnet-scan](#localnet-scan)
5. [firewall-setup](#firewall-setup)
6. [gitmenu](#gitmenu)
---

### system-report

Provides the basic information of a system's specifications, netowrk statistics and services. Should be run with sudo privilages.

### custom-backup

Backing up of /etc /boot ~/.config directories on demand, so you can be safe while tinkering with your system.

### create-user

Create new users and asign them to groups you create or to already existing ones. 

### localnet-scan

Performs an arp scan in your local network and then scans whoever responded with nmap, for open ports with the corresponding service and OS detection. You may need to disable automatic DNS on devices like smartphones and laptops in order for the arp scan to find them.

### firewall-setup

These rules make a good firewall configuration for a home setup. In short it allows you to establish new connection but deny ones from outside. Script should be run with root previlages. If you want to revert the changes you made after running the script run `sudo iptables -F`. Run `sudo iptables -vnL` to list the new rules. If you want the firewall to persist after a boot you have to make this script run automatically on boot (add it to crontab). 

### gitmenu

A quick and simple menu for git VCS (version control system), a powerfull tool for all programmers, to get you started or remind you the basics.
