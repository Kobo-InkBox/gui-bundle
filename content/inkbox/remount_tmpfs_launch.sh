#!/bin/sh

DEVICE=$(cat /opt/inkbox_device)
WIFI_ABLE=$(cat /run/wifi_able)

sync
umount -l -f /inkbox
umount -l -f /run
mount -t tmpfs tmpfs -o size=50% /inkbox
mount -t tmpfs tmpfs -o size=128M /run

mkdir -p /inkbox/book/split
mkdir -p /inkbox/dictionary
echo "${WIFI_ABLE}" > /run/wifi_able
if [ "${DEVICE}" != "n236" ] && [ "${DEVICE}" != "n437" ]; then
	ln -s /sys/class/backlight/mxc_msp430.0/brightness /var/run/brightness 2>/dev/null
else
	ln -s /sys/class/backlight/mxc_msp430_fl.0/brightness /var/run/brightness 2>/dev/null
fi
