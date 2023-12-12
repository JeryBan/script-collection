#!/bin/bash

# Flushing all existing rules from filtered table
iptables -F

# Allow loopback trafiic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Droping invalid packets that cannot be identified in any state
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP

# Add bellow line to allow tcp connections (like ssh) from a selected target
# iptables -A INPUT -p tcp --dport 22 -m state --state NEW -s <selected IP> -j ACCEPT

# Prevent incoming packets to initiate a connection from outside
# and allow traffic on already established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# Allow outgoing traffic to initiate new connections
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

# Setting protocol to drop all other packets
iptables -P INPUT DROP
iptables -P OUTPUT DROP
