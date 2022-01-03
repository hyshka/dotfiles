#! /bin/sh

efibootmgr --disk /dev/nvme0n1 --part 1 --create --label 'Arch Linux' --loader /vmlinuz-linux --unicode 'root=PARTUUID=61ee316a-5091-f74a-b2a3-4a50ece7453a rw initrd=\amd-ucode.img initrd=\initramfs-linux.img quiet loglevel=3 vga=current rd.udev.log_level=3 rd.systemd.show_status=auto vt.global_cursor_default=0 nowatchdog' --verbose
