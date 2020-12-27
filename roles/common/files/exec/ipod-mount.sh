#!/bin/bash

echo work in progress

#make sure folder exists
if [ ! -d /media/IPOD ];
then
  printf "please create /media/IPOD"
  exit
fi

#make sure ipod is connected
if ! lsusb | grep iPod ;
then
  printf "no ipod found via usb, please connect it"
  exit
fi

#WARNIGN MEGA-HACK 
#use the size of the disk to determine its the ipod
IPOD=$(lsblk | grep 74,4G | head -n1 | awk '{print completion-ignore-case;}')
printf "found ipod in %s" "$IPOD"


printf "mount in /media/IPOD with sudo\n"
sudo mount -t vfat /dev/${IPOD}1 /media/IPOD/ -o umask=000

printf "you can now launch rhythmbox to transfer files\n"
