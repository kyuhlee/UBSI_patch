#!/bin/bash

# mkdir /home/darpa/TRACE
# mkdir /home/darpa/TRACE/BIN

user=`whoami`
cwd=$(pwd)

if [ -f ./install.time ]; then
	commit="$(git show -s --format=%ct)"
	install=$(head -n 1 install.time)

	echo "Last Git Commit: $(date -d @$commit)"
	echo "Last Install:    $(date -d @$install)"
	if (( $install > $commit )); then
		echo "Exit install"
		exit
	fi
fi

echo "Start install!"

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo add-apt-repository -y ppa:mercurial-ppa/releases
sudo apt-get -y update 
sudo apt-get -y install libcurl4-openssl-dev g++-4.9
sudo apt-get -y install libdbus-glib-1-dev libxt-dev mesa-common-dev libgconf2-dev libgtk2.0-dev yasm libasound2-dev libpulse-dev libncurses-dev libgc-dev libssl-dev libgnutls28-dev glib2.0-dev libgc-dev libslang2-dev libapr1-dev libaprutil1-dev libpcre3 libpcre3-dev libevent-dev intltool
sudo apt-get -y install libcurl4-openssl-dev
sudo apt-get -y install zip unzip
sudo apt-get -y install g++-4.9 rustc cargo mercurial

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 50




# httpd-2.4.20:
cd $cwd
if [ ! -f ./httpd-2.4.20.tar.gz ]; then
		wget https://archive.apache.org/dist/httpd/httpd-2.4.20.tar.gz
fi
tar xzvf httpd-2.4.20.tar.gz
cd httpd-2.4.20 && patch -N -s -p1 < ../httpd-2.4.20.patch
./configure -with-mpm=worker && make 
sudo make install
sudo cp -f /usr/local/apache2/bin/httpd /usr/local/bin
sudo cp -f /home/$user/UBSI_patch/httpd.conf /usr/local/apache2/conf/httpd.conf


#vim-7.3:
cd $cwd
if [ ! -f ./vim-7.3.tar.bz2 ]; then
		wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
fi
bunzip2 vim-7.3.tar.bz2 && tar xvf vim-7.3.tar
cd vim73 && patch -N -s -p1 < ../vim73.patch
./configure && make
sudo cp -f src/vim /usr/local/bin
#executable - src/vim

#Proftpd-1.3.4:
cd $cwd
if [ ! -f ./proftpd-1.3.4.tar.gz ]; then
		wget https://github.com/downloads/proftpd/proftpd.github.com/proftpd-1.3.4.tar.gz
fi
tar xzvf proftpd-1.3.4.tar.gz
cd proftpd-1.3.4 && patch -N -s -p1 < ../proftpd-1.3.4.patch
./configure && make
sudo make install
#config - /usr/local/etc/proftpd.conf
sudo cp -f /usr/local/sbin/proftpd /usr/local/bin

#wget-1.17.1:
cd $cwd
if [ ! -f ./wget-1.17.1.tar.gz ]; then
		wget http://ftp.gnu.org/gnu/wget/wget-1.17.1.tar.gz
fi
tar xzvf wget-1.17.1.tar.gz
cd wget-1.17.1 && patch -N -s -p1 < ../wget-1.17.1.patch
./configure && make
sudo cp -f src/wget /usr/local/bin

#w3m-0.5.3
cd $cwd
if [ ! -f ./w3m-0.5.3.tar.gz ]; then
		wget http://downloads.sourceforge.net/project/w3m/w3m/w3m-0.5.3/w3m-0.5.3.tar.gz
fi
tar xzvf w3m-0.5.3.tar.gz
cd w3m-0.5.3 && patch -N -s -p2 < ../w3m-0.5.3.patch
./configure LIBS="-lX11 -ldl -lXext -lz" && make
sudo cp -f ./w3m /usr/local/bin

#pine-4.64
cd $cwd
if [ ! -f ./pine.tar.gz ]; then
		wget https://www.mirrorservice.org/sites/ftp.cac.washington.edu/pine/pine.tar.gz
fi
tar xzvf pine.tar.gz
cd pine4.64 && patch -N -s -p1 < ../pine4.64.patch
./build slx SSLDIR=/lib/x86_64-linux-gnu SSLINCLUDE=/usr/include/openssl
sudo cp -f ./pine/pine /usr/local/bin

#Cherokee-1.2.1:
cd $cwd
if [ ! -f ./cherokee-1.2.1.tar.gz ]; then
		wget http://repository.timesys.com/buildsources/c/cherokee/cherokee-1.2.1/cherokee-1.2.1.tar.gz
fi
tar xzvf cherokee-1.2.1.tar.gz
cd cherokee-1.2.1 && patch -N -s -p1 < ../cherokee-1.2.1.patch
./configure && make
sudo make install
sudo ldconfig
# config - /usr/local/etc/cherokee/cherokee.conf
sudo cp -f /usr/local/sbin/cherokee /usr/local/bin
sudo cp -f /usr/local/sbin/cherokee-worker /usr/local/bin

