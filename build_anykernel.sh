#!/bin/bash
#
# Copyright - CrazyGamerGR
#     		 ________     __   ___
#    		/ ______|    |  | /  |
#    		|  |         |  |/  /
#   		|  |_____    |      \              
#   		\_______|    |__|\___|
#
#										 #
# --- --- Modified by jeffsga88 --- ---  #
##########################################
export ARCH=arm64
export CROSS_COMPILE=~/android/toolchain/los-aarch64-linux-android-4.9/bin/aarch64-linux-android-
##########################################
make clean && make mrproper

rm -r output830
rm -r output850

mkdir output830
mkdir output850
##########################################
make -C $(pwd) O=output830 speedykernel_h830_defconfig -j5
make -C $(pwd) O=output830 -j5

make -C $(pwd) O=output850 speedykernel_h850_defconfig -j5
make -C $(pwd) O=output850 -j5
##########################################
cp output830/arch/arm64/boot/Image.gz-dtb $(pwd)/arch/arm64/boot/zImage-dtb
cp output850/arch/arm64/boot/Image.gz-dtb $(pwd)/arch/arm64/boot/zImage-dtb
