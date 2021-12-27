#!/bin/sh

################################
## PACKAGES THAT ARE REQUIRED ##
################################
echo "Enter name for your server file: "
read NAMESERVER

## download and install packages 
sudo apt update && sudo apt upgrade -y && sudo apt-get install libc-bin -y && sudo apt-get install libatomic1 -y && sudo apt install wget -y && sudo apt-get install jq -y && sudo apt install curl -y #if it doesn't work run this

## Create a new directory for the server && cd into it
mkdir /"$USER"/${NAMESERVER}/ && cd ${NAMESERVER}
cd /"$USER"/${NAMESERVER}/ || exit

echo downloading altv ...
wget -O 'update.sh' 'https://raw.githubusercontent.com/Lhoerion/altv-serverupdater/master/update.sh'
chmod +x ./update.sh
./update.sh
chmod +x ./altv-server

# Prompt the user for server name input
echo "Enter name for your server public list: "
read NAME

# Update the configuration file

echo "name: '${NAME}'
host: 0.0.0.0
port: 7788
players: 128
#password: ultra-password
announce: false
#token: YOUR_TOKEN
gamemode: Freeroam
website: example.com
language: en
description: 'alt:V Sample Server'
modules: [ js-module ]
resources: [
  
]" > server.cfg