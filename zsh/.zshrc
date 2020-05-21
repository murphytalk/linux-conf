#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#`.zshrc' is sourced in interactive shells. It should contain commands to set up aliases, functions, options, key bindings, etc. 
# zsh file order
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout/71258
#

# Fool emacs tramp
# https://www.emacswiki.org/emacs/TrampMode
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# disbale "file exists" error while redirecting to file
# https://unix.stackexchange.com/questions/212127/zsh-disable-file-exists-warning-with-redirection
setopt clobber

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Detect distro
[ -d /etc/pacman.d ] && DISTRO_ARCH=y
[ -d /etc/xbps.d ] && DISTRO_VOID=y
if [[ $(which emerge) == "/usr/bin/emerge" ]];then DISTRO_GENTOO=y;fi

uname | grep Microsoft > /dev/null && DISTRO_WSL=y
uname | grep Darwin > /dev/null && IS_MAC=y

alias t='todo.sh -d ~/.todo.cfg'
alias ga='git commit --amend --no-edit'

which docker-compose > /dev/null
if [ $? -eq 0 ];then
    alias dc=docker-compose
fi


# distro specific
#
if [ ! -z "$IS_MAC" ];then
    # BSD ls's default blue color for directory is unreadlable !
    # to override this https://github.com/sorin-ionescu/prezto/blob/master/modules/utility/init.zsh#L97
    export LSCOLORS=Exfxcxdxbxegedabagacad
fi

if [ ! -z "$DISTRO_GENTOO" ];then
    function c(){
        sudo emerge --depclean $1 -vp
    }
    alias e='sudo emerge'
    alias ea='sudo emerge --ask'
    alias es='sudo emaint -a sync'
    alias q='equery'
    alias u='sudo emerge -uDU --keep-going --with-bdeps=y -vp @world'
    alias uu='sudo emerge -uDU --keep-going --with-bdeps=y @world'
    alias cc='sudo emerge --depclean'
    alias bdk='sudo make && sudo make modules_install && sudo make install && sudo genkernel --install initramfs'
fi

if [ ! -z "$DISTRO_ARCH" ];then
    #ArchLinux
    alias y='yay'
    alias ro='pacman -Rns $(pacman -Qtdq)'
    export PATH=$PATH:/usr/lib/gettext	
fi

if [ ! -z "$DISTRO_WSL" ];then
    export DISPLAY=:0.0
    # exclude scoop path
    a=("${(@s/:/)PATH}")
    for i in $a ; if ! echo $i|grep scoop > /dev/null;then newpath="$newpath:$i";fi
    export PATH=$newpath
    unset a
    unset newpath
fi

if [ ! -z "$DISTRO_VOID" ];then
    #VoidLinux
    alias xi='sudo xbps-install -S'
    alias xu='sudo xbps-install -Su'
    alias xq='sudo xbps-query'
    alias xr='sudo xbps-remove'
fi


host_specific="${HOME}/.$(hostname).zshrc"
[ -L $host_specific ] && . $host_specific
