# http://zsh.sourceforge.net/Intro/intro_3.html

#`.zlogin' is sourced in login shells.
#`.zprofile' is similar to `.zlogin', except that it is sourced before `.zshrc'.
#`.zprofile' is meant as an alternative to `.zlogin' for ksh fans;
#the two are not intended to be used together, although this could certainly be done if desired.
#`.zlogin' is not the place for alias definitions, options, environment variable settings, etc.;
#as a general rule, it should not change the shell environment at all. Rather,
#it should be used to set the terminal type and run a series of external commands (fortune, msgs, etc).

if [ -e "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zprofile ];then
    . "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zprofile
fi
if [ -e "${ZDOTDIR:-$HOME}"/.profile ];then
    . "${ZDOTDIR:-$HOME}"/.profile
fi
if [ -e "${ZDOTDIR:-$HOME}"/.profile-`uname` ];then
    . "${ZDOTDIR:-$HOME}"/.profile-`uname`
fi

if uname -a | grep Ubuntu > /dev/null;then
    [ -e "${ZDOTDIR:-$HOME}"/.profile-ubuntu ] && . "${ZDOTDIR:-$HOME}"/.profile-ubuntu
fi
