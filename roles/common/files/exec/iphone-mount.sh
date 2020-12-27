#!/bin/bash

###VARS
DEPS="ifuse idevicepair"


###script

#make sure dependencies are present
for command in $DEPS;
do
  if ! command -v "$command" > /dev/null;
  then
    printf "%s scould not be found, please install it\n" "$command"
    exit
  fi
done

# check if /media/iphone exists and ownership is set
if [ ! -d /media/iphone ];
then
  printf "please create and own /media/iphone"
  exit
elif [ "$(stat -c '%U' /media/iphone/)" != "$(whoami)" ];
then
  printf "please set your user as the owner of /media/iphone"
  exit
fi

#make sure iphone is connected
if ! lsusb | grep iPhone ;
then
  printf "no iphone found via usb, please connect it"
  exit
fi

#try to pair once, it will probably fail
idevicepair pair
read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n' 
idevicepair pair
ifuse /media/iphone


printf "iphone mounted in /media/iphone\n"
