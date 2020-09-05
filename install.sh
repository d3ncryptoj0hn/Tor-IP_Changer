#!/bin/bash
# Color:
# Reset
clear='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White
# Root Permission:
if [ "$EUID" -ne 0 ]
  then
       printf "${BRed}Opps! ${BGreen}Try 'sudo ./install' :)\n${clear}"
  exit
fi
# Installation:
printf "${Green}UPDATE Repository!\n"
printf "${Cyan}"
sudo apt-get update
printf "${Green}Installing 'curl,tor,obfs4proxy,psmisc,build-essential'\n"
printf "${Cyan}"
sudo apt-get install -y curl authbind tor obfs4proxy psmisc build-essential
printf "${Green}Installing 'libcurl4-openssl-dev,libssl-dev'\n"
printf "${Cyan}"
sudo apt-get install -y libcurl4-openssl-dev libssl-dev
printf "${Green}Installing 'authbind' \n"
printf "${Cyan}"
sudo apt-get install -y authbind
printf "\n"
printf "${BGreen} Done Installing Dependencies for ipchanger!\n"
sudo chmod +x bin/ipchanger
sudo cp bin/ipchanger /bin/
printf "${BGreen}"
printf "execute 'ipchanger or sudo ipchanger'\n"
printf "execute 'sudo ipchanger --help' to see the usage!"
printf "usage: ipchanger [-h] [-a AUTO] [-d] [-m 1-100] [-p] [-c COUNTRY] [-g]"
printf "    ${BRed}'-a n'${BGreen} automaticaly change ip after start every n\n"
printf "            example:   ipchanger.exe -a 35\n"
printf "                        change ip auto every 35 sec\n"
printf "\n"
printf "    ${BRed}'-m n'${BGreen} start multiple proxy n instances\n"
printf "            example:   ipchanger.exe -m 5\n"
printf "                        start proxy 5 times\n"
printf "                        with different ports\n"
printf "                        and generate list\n"
printf "\n"
printf "    ${BRed}'-d'${BGreen} open debug console live log\n"
printf "\n"
printf "    ${BRed}'-c {COUNTRYCODE}'${BGreen} select specific country\n"
printf "\n"
printf "    ${BRed}'-p | --publicAPI'${BGreen} bind API to public IP (default localhost only)\n"
printf "\n"
printf "    ${BRed}'-g | --nogui'${BGreen} run without GUI, control through API\n"
printf "            to run in background use `nohup ipchanger -g &`\n"
