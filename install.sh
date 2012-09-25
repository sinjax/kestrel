#!/bin/bash
PREFIX_BASE=/usr/local/kestrel

mkdir -vp $PREFIX_BASE
name=`ls dist/kestrel/*javadoc* | sed "s/.*[/]\(.*\)-javadoc[.]jar/\1/g"`
rm -rf $name
cp -rf dist/kestrel $PREFIX_BASE/$name
rm $PREFIX_BASE/current
ln -s $PREFIX_BASE/$name $PREFIX_BASE/current
cp $PREFIX_BASE/current/scripts/kestrel.sh /etc/init.d/kestrel
chmod u+x /etc/init.d/kestrel
mkdir -vp /var/run/kestrel/
mkdir -vp /var/log/kestrel/
chown -R daemon /var/run/kestrel
chown -R daemon /var/log/kestrel

