. ${HOME}/.zprezto/runcoms/zlogin

# If not running interactively, do not do anything
[[ $- != *i* ]] && return

[[ ! -z "$TMUX" ]] && return
# start tmux for login shell
TM=`tmux ls`
if [ $? -eq 0 ];then
    # tmux is already running , attach to to first session
    tmux_session=`echo $TM|sed 's/\(^[0-9]\):.*/\1/g'`
    if [ ! -z "$tmux_session" ];then
        echo Attaching to tmux session $tmux_session
        tmux attach -t $tmux_session
    fi
else
    echo Starting new tmux session
    tmux
fi
