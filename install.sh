#!/bin/bash
mkdir $HOME/TRACE
mkdir $HOME/TRACE/BIN

sudo apt-get -y install libcurl4-openssl-dev gtk+-2
sudo apt-get -y install libdbus-glib-1-dev libxt-dev mesa-common-dev libgconf2-dev libgtk2.0-dev yasm libasound2-dev libpulse-dev libncurses-dev libgc-dev libssl-dev libgnutls28-dev glib2.0-dev libgc-dev libslang2-dev libapr1-dev libaprutil1-dev libpcre3 libpcre3-dev libevent-dev intltool
sudo apt-get -y install libcurl4-openssl-dev
sudo apt-get -y install zip unzip



# httpd-2.2.21:
# cd $HOME/UBSI_patch
# wget https://archive.apache.org/dist/httpd/httpd-2.2.21.tar.gz
# tar xzvf httpd-2.2.21.tar.gz
# cd httpd-2.2.21 && patch -p1 < ../httpd-2.2.21.patch
# ./configure --with-mpm=worker && make
# sudo make install
# 

# executable - /usr/local/apache2/bin/httpd
# config - /usr/local/apache2/conf/httpd.conf

# add the following lines in "/usr/local/apache2/conf/httpd.conf" file for multi-thread workers:
# 	   ServerLimit 16
# 	   StartServers 2
# 	   MaxClients 150
# 	   MinSpareThreads 25
# 	   MaxSpareThreads 75
# 	   ThreadsPerChild 25

# httpd-2.4.20:
cd $HOME/UBSI_patch
wget https://archive.apache.org/dist/httpd/httpd-2.4.20.tar.gz
tar xzvf httpd-2.4.20.tar.gz
cd httpd-2.4.20 && patch -p1 < ../httpd-2.4.20.patch
./configure -with-mpm=worker && make 
sudo make install
cp /usr/local/apache2/bin/httpd $HOME/TRACE/BIN
cp $HOME/UBSI_patch/httpd.conf /usr/local/apache2/conf/httpd.conf

#executable - /usr/local/apache2/bin/httpd
#config - /usr/local/apache2/conf/httpd.conf

#add the following lines in "/usr/local/apache2/conf/httpd.conf" file for multi-thread workers:
#	   LoadModule unixd_module modules/mod_unixd.so
#	   LoadModule access_compat_module modules/mod_access_compat.so
#	   ServerLimit         16
#	   StartServers         2
#	   MaxRequestWorkers  150
#	   MinSpareThreads     25
#	   MaxSpareThreads     75
#	   ThreadsPerChild     25

#vim-7.3:
cd $HOME/UBSI_patch
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
bunzip2 vim-7.3.tar.bz2 && tar xvf vim-7.3.tar
cd vim73 && patch -p1 < ../vim73.patch
./configure && make
cp src/vim $HOME/TRACE/BIN
#executable - src/vim

#Proftpd-1.3.4:
cd $HOME/UBSI_patch
wget https://ftp.heanet.ie/mirrors/ftp.proftpd.org/distrib/source/proftpd-1.3.4.tar.gz
tar xzvf proftpd-1.3.4.tar.gz
cd proftpd-1.3.4 && patch -p1 < ../proftpd-1.3.4.patch
./configure && make
sudo make install
#config - /usr/local/etc/proftpd.conf
cp /usr/local/sbin/proftpd $HOME/TRACE/BIN

#wget-1.17.1:
cd $HOME/UBSI_patch
wget http://ftp.gnu.org/gnu/wget/wget-1.17.1.tar.gz
tar xzvf wget-1.17.1.tar.gz
cd wget-1.17.1 && patch -p1 < ../wget-1.17.1.patch
./configure && make
cp src/wget $HOME/TRACE/BIN

#w3m-0.5.3
cd $HOME/UBSI_patch
wget http://downloads.sourceforge.net/project/w3m/w3m/w3m-0.5.3/w3m-0.5.3.tar.gz
tar xzvf w3m-0.5.3.tar.gz
cd w3m-0.5.3 && patch -p2 < ../w3m-0.5.3.patch
./configure LIBS="-lX11 -ldl -lXext -lz" && make
cp ./w3m $HOME/TRACE/BIN

#pine-4.64
cd $HOME/UBSI_patch
wget ftp://ftp.cac.washington.edu/pine/pine.tar.gz
tar xzvf pine.tar.gz
cd pine4.64 && patch -p1 < ../pine4.64.patch
./build slx SSLDIR=/lib/x86_64-linux-gnu SSLINCLUDE=/usr/include/openssl
cp ./pine/pine $HOME/TRACE/BIN

#Cherokee-1.2.1:
cd $HOME/UBSI_patch
wget http://www.gtlib.gatech.edu/pub/cherokee/1.2/1.2.1/cherokee-1.2.1.tar.gz
tar xzvf cherokee-1.2.1.tar.gz
cd cherokee-1.2.1 && patch -p1 < ../cherokee-1.2.1.patch
./configure && make
sudo make install
sudo ldconfig
# config - /usr/local/etc/cherokee/cherokee.conf
cp /usr/local/sbin/cherokee $HOME/TRACE/BIN
cp /usr/local/sbin/cherokee-worker $HOME/TRACE/BIN

