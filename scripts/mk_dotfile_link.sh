#!/usr/bin/env bash
#make sym link from home directory to all dotfiles in this repo
P=`dirname $0`/..
for i in $P/.*;do
    bn=`basename $i`
    [ "$bn" == "." ] && continue
    [ "$bn" == ".." ] && continue
    if [ -e $bn ];then
        echo Backup $bn
        mv $bn $bn.ORG
    fi
    echo Link $i as $bin
    ln -s $i $bn
done
