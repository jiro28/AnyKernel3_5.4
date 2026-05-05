### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=JiroZen-Fury
kernel.revision=5.4.254
kernel.made=Jiro (@Bugjiro688)
kernel.compiler=Neutron Clang 18.0.0
anykernel3.made=osm0sis @ xda-developers
message.word=Thank you for using JiroZen-Fury
do.devicecheck=1
do.cleanup=1
do.modules=0
device.name1=a52sxq
supported.versions=15-16
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import core functions/variables and setup patching - DO NOT REMOVE
. tools/ak3-core.sh;

# boot install
dump_boot;

write_boot;
## end boot install

## vendor_boot files attributes
vendor_boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# vendor_boot shell variables
BLOCK=vendor_boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
split_boot;

flash_boot;
## end vendor_boot install
