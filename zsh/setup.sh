#!/usr/bin/env bash
which zsh > /dev/null
if [ $? -ne 0 ];then
    echo Install zsh first
    exit 1
fi
cd ~
[ -d .zprezto ] && exit 1

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
for i in `dirname $0`/.z*;do ln -s $i;done
zsh `dirname $0`/setup.zsh

