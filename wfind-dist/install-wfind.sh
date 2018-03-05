#!/bin/sh

install -d /usr/local/bin
install -m 755 wfind /usr/local/bin/
ln -sf wfind /usr/local/bin/scav
install -d /usr/local/man/man1
pod2man wfind.pod | gzip > /usr/local/man/man1/wfind.1.gz
ln -sf wfind.1.gz /usr/local/man/man1/scav.1.gz
install -d /usr/local/share/wfind
cp -R config/* /usr/local/share/wfind/
chmod -R a+rX /usr/local/share/wfind/
install -d /usr/local/share/doc/wfind
pod2html --infile=wfind.pod --outfile=/usr/local/share/doc/wfind/wfind.html
rm -f pod2htmd.tmp pod2htmi.tmp

