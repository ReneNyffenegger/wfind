#!/bin/sh

ver=`git describe --always`
dat=`git log --format=%aD "$ver"'~1..'"$ver"`

cp wfind wfind-dist/
sed -i -e '/^my $wfversion/s/".*"/"'"$ver"'"/' wfind-dist/wfind
sed -i -e '/^my $wfverdate/s/".*"/"'"$dat"'"/' wfind-dist/wfind
cp doc/wfind.pod wfind-dist/
cp -R config wfind-dist/

mv wfind-dist wfind-"$ver"

tar czf wfind-"$ver".tgz wfind-"$ver"

mv wfind-"$ver" wfind-dist

