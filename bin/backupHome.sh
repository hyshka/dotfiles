#!/usr/bin/sh

if [ "$HOSTNAME" = brix ]; then
	DESTINATION="/run/media/hyshka/Lift Portable/brix-home"
else
	DESTINATION=/media/Portable/hyshka/
fi

SOURCE=/home/hyshka

# -a handles files in archive mode
# -A preserve ACLs
# -X preserve extended attributes
# -S handle sparse files efficiently
# -v increase verbosity
# --delete deletes extraneous files from destination dirs
# --info=progress2 show progress bars
# do each exclude separately
sudo rsync \
	-aAXSv \
	--delete \
	--info=progress2 \
	--exclude="$SOURCE/.thumbnails/*" \
	--exclude="$SOURCE/.cache/*" \
	--exclude="$SOURCE/.local/share/Trash/*" \
	--exclude="$SOURCE/.gvfs/*" \
	--exclude="$SOURCE/tmp/*" \
	$SOURCE \
	$DESTINATION
