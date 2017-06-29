#!/bin/bash
#Firefox-42.0: 
sudo apt-get install gtk+-2 yasm

cd $HOME/UBSI_patch
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

