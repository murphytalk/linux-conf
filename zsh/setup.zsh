#!/usr/bin/env zsh
setopt EXTENDED_GLOB
P=$( cd "$(dirname $0)" >/dev/null 2>&1 ; pwd -P )
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    HOME_FILE="${ZDOTDIR:-$HOME}/.${rcfile:t}"
    if [ -z "$HOME_FILE" ];then
        continue
    fi
    [[ ! -L  $HOME_FILE ]] && ln -s "$rcfile" $HOME_FILE
    #override with my own zsh files
    MYFILE=$P/.${rcfile:t}
    [[  -f $Mrm YFILE ]] && rm -f $HOME_FILE && ln -s $MYFILE $HOME_FILE
done

