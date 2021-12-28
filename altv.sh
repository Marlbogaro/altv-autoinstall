# Colors   
    NORMAL="\033[0;39m"
    ROUGE="\033[1;31m"
    VERT="\033[1;32m"
    ORANGE="\033[1;33m"

# Path

#Variables
DIRCONF="config_altv_server"

################################
##       ALT:V  install       ##
################################
echo -e -n "
$VERT Install gzip..." 
sudo apt install gzip -y
base64 -d <<<"H4sIAAAAAAAACt1VOxbDMAjbfQqOm7VLD9iTNEPfSxV9IBk61I/F4AgBslNVr+fmDIN0tNoVjgYs8MNmQfCBdvIfALgfkP5A+pAkHVmsOn/IJFXJF725z3bWPI/5sVQJVm1hVePAc8ykHe2ggjQoTtHL7VszkuKoNxMAElETJlQwBrAbKlpwc80f9yDTMXeERICM1AXuefmHRejCKidVzarsb4i+STpmXraUYbvHwRJrbbEeW8EO/flhFwg5scnRfqSR9r/Yz9b601xvWi8lALkIAAA=" | gunzip
sleep 3
echo -e -n "
$ORANGE Enter name for your server file: $NORMAL" 
read NAMESERVER

sleep 2

# create config folder & features
if [ ! -d "$DIRCONF" ]; then
    echo "creating ${DIRCONF} config directory."
    mkdir $DIRCONF
fi

# Update the configuration file
cd $DIRCONF
echo "${NAMESERVER}" > ".name"

## download and install packages 
echo -e "$ORANGE
Download and install packages ..."
sleep 3

sudo apt update && sudo apt upgrade -y && sudo apt-get install libc-bin -y && sudo apt-get install libatomic1 -y && sudo apt install wget -y && sudo apt-get install jq -y && sudo apt install curl -y #if it doesn't work run this

## Create a new directory for the server && cd into it
echo -n -e "$NORMAL
Create a new directory for the server && cd into it ...
"
sleep 3

mkdir /"$USER"/${NAMESERVER} 
cd /"$USER"/${NAMESERVER}/ || exit

# Download the latest version of altv-server

echo -e "$ORANGE Downloading altv-server ..."
sleep 3

wget -O 'update.sh' 'https://raw.githubusercontent.com/Lhoerion/altv-serverupdater/master/update.sh'
chmod +x ./update.sh
./update.sh
chmod +x ./altv-server

# Prompt the user for server name input
echo -n -e "$NORMAL Enter name for your server public list: "
read NAME

echo -n "Enter Slots, Max 4095: "
read SLOTS

echo -n "Enter language for your server ex : fr,en,ru,de : "
read LANG

# Update the configuration file
echo "name: '${NAME}'
host: 0.0.0.0
port: 7788
players: ${SLOTS}
#password: ultra-password
announce: false
#token: YOUR_TOKEN
gamemode: Freeroam
website: example.com
language: ${LANG}
description: 'alt:V Sample Server'
modules: [ js-module ]
resources: []

" > server.cfg

echo "
###################################
##  Your server is ready to go!  ##
###################################
"

cat server.cfg