#!/usr/bin/env bash
while (( "$#" )); do
   if [ ! -z "$1" ];then
     if [[ $1 == "-r" ]]; then
        restore="y"
     else
        $dest=$1
     fi
   fi
   shift
done

if [ -z "$dest" ];then
  echo "basename $0 [-r] <dest dir>"
  echo "-r   restore backup to home"
  exit 1
fi

backup="$1/`hostname`-home-backup.tar.bz2"

if [ -f ${backup}.4 ];then
  read -p "Remove ${backup}.4 ?" -n 1 -r
  [[ ! $REPLY =~ ^[Yy]$ ]] && exit 0
fi

for i in {3..0};do
   f=${backup}.$i
   newf=${backup}.$((i+1))
   if [ -f $f ];then
     mv $f $newf
   fi
done

[ -f $backup ] && mv $backup $backup.0

pushd `pwd` >/dev/null
cd ~

tar -cpjf $backup \
--exclude=.cache \
--exclude=nohup.out \
--exclude=temp \
--exclude=.gradle \
--exclude=Dropbox \
--exclude=.dropbox \
--exclude=.dropbox-dist \
--exclude=.vscode \
--exclude=..vscode-cpptools \
--exclude=.config/Code/CachedData \
--exclude=.config/Code/Cache \
--exclude=.config/Code/Backups \
--exclude=.config/calibre \
--exclude=.texlive \
--exclude=.backups \
--exclude=logs \
--exclude=.ICAClient \
--exclude=.IntelliJIdea2018.3 \
--exclude=.debug \
--exclude=.dbus \
--exclude=.gvfs \
--exclude=.local/share/gvfs-metadata \
--exclude=.local/share/Trash \
--exclude=.recently-used \
--exclude=.thumbnails \
--exclude=.xsession-errors \
--exclude=.Trash \
--exclude=.steam \
--exclude=Downloads \
--exclude=GitHub \
--exclude=Public \
--exclude=Steam \
--exclude=Templates \
--exclude="VirtualBox VMs" \
--warning=no-file-changed .

popd > /dev/null

