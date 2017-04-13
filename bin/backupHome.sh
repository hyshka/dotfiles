#!/usr/bin/sh
# requires osync.sh script

if [ "$HOSTNAME" = brix ]; then
	sudo osync.sh ~/dotfiles/osync/brix_sync.conf
else
	sudo osync.sh ~/dotfiles/osync/w520_sync.conf
fi
