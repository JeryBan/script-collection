# script-collection
A collection of scripts for new programmers, for basic admin opperations and other utilities. I encourage you to play around with these scripts, understand them and customize them as you want.

## Table of Contents
1. [system-report](#system-report)
2. [custom-backup](#custom-backup)
3. [create-user](#create-user)
4. [localnet-scan](#localnet-scan)
---

### system-report

Provides the basic information of a system's specifications, netowrk statistics and services. Should be run with sudo privillages.

### custom-backup

Backing up of /etc /boot ~/.config directories on demand, so you can be safe while tinkering with your system.

### create-user

Create new users and asign them to groups you create or to already existing ones. 

### localnet-scan

Performs an arp scan in your local network and then scans whoever responded with nmap, for open ports with the corresponding service and OS detection. You may need to disable automatic DNS on devices like smartphones and laptops in order for the arp scan to find them.
