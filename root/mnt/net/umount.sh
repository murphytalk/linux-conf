#!/usr/bin/bash
p=`dirname $0`
cd $p >/dev/null
for i in *;do if [ -d $i ];then echo $i;echo umount $i >> /tmp/umount.txt; umount $i ;fi;done
cd - >/dev/null
