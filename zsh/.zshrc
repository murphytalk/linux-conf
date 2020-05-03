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

# fool emacs tramp
# https://www.emacswiki.org/emacs/TrampMode
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# disbale "file exists" error while redirecting to file
# https://unix.stackexchange.com/questions/212127/zsh-disable-file-exists-warning-with-redirection
setopt clobber

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
[ -d /etc/pacman.d ] && DISTRO_ARCH=y
[ -d /etc/xbps.d ] && DISTRO_VOID=y
which emerge > /dev/null && DISTRO_GENTOO=y
uname | grep Microsoft > /dev/null && DISTRO_WSL=y

# BSD ls's default blue color for director is unreadlable !
# to override this https://github.com/sorin-ionescu/prezto/blob/master/modules/utility/init.zsh#L97
export LSCOLORS=Exfxcxdxbxegedabagacad

alias t='todo.sh -d ~/.todo.cfg'

which docker-compose > /dev/null
if [ $? -eq 0 ];then
    alias dc=docker-compose
fi


# distro specific
if [ ! -z "$DISTRO_ARCH" ];then
    #ArchLinux
    alias y='yay'
    alias ro='pacman -Rns $(pacman -Qtdq)'
    export PATH=$PATH:/usr/lib/gettext	
fi

if [ ! -z "$DISTRO_GENTOO" ];then
    function c(){
        sudo emerge --depclean $1 -vp
    }
    alias e='sudo emerge'
    alias ea='sudo emerge --ask'
    alias q='sudo equery'
    alias u='sudo emerge -uDU --keep-going --with-bdeps=y @world'
    alias cc='sudo emerge --depclean'
    alias bdk='sudo make && sudo make modules_install && sudo make install'
fi

if [ ! -z "$DISTRO_WSL" ];then
    export DISPLAY=:0.0
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
