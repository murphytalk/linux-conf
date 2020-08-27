if test -e $HOME/.alias
    source $HOME/.alias
end

if uname -r | grep -i microsoft >/dev/null
    set WSL 1
end

if uname -r | grep -i gentoo >/dev/null
    set DISTRO_GENTOO 1

    function c
        sudo emerge --depclean $argv -vp
    end
    if test -e $HOME/.alias.gentoo
        source $HOME/.alias.gentoo
    end
end
