#!/bin/bash
blue='\033[1;34m'
yellow='\033[1;33m'
NC='\033[0m'
echo -e "${blue}Starting Server"
while true; do read -n30 ui; echo $ui |openssl enc -aes-256-cbc -a -k $1; done | nc -l -p 8877 | while read so; do decoded_so=`echo "$so"| openssl enc -d -a -aes-256-cbc -k $1`; echo -e "${yellow}$decoded_so${blue}"; done