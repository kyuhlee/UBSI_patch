#!/bin/bash
#w3m-0.5.3

cd $HOME/UBSI_patch
wget http://downloads.sourceforge.net/project/w3m/w3m/w3m-0.5.3/w3m-0.5.3.tar.gz
tar xzvf w3m-0.5.3.tar.gz
cd w3m-0.5.3 && patch -p2 < ../w3m-0.5.3.patch
./configure LIBS="-lX11 -ldl -lXext -lz" && make
cp ./w3m $HOME/TRACE/BIN

