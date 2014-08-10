#!/bin/bash

DISKSIZE=`diskutil list | grep ASD | awk '{printf("%d",$4 + 0.5)}'`

DICKDEVICE=`diskutil list | grep ASD | awk '{print $6}' | cut -c 1-5`

FORMAT=“JournaledHFS+”
