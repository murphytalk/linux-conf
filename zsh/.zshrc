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


host_specific="${HOME}/.$(hostname).zshrc"
[ -L $host_specific ] && . $host_specific
