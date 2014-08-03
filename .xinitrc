xset +fp /usr/share/fonts/local
xset fp rehash
xrdb ~/.Xresources
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx&
if [ -z "$WM" ];then
	WM=awesome
fi
#xrandr --output DVI-I-1 --rotate left
exec $WM

