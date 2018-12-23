#!/usr/bin/env bash
HOME_REPO="$(cd "`dirname $0`/home"; pwd -P)"
IGNORE=(
    ".xinitrc"
    ".bash_profile"
    ".bashrc"
    ".xbindkeysrc"
    ".config"
    "home"
)

containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

# soft link everything under home/ except those in IGNORE to home
for i in `find $HOME_REPO -maxdepth 1 -print`;do
    f=`basename $i`
    if [ -z "$f" ];then
        continue
    fi
    if ! containsElement $f "${IGNORE[@]}";then
        echo Linking $HOME_REPO/$f to $HOME
        rm -f $HOME/$f && ln -s $HOME_REPO/$f $HOME/$f
    fi
done

# soft link stuff under .config
[ ! -d $HOME/.config ] && mkdir $HOME/.config
for i in `find $HOME_REPO/.config -maxdepth 1 -print`;do
    f=`basename $i`
    if [[ $f == ".config" || -z "$f" ]];then
        continue
    fi
    echo Linking $HOME_REPO/.config/$f to $HOME/.config
    rm -f $HOME/.config/$f && ln -s $HOME_REPO/.config/$f $HOME/.config/$f
done

# soft link zsh stuff
`dirname $0`/zsh/setup.sh

