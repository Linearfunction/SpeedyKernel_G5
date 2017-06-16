# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers
# Edited by Jeffsga88 for SpeedyKernel

## AnyKernel setup
# begin properties
properties() {
kernel.string=SpeedyKernel by jeffsga88 @ xda-developers
do.devicecheck=1
do.modules=1
do.cleanup=1
do.cleanuponabort=0
device.name1=h830
device.name2=h850
device.name3=h1

} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
initd=/system/etc/init.d;
is_slot_device=0;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk
chmod 755 /tmp/anykernel/ramdisk/sbin/busybox
chmod 640 $ramdisk/fstab.qcom
chmod 644 /system/etc/mixer_paths_tasha.xml

## AnyKernel install
dump_boot;

# begin ramdisk changes
#append_file init.rc "init.speedy.rc" "init.speedy.rc";

insert_line init.rc "init.speedy.rc" after "import /init.usb.rc" "import /init.speedy.rc";

# Backup existing fstab file before being replaced for f2fs support
backup_file fstab.qcom;
replace_file fstab.qcom 640 fstab.qcom;

# Backup mixer_paths_tasha.xml before replacing it
backup_file $root/system/etc/mixer_paths_tasha.xml;

# Init.d
cp -fp $patch/init.d/* $initd
chmod -R 755 $initd


# end ramdisk changes

write_boot;

## end install
