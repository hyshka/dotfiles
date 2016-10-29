#!/usr/bin/sh
# Requires dar and par2cmdline

if [ "$HOSTNAME" = brix ]; then
	sudo dar -B ~/.bin/darRoot --create "/run/media/hyshka/Lift Portab/brix-root/$(date +%F)-brix-root"
	sudo chown -R hyshka:hyshka "/run/media/hyshka/Lift Portab/brix-root"
else
	sudo dar -B ~/.bin/darRoot --create /media/Portable/w520-root/$(date +%F)-w520-root
	sudo chown -R hyshka:hyshka /media/Portable/w520-root/
fi
