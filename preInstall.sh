#!/bin/bash
export DEBIAN_FRONTEND=noninteractive


# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


 dpkg --add-architecture i386
 apt-get update

 apt-get -y install libopenal1 libopenal1:i386 lib32z1 lib32ncurses5 libbz2-1.0:i386 \
 					libstdc++6:i386 libxxf86vm1 libglu1:i386 libxrandr-dev libxrandr2:i386 zip unzip

 dpkg -i gasPumpSimulator.deb
 sudo chmod +x /opt/gasPumpSimulator/gasPumpSimulator
 LD_PRELOAD=`pwd`/libssl.so.1.0.0:`pwd`/libcrypto.so.1.0.0 /opt/gasPumpSimulator/gasPumpSimulator