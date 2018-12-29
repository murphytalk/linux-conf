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
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# BSD ls's default blue color for director is unreadlable !
# to override this https://github.com/sorin-ionescu/prezto/blob/master/modules/utility/init.zsh#L97
export LSCOLORS=Exfxcxdxbxegedabagacad

alias t='todo.sh -d ~/.todo.cfg'
#ArchLinux
alias y='yay'
