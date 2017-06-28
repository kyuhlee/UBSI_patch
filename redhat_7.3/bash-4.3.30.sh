#!/bin/bash
#Bash-4.3.30: 
cd $HOME/UBSI_patch
wget http://ftp.gnu.org/gnu/bash/bash-4.3.30.tar.gz
tar xzvf bash-4.3.30.tar.gz
cd bash-4.3.30 && patch -p1 < ../bash-4.3.30.patch
./configure && make
cp ./bash $HOME/TRACE/BIN