#Yafc-1.1.1: 
cd $cwd
if [ ! -f ./yafc-1.1.1.tar.gz ]; then
		wget http://downloads.sourceforge.net/project/yafc/yafc/yafc-1.1.1/yafc-1.1.1.tar.gz
fi
tar xzvf yafc-1.1.1.tar.gz
cd yafc-1.1.1 && patch -N -s -p1 < ../yafc-1.1.1.patch
./configure && make
sudo cp -f src/yafc /usr/local/bin


#Transmission-2.60
cd $cwd
if [ ! -f ./transmission-2.60.tar.bz2 ]; then
		wget https://github.com/transmission/transmission-releases/raw/master/transmission-2.60.tar.bz2
fi
bunzip2 transmission-2.60.tar.bz2 && tar xvf transmission-2.60.tar
cd transmission-2.60 && patch -N -s -p1 < ../transmission-2.60.patch
./configure && make
sudo cp -f ./daemon/transmission-daemon /usr/local/bin
sudo cp -f ./cli/transmission-cli /usr/local/bin


#Bash-4.3.30: 
cd $cwd
if [ ! -f ./bash-4.3.30.tar.gz ]; then
		wget http://ftp.gnu.org/gnu/bash/bash-4.3.30.tar.gz
fi
tar xzvf bash-4.3.30.tar.gz
cd bash-4.3.30 && patch -N -s -p1 < ../bash-4.3.30.patch
./configure && make
sudo cp -f ./bash /usr/local/bin

#MidnightCommand-4.6.1: 
cd $cwd
if [ ! -f ./mc-4.6.1.tar.gz ]; then
		wget http://ftp.midnight-commander.org/mc-4.6.1.tar.gz
fi
tar xzvf mc-4.6.1.tar.gz
cd mc-4.6.1 && patch -N -s -p1 < ../mc-4.6.1.patch
./configure && make
sudo cp -f ./src/mc /usr/local/bin

#Sshd-7.2p2: 
cd $cwd
if [ ! -f ./openssh-7.2p2.tar.gz ]; then
		wget http://ftp.vim.org/security/OpenSSH/openssh-7.2p2.tar.gz
fi
tar xzvf openssh-7.2p2.tar.gz
cd openssh-7.2p2 && patch -N -s -p1 < ../openssh-7.2p2.patch
./configure && make
sudo make install
# config -  /usr/local/etc/sshd_config
sudo cp -f /usr/local/sbin/sshd /usr/local/bin
sudo cp -f /usr/local/bin/ssh /usr/local/bin

#Sendmail-8.15.2:
cd $cwd
if [ ! -f ./sendmail.8.15.2.tar.gz ]; then
		wget ftp://ftp.sendmail.org/pub/sendmail/sendmail.8.15.2.tar.gz
fi
tar xzvf sendmail.8.15.2.tar.gz
cd sendmail-8.15.2 
chmod 644 devtools/OS/Linux
patch -N -s -p1 < ../sendmail-8.15.2.patch
cd sendmail && ./Build
sudo useradd smmsp
sudo mkdir -p /usr/man/man8 /usr/man/man1 /usr/man/man5 
sudo ./Build install
sudo cp -f /usr/sbin/sendmail /usr/local/bin


#Firefox-42.0: 
#wget https://archive.mozilla.org/pub/firefox/releases/42.0/source/firefox-42.0.source.tar.xz
#tar xf firefox-42.0.source.tar.xz
#cd firefox-42.0 && patch -N -s -p1 < ../firefox-42.0.patch
#cd ..
#sudo mv ./firefox-42.0 /usr/local/
#sudo chown -R root:root /usr/local/firefox-42.0/
#cd /usr/local/firefox-42.0/
#sudo ./configure 
#sudo make
#unset DISPLAY
#export $(dbus-launch)
#sudo ln -f -s /usr/local/firefox-42.0/firefox-build/dist/bin/firefox /usr/local/bin/


cd $cwd
if [ ! -f ./firefox-54.0.1.source.tar.xz ]; then
		wget https://ftp.mozilla.org/pub/firefox/releases/54.0.1/source/firefox-54.0.1.source.tar.xz
fi
wget -N https://github.com/troydhanson/uthash/archive/master.zip
unzip -o master.zip
tar xf firefox-54.0.1.source.tar.xz
mkdir -p /home/$user/.mozbuild
cd firefox-54.0.1 && patch -N -s -p1 < ../firefox-54.0.1.patch
cp ../uthash-master/src/uthash.h ./
cd ..
sudo rm -rf /usr/local/firefox-54.0.1/
sudo mv -f ./firefox-54.0.1 /usr/local/
sudo chown -R root:root /usr/local/firefox-54.0.1/
cd /usr/local/firefox-54.0.1/
sudo mkdir -p src && cd src
sudo ../mach bootstrap
sudo ../mach build
sudo ln -f -s /usr/local/firefox-54.0.1/obj-x86_64-pc-linux-gnu/dist/bin/firefox /usr/local/bin

cd $cwd
echo $(date +%s) > install.time
