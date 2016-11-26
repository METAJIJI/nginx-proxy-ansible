#!/bin/sh

[ $(id -u) -ne 0 ] && echo "ERROR  : Need root privileges, try run this script via: sudo sh $(basename $0)" && exit 1

echo "INFO   : Delete unwanted or old packages..."
apt purge -yqq accountsservice lxd snapd nginx

echo "INFO   : Upgrade packages..."
apt update -qq
apt upgrade -yqq

echo "INFO   : Install required packages..."
apt install -yqq python-apt python-pycurl ansible mc iptraf htop mtr-tiny telnet

echo "INFO   : Cleanup..."
apt autoremove
apt clean

echo "INFO   : Run deploy.sh"
sh $(dirname $(readlink -f $0))/deploy.sh
