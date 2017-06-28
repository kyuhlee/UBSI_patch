#!/bin/bash
mkdir $HOME/TRACE
mkdir $HOME/TRACE/BIN

sudo yum -y groupinstall 'Development Tools'
sudo yum -y install gtk+-devel gtk2-devel alsa-lib-devel libXt-devel openssl-devel libcurl-devel gnutls-devel ncurses-devel openldap-devel

cd $HOME/UBSI_patch
wget  https://github.com/ivmai/libatomic_ops/releases/download/v7.4.6/libatomic_ops-7.4.6.tar.gz
tar xzvf libatomic_ops-7.4.6.tar.gz
cd libatomic_ops-7.4.6
./configure && make
sudo make install
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

cd $HOME/UBSI_patch
wget http://www.hboehm.info/gc/gc_source/gc-7.6.0.tar.gz
tar xzvf gc-7.6.0.tar.gz
cd gc-7.6.0
./configure && make
sudo make install
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

cd $HOME/UBSI_patch
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar xzvf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure && make 
sudo make install
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

cd $HOME/UBSI_patch
wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar xzvf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure && make
sudo make install
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

