#!/usr/bin/bash

#active window by window class or launch the app
a(){
    #$1 window class name
    #$2 cmd lind to launch
    wmctrl -x -a $1 || exec $2
}

b(){
    #$1 window name
    #$2 cmd lind to launch
    wmctrl -a $1 || exec $2
}


case "$1" in
    console)
        a urxvt urxvtc
	wmctrl -x -b add,maximized_vert,maximized_horz -r urxvt
	;;
    emacs)
	a Emacs emacs
	;;
    file)
        a dolphin dolphin
	;;
    firefox)
        a Firefox firefox
	;;
    kdev)
        a Kdevelop kdevelop
	;;    
    chrome)
        a google-chrome /opt/google/chrome/chrome
	;;
    netflix)
        b Netflix "/opt/google/chrome/chrome http://www.netflix.com"
	;;
    sleep)
        sudo systemctl suspend
        ;;
    *)
	echo unknow command
	;;
esac
