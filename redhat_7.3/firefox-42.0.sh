#!/bin/bash
#Firefox-42.0: 
cd $HOME/UBSI_patch
wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar xzvf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure && make
sudo make install
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

cd $HOME/UBSI_patch
wget https://archive.mozilla.org/pub/firefox/releases/42.0/source/firefox-42.0.source.tar.xz
tar xf firefox-42.0.source.tar.xz
cd firefox-42.0 && patch -p1 < ../firefox-42.0.patch
mkdir firefox-build
cd firefox-build
$HOME/UBSI_patch/firefox-42.0/configure
make
#cd ..
#sudo mv ./firefox-42.0 /usr/local/
#sudo chown -R root:root /usr/local/firefox-42.0/
#cd /usr/local/firefox-42.0/
#sudo ./configure 
#sudo make
unset DISPLAY
export $(dbus-launch)
#sudo ln -f -s /usr/local/firefox-42.0/firefox-build/dist/bin/firefox /usr/local/bin/
sudo ln -f -s $HOME/UBSI_patch/firefox-42.0/firefox-build/dist/bin/firefox /usr/local/bin/
sudo ln -f -s $HOME/UBSI_patch/firefox-42.0/firefox-build/dist/bin/firefox $HOME/TRACE/BIN/

