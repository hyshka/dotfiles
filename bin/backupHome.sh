#!/usr/bin/sh
# requires osync.sh script

if [ "$HOSTNAME" = brix ]; then
	sudo bash osync.sh ~/dotfiles/osync/brix_sync.conf
else
	sudo bash osync.sh ~/dotfiles/osync/w520_sync.conf
fi
