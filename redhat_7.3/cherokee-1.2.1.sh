#!/bin/bash
#Cherokee-1.2.1:
cd $HOME/UBSI_patch
wget http://ftp.icm.edu.pl/packages/cherokee/1.2/1.2.1/cherokee-1.2.1.tar.gz
tar xzvf cherokee-1.2.1.tar.gz
cd cherokee-1.2.1 && patch -p1 < ../cherokee-1.2.1.patch
./configure && make
sudo make install
sudo ldconfig
# config - /usr/local/etc/cherokee/cherokee.conf
cp /usr/local/sbin/cherokee $HOME/TRACE/BIN
cp /usr/local/sbin/cherokee-worker $HOME/TRACE/BIN

