#!/bin/bash
# use dar to backup root partition

TIMESTAMP=$(date +%F)

dar
# calculate parity info
--execute "par2 c -r5 \"%p/%b.%n.par2\" \"%p/%b.%n.%e\""
# check atime
--alter=atime
# store excluded dirs as empty dirs
--empty-dir
# backup root
--fs-root /
# ignore darrc
--noconf
# backup location
--create /media/Portable/arch-root/arch-root
# size of each piece
--slice 3900M
# compression level
-z6
# files note to compress
-an
-Z "*.ogg"
-Z "*.avi"
-Z "*.mp?"
-Z "*.pk3"
-Z "*.flac"
-Z "*.zip"
-Z "*.tgz"
-Z "*.gz"
-Z "*.gzip"
-Z "*.bz2"
-Z "*.bzip2"
-Z "*.mov"
-Z "*.rar"
-Z "*.jar"
# dirs to exclude
--prune lost+found
--prune dev
--prune run
--prune proc
--prune sys
--prune tmp
--prune media
--prune mnt
--prune home
