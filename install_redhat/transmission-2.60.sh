#!/bin/bash
#Transmission-2.60
cd $HOME/UBSI_patch
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar xzvf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure && make 
sudo make install
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

cd $HOME/UBSI_patch
wget https://github.com/transmission/transmission-releases/raw/master/transmission-2.60.tar.bz2
bunzip2 transmission-2.60.tar.bz2
tar xvf transmission-2.60.tar
cd transmission-2.60 && patch -p1 < ../transmission-2.60.patch
./configure && make
cp ./daemon/transmission-daemon $HOME/TRACE/BIN
cp ./cli/transmission-cli $HOME/TRACE/BIN

