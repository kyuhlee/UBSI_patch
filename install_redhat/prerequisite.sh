#!/bin/bash
mkdir $HOME/TRACE
mkdir $HOME/TRACE/BIN

sudo yum -y groupinstall 'Development Tools'
sudo yum -y install gtk+-devel gtk2-devel alsa-lib-devel libXt-devel openssl-devel libcurl-devel gnutls-devel ncurses-devel openldap-devel

