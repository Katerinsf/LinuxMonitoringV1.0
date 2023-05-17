#!/bin/bash

HOSTNAME=$(hostname)

# timedatectl set-timezones Europe/Moscow
ZONE=`curl -s https://ipapi.co/timezone`
timedatectl set-timezone $ZONE
TIMEZONE="$(cat /etc/timezone) UTC $(date +"%-:::z")"

USER=`whoami`
OS="$(cat /etc/issue | awk '{print $1}') $(cat /etc/issue | awk '{print $2}')"
DATE=`date +"%d %b %Y %H:%M:%S"`
UPTIME=`uptime -p`
UPTIME_SEC="$(cat /proc/uptime | awk '{print $1}')"
# IP=`hostname -I | awk '{ print $NF }'`
IP=`hostname -i`
MASK=`ifconfig | grep -m1 "netmask" | awk '{print $4}'`
GATEWAY=`ip r | awk '/default/ {print $3}'`
RAM_TOTAL=`free -m | awk '/Mem/{printf "%.3f GB", $2/1024}'`
RAM_USED=`free -m | awk '/Mem/{printf "%.3f GB", $3/1024}'`
RAM_FREE=`free -m | awk '/Mem/{printf "%.3f GB", $4/1024}'`
SPACE_ROOT=`df / | tail -1 | awk '{printf "%.2f MB", $2/1024}'`
SPACE_ROOT_USED=`df / | tail -1 | awk '{printf "%.2f MB", $3/1024}'`
SPACE_ROOT_FREE=`df / | tail -1 | awk '{printf "%.2f MB", $4/1024}'`
