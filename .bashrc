#
# ~/.bashrc
#

[ -f ~/.profile ] && source ~/.profile

PS1='[\u@\h \W]\$ '

if ! echo $PS1 | grep git_ps1 >/dev/null;then
    [ -f /etc/profile.d/git-prompt.sh ] && source /etc/profile.d/git-prompt.sh
fi

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux
