#!/usr/bin/sh

OUTPUT="/home/hyshka/linux/pkglist/$(date +%F)-pkglist.txt"

pacman -Qqen > $OUTPUT
