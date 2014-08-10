#!/bin/bash

DISKSIZE=`diskutil list | grep ASD | awk '{printf("%d",$4 + 0.5)}'`

DICKDEVICE=`diskutil list | grep ASD | awk '{print $6}' | cut -c 1-5`

FORMAT=JournaledHFS+

echo $FORMAT

VOLUMESIZE=`expr 100 / $1`%

VERSE=`for ((i=1; i<=$1; i++)); do echo $FORMAT disk$i $VOLUMESIZE ; done`

diskutil partitionDisk $DICKDEVICE $1 GPTFormat $VERSE