#Yafc-1.1.1: 
cd $HOME/UBSI_patch
wget http://downloads.sourceforge.net/project/yafc/yafc/yafc-1.1.1/yafc-1.1.1.tar.gz
tar xzvf yafc-1.1.1.tar.gz
cd yafc-1.1.1 && patch -p1 < ../yafc-1.1.1.patch
./configure && make
cp src/yafc $HOME/TRACE/BIN


#Transmission-2.60
cd $HOME/UBSI_patch
wget https://download.transmissionbt.com/files/transmission-2.60.tar.bz2
bunzip2 transmission-2.60.tar.bz2 && tar xvf transmission-2.60.tar
cd transmission-2.60 && patch -p1 < ../transmission-2.60.patch
./configure && make
cp ./daemon/transmission-daemon $HOME/TRACE/BIN
cp ./cli/transmission-cli $HOME/TRACE/BIN

#Bash-4.2:
# cd $HOME/UBSI_patch
# wget http://ftp.gnu.org/gnu/bash/bash-4.2.tar.gz
# tar xzvf bash-4.2.tar.gz
# cd bash-4.2 && patch -p1 < ../bash-4.2.patch
# ./configure && make
# cp ./bash $HOME/TRACE/BIN

#Bash-4.3.30: 
cd $HOME/UBSI_patch
wget http://ftp.gnu.org/gnu/bash/bash-4.3.30.tar.gz
tar xzvf bash-4.3.30.tar.gz
cd bash-4.3.30 && patch -p1 < ../bash-4.3.30.patch
./configure && make
cp ./bash $HOME/TRACE/BIN

#MidnightCommand-4.6.1: 
cd $HOME/UBSI_patch
wget http://ftp.midnight-commander.org/mc-4.6.1.tar.gz
tar xzvf mc-4.6.1.tar.gz
cd mc-4.6.1 && patch -p1 < ../mc-4.6.1.patch
./configure && make
cp ./src/mc $HOME/TRACE/BIN

#Sshd-5.9: 
# cd $HOME/UBSI_patch
# wget http://ftp.vim.org/security/OpenSSH/openssh-5.9p1.tar.gz
# tar xzvf openssh-5.9p1.tar.gz
# cd openssh-5.9p1 && patch -p1 < ../openssh-5.9p1.patch
# ./configure && make
# sudo make install
# config -  /usr/local/etc/sshd_config
# execuatable -  /usr/local/sbin/sshd
#                /usr/local/bin/ssh

#Sshd-7.2p2: 
cd $HOME/UBSI_patch
wget http://ftp.vim.org/security/OpenSSH/openssh-7.2p2.tar.gz
tar xzvf openssh-7.2p2.tar.gz
cd openssh-7.2p2 && patch -p1 < ../openssh-7.2p2.patch
./configure && make
sudo make install
# config -  /usr/local/etc/sshd_config
cp /usr/local/sbin/sshd $HOME/TRACE/BIN
cp /usr/local/bin/ssh $HOME/TRACE/BIN

#Sendmail-8.12.11: 
#wget ftp://ftp.sendmail.org/pub/sendmail/sendmail.8.12.11.tar.gz
##tar xzvf sendmail.8.12.11.tar.gz
#cd sendmail-8.12.11
#chmod 644 devtools/OS/Linux
#patch -p1 < ../sendmail-8.12.11.patch
#cd sendmail && ./Build
#sudo useradd smmsp
#sudo mkdir -p /usr/man/man8 /usr/man/man1 /usr/man/man5
#sudo ./Build install

#Sendmail-8.15.2:
cd $HOME/UBSI_patch
wget ftp://ftp.sendmail.org/pub/sendmail/sendmail.8.15.2.tar.gz
tar xzvf sendmail.8.15.2.tar.gz
cd sendmail-8.15.2 
chmod 644 devtools/OS/Linux
patch -p1 < ../sendmail-8.15.2.patch
cd sendmail && ./Build
sudo useradd smmsp
sudo mkdir -p /usr/man/man8 /usr/man/man1 /usr/man/man5 
sudo ./Build install
cp /usr/sbin/sendmail $HOME/TRACE/BIN


#Firefox-42.0: 
cd $HOME/UBSI_patch
wget https://archive.mozilla.org/pub/firefox/releases/42.0/source/firefox-42.0.source.tar.xz
tar xf firefox-42.0.source.tar.xz
cd firefox-42.0 && patch -p1 < ../firefox-42.0.patch
cd ..
sudo mv ./firefox-42.0 /usr/local/
sudo chown -R root:root /usr/local/firefox-42.0/
cd /usr/local/firefox-42.0/
sudo ./configure 
sudo make
unset DISPLAY
export $(dbus-launch)
sudo ln -f -s /usr/local/firefox-42.0/firefox-build/dist/bin/firefox /usr/local/bin/

