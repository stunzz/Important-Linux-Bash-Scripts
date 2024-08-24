#!/bin/bash

BG_LIME_GREEN='\033[102m'
FG_BLACK='\033[30m'
RED='\033[1;31m'
NC='\033[0m'

print_heading() {
    echo -e "${BG_LIME_GREEN}${FG_BLACK}$1${NC}"
}

handle_error() {
    echo -e "${RED}Script exited with errors.${NC}"
    echo -e "${RED}$1${NC}"
    exit 1
}

trap 'handle_error "Error occurred on line $LINENO while executing command: $BASH_COMMAND"' ERR

print_heading "Updating and Upgrading the System"
apt update && apt upgrade -y

print_heading "Installing Required Packages"
apt install build-essential curl wget nano vim git sudo net-tools openssh-server network-manager htop iostat ufw python3 python3-pip zip unzip unrartmux locales manpages snapd aria2 -y

print_heading "Installing Additional Packages"
apt install -y curl ca-certificates systemd-sysv

print_heading "Updating CA Certificates"
update-ca-certificates

echo -e "${BG_LIME_GREEN}${FG_BLACK}Ba!${NC}"
