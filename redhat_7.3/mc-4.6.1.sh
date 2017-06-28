#!/bin/bash
#MidnightCommand-4.6.1: 
cd $HOME/UBSI_patch
wget http://ftp.midnight-commander.org/mc-4.6.1.tar.gz
tar xzvf mc-4.6.1.tar.gz
cd mc-4.6.1 && patch -p1 < ../mc-4.6.1.patch
./configure && make
cp ./src/mc $HOME/TRACE/BIN
