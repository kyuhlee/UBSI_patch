mkdir $HOME/TRACE
mkdir $HOME/TRACE/BIN

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test ppa:mercurial-ppa/releases
sudo apt-get -y update 

sudo apt-get -y install g++-4.9 rustc cargo mercurial

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 50

#Firefox-54.0.1: 
cd $HOME/UBSI_patch
#wget https://ftp.mozilla.org/pub/firefox/releases/54.0.1/source/firefox-54.0.1.source.tar.xz
#tar xf firefox-54.0.1.source.tar.xz
mkdir $HOME/.mozbuild
cd firefox-54.0.1 && patch -p1 < ../firefox-54.0.1.patch
cd ..
sudo mv ./firefox-54.0.1 /usr/local/
sudo chown -R root:root /usr/local/firefox-54.0.1/
cd /usr/local/firefox-54.0.1/
sudo mkdir src && cd src
sudo ../mach bootstrap
sudo ../mach build
ln -f -s /usr/local/firefox-54.0.1/obj-x86_64-pc-linux-gnu/dist/bin/firefox $HOME/TRACE/BIN/

$HOME/TRACE/BIN/firefox --setDefaultBrowser &
sleep 20
killall -9 firefox

