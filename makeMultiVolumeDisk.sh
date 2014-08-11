#!/bin/bash

VOLUMENAME=`echo $1 | sed -e s/Volumes// | tr -d /`

echo Target volume name is $VOLUMENAME.

DISKIDENTIFIER=`diskutil list | grep $VOLUMENAME | awk '{print $6}' | cut -c 1-5`

echo $VOLUMENAME is $DISKIDENTIFIER.

SOURCECOUNT=`ls $2 | grep .dmg | wc -l`

echo Source “.dmg” files are $SOURCECOUNT.

VOLUMESIZE=`expr 100 / $SOURCECOUNT`%

echo Each volume will make $VOLUMESIZE usage on $VOLUMENAME disk space.

VERSE=`for ((i=1; i<=$SOURCECOUNT; i++)); do echo JournaledHFS+ disk$i $VOLUMESIZE ; done`

diskutil partitionDisk $DISKIDENTIFIER $SOURCECOUNT GPTFormat $VERSE
