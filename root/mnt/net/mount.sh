#!/usr/bin/bash
PWD=`dirname $0`
dirs=`find $PWD -type d`
for d in  $dirs;do
	dd=`basename $d`
	if [[ $dd != '.' ]];then
		mount -t cifs //192.168.0.5/$dd -o username=murphy,password=java2,uid=1000 $PWD/$dd
	fi
done
