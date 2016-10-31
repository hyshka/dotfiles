#!/bin/zsh
#
VBoxManage modifyvm "El Capitan" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "El Capitan" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "El Capitan" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "El Capitan" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-F2238BAE"
VBoxManage setextradata "El Capitan" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "El Capitan" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
