sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get -y update 

sudo apt-get -y install g++-4.9 rustc cargo

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 50

#Firefox-54.0.1: 
cd $HOME/UBSI_patch
wget https://ftp.mozilla.org/pub/firefox/releases/54.0.1/source/firefox-54.0.1.source.tar.xz
tar xf firefox-54.0.1.source.tar.xz
cd firefox-54.0.1 && patch -p1 < ../firefox-54.0.1.patch
mkdir src && cd src
../mach bootstrap
../mach build
ln -f -s $HOME/UBSI_patch/firefox-54.0.1/obj-x86_64-pc-linux-gnu/dist/bin/ $HOME/TRACE/BIN/
