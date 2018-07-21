if [ ! -f ./firefox-54.0.1.source.tar.xz ]; then
		wget https://ftp.mozilla.org/pub/firefox/releases/54.0.1/source/firefox-54.0.1.source.tar.xz
fi
tar xf firefox-54.0.1.source.tar.xz
wget -N https://github.com/troydhanson/uthash/archive/master.zip
unzip -o master.zip
mkdir -p /home/$user/.mozbuild
cd firefox-54.0.1 && patch -N -s -p1 < ../firefox-54.0.1.patch
cp ../uthash-master/src/uthash.h ./
mkdir -p src && cd src
../mach bootstrap
../mach build

