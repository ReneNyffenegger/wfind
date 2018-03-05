#!/bin/sh

cd "`dirname $0`"

ver=`git describe --always`
dat=`git log --format=%aD "$ver"'~1..'"$ver"`

install -d /usr/local/bin
sed -e '/^my $wfversion/s/".*"/"'"$ver"'"/' wfind > /usr/local/bin/wfind
sed -i -e '/^my $wfverdate/s/".*"/"'"$dat"'"/' /usr/local/bin/wfind
chmod 755 /usr/local/bin/wfind
ln -sf wfind /usr/local/bin/scav
install -d /usr/local/man/man1
pod2man doc/wfind.pod | gzip > /usr/local/man/man1/wfind.1.gz
ln -sf wfind.1.gz /usr/local/man/man1/scav.1.gz
install -d /usr/local/share/wfind
cp -R config/* /usr/local/share/wfind/
chmod -R a+rX /usr/local/share/wfind/
install -d /usr/local/share/doc/wfind
pod2html --infile=doc/wfind.pod --outfile=/usr/local/share/doc/wfind/wfind.html
rm -f pod2htmd.tmp pod2htmi.tmp

