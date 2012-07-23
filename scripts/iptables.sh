#!/bin/bash

iptables --policy INPUT ACCEPT
iptables --flush

iptables --append INPUT --in-interface lo --jump ACCEPT
iptables --append INPUT --match state --state ESTABLISHED,RELATED --jump ACCEPT
# iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables --policy INPUT DROP

iptables --policy FORWARD DROP

iptables --policy OUTPUT ACCEPT

iptables --list --verbose
