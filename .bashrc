#
# ~/.bashrc
#
# set -x  #for debug
# Check if it is Windows Linux Subsystem
if uname -a | grep Microsoft >/dev/null;then
    WSL=1
fi

# Check distro
if [ -f /etc/os-release ];then
    if grep -i opensuse /etc/os-release >/dev/null;then
        OPENSUSE=1
    fi
fi

[ -f ~/.profile ] && source ~/.profile

PS1='[\u@\h \W]\$ '

if ! echo $PS1 | grep git_ps1 >/dev/null;then
    [ -f /etc/profile.d/git-prompt.sh ] && source /etc/profile.d/git-prompt.sh
fi

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
if [[ -z "$TMUX" ]];then
    if [[ $WSL == 1 && $OPENSUSE == 1 ]];then
        # OpenSUSE's tmux adpoting the new rule to create socket under /run instead of /var/run
        # but WSL nukes all permission changes to /run when it shutsdown and when it starts /run is always
        # can only be modified by root
        # see https://github.com/tmux/tmux/issues/1092
        sudo chmod 0777 /run
        [ ! -d /run/tmux ] && mkdir /run/tmux
    fi
    exec tmux
fi
