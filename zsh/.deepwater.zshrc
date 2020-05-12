function swem(){
    if [ -L ~/.emacs.d ];then
        cur=`ls -all |grep "\.emacs.d *->"|sed -r 's/^.*-> *(.*)/\1/g'`
	if echo $cur | grep "emacs\.doom" > /dev/null;then
	    new=~/work/emacs.d
	else
	    new=~/emacs.doom
	fi
	rm -f ~/.emacs.d
	ln -s $new ~/.emacs.d
    else
    	echo "~/.emacs.d is not symlink"
    fi
}

function WFH(){
	if [ -z "$1" ];then
	   port=9090
	else
	   port=$1
	fi
	rm -f /tmp/WFH.log
	nohup xfreerdp +clipboard /f /bpp:16  /size:1920x1200 /v:127.0.0.1:$port -u:6020186 -p:'G#entoo2' > /tmp/WFH.log 2>&1 &
}

JAVA_HOME=/mnt/arch/opt/jdk1.8.0_241
export PATH=$JAVA_HOME/bin:$PATH
