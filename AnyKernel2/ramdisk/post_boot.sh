#!/system/bin/sh

echo "Speedy Kernel - Boot Script Started" | tee /dev/kmsg

su
setenforce 0
mount -o rw,remount /system
cp "/etc/mixer_paths_tasha.xml" "/etc/mixer_paths_tasha.bak"
cp "/mixer_paths_tasha.xml" "/etc/mixer_paths_tasha.xml"
mount -o ro,remount /system
setenforce 1

echo "Speedy Kernel - Exiting post-boot script" | tee /dev/kmsg
