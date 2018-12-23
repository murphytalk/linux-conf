#sourced by bash and zsh

is_lxss(){
    if uname -a | grep Microsoft > /dev/null;then
        lxss=1
    else
        lxss=0
    fi  
}

EDITOR=vim
alias t='todo.sh -d ~/.todo.cfg'

#ArchLinux
alias y='yay'
