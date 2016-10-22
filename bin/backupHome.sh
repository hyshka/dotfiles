#!/bin/sh

if [ "$HOSTNAME" = brix ]; then
	DEST="/run/media/hyshka/Lift Portable/brix-home"
else
	DEST=/media/Portable/hyshka/
fi

SRC=/home/hyshka

rsync \
	# -a handles files in archive mode
	# -A preserve ACLs
	# -X preserve extended attributes
	# -S handle sparse files efficiently
	# -v increase verbosity
	-aAXSv \
	# delete extraneous files from dest dirs
	--delete \
	# show progress bars
	--info=progress2 \
	# do each exclude separately
	--exclude="$SRC/.thumbnails" \
	--exclude="$SRC/.cache" \
	--exclude="$SRC/.local/share/Trash" \
	--exclude="$SRC/.gvfs" \
	--exclude="$SRC/tmp" \
	$SRC \ # source
	$DEST # destination

