if test -e $HOME/.alias
    source $HOME/.alias
end

if uname -a | grep Microsoft >/dev/null
    set WSL 1
end

if test (which emerge) = "/usr/bin/emerge"
    set DISTRO_GENTOO 1
end


if test $DISTRO_GENTOO -eq 1
    function c
        sudo emerge --depclean $argv -vp
    end
    if test -e $HOME/.alias.gentoo
        source $HOME/.alias.gentoo
    end
end
