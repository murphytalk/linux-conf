#!/usr/bin/env bash
#https://wiki.gentoo.org/wiki/Elogind
#https://fitzcarraldoblog.wordpress.com/2018/03/14/gentoo-linux-a-work-around-to-be-able-to-resume-from-suspend-to-ram-when-using-the-nvidia-closed-source-driver/

username=mu
userhome=/home/$username
export XAUTHORITY="$userhome/.Xauthority"
export DISPLAY=":0"

case $1/$2 in
  pre/*)
    # Put here any commands you want to be run when suspending or hibernating.
    su $username -c "qdbus org.kde.KWin /Compositor suspend" &
    ;;
  post/*)
    # Put here any commands you want to be run when resuming from suspension or thawing from hibernation.
    su $username -c "qdbus org.kde.KWin /Compositor resume" &
    # su $username -c "/usr/bin/kwin_x11 --replace" &
    ;;
esac
