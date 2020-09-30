if test -e $HOME/.alias
    source $HOME/.alias
end

if uname -r | grep -i microsoft >/dev/null
    set WSL 1
end

if test -d /etc/portage
    set DISTRO_GENTOO 1

    function c
        sudo emerge --depclean $argv -vp
    end
    if test -e $HOME/.alias.gentoo
        source $HOME/.alias.gentoo
    end
end

setenv JAVA_HOME /opt/openjdk-bin-11.0.8_p10/
set PATH /opt/npm-global/bin $PATH
