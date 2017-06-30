#!/bin/bash
#Firefox-42.0: 
cd $HOME/UBSI_patch
#wget https://archive.mozilla.org/pub/firefox/releases/42.0/source/firefox-42.0.source.tar.xz
tar xf firefox-42.0.source.tar.xz
cd firefox-42.0 && patch -p1 < ../firefox-42.0.patch
cd ..
sudo mv ./firefox-42.0 /usr/local/
sudo chown -R $USER:$USER /usr/local/firefox-42.0/
cd /usr/local/firefox-42.0
mkdir firefox-build
cd firefox-build
/usr/local/firefox-42.0/configure
make

sudo chown -R root:root /usr/local/firefox-42.0/

#unset DISPLAY
#export $(dbus-launch)
sudo ln -f -s /usr/local/firefox-42.0/firefox-build/dist/bin/firefox /usr/local/bin/
sudo ln -f -s /usr/local/firefox-42.0/firefox-build/dist/bin/firefox $HOME/TRACE/BIN/

