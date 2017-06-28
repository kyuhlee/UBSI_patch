#!/bin/bash
#Transmission-2.60
cd $HOME/UBSI_patch
wget https://github.com/transmission/transmission-releases/raw/master/transmission-2.60.tar.bz2
bunzip2 transmission-2.60.tar.bz2
tar xvf transmission-2.60.tar
cd transmission-2.60 && patch -p1 < ../transmission-2.60.patch
./configure && make
cp ./daemon/transmission-daemon $HOME/TRACE/BIN
cp ./cli/transmission-cli $HOME/TRACE/BIN

