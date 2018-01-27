mkdir $HOME/TRACE
mkdir $HOME/TRACE/BIN

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get -y update 

sudo apt-get -y install g++-4.9 rustc cargo

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 50

#Firefox-54.0.1: 
cd $HOME/UBSI_patch
wget https://ftp.mozilla.org/pub/firefox/releases/54.0.1/source/firefox-54.0.1.source.tar.xz
tar xf firefox-54.0.1.source.tar.xz
cd firefox-54.0.1 && patch -p1 < ../firefox-54.0.1.patch
cd ..
sudo mv ./firefox-54.0.1 /usr/local/
sudo chown -R root:root /usr/local/firefox-54.0.1/
cd /usr/local/firefox-54.0.1/
sudo mkdir src && cd src
sudo ../mach bootstrap
sudo ../mach build
ln -f -s /usr/local/firefox-54.0.1/obj-x86_64-pc-linux-gnu/dist/bin/firefox $HOME/TRACE/BIN/



sudo apt-get -y install  automake1.4 libossp-uuid16 libpython-dev libpython2.7 libpython2.7-dev libpython2.7-minimal libpython2.7-stdlib python-chardet-whl python-colorama python-colorama-whl python-distlib python-distlib-whl python-html5lib python-html5lib-whl python-pip-whl python-requests-whl python-setuptools-whl python-six-whl python-urllib3-whl python-wheel python2.7 python2.7-dev python2.7-minimal \
autoconf2.13 ccache python-dev python-pip python-setuptools uuid \
libatk-bridge2.0-dev libgtk-3-dev libiw-dev libnotify-dev libwayland-dev libx11-xcb-dev libxkbcommon-dev xvfb


sudo add-apt-repository -y ppa:mercurial-ppa/releases
sudo apt-get update
sudo apt-get install -y mercurial

mkdir $HOME/.mozbuild
