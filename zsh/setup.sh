#!/usr/bin/env bash
#which zsh > /dev/null
P=$( cd "$(dirname $0)" >/dev/null 2>&1 ; pwd -P )
if [ $? -ne 0 ];then
    echo Install zsh first
    exit 1
fi
cd ~
if [ ! -d .zprezto ];then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi
for i in $P/.z*;do
    f=$HOME/$(basename $i)
    [ -L  $f ] && rm -f $f
    ln -s $i $f
done
zsh $P/setup.zsh
