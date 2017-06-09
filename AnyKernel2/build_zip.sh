#!/bin/bash
# Copy boot image to current directory,
# then create the flashable kernel zip image

while [[ $b != "Y" ]]; do
read -p 'Please input kernel major version: ' major
read -p 'Please input kernel minor version: ' minor
echo "You inputed: " $major.$minor " Is this correct?"
read -p 'Enter Y or N to continue: ' response
b="$(echo $response | tr '[a-z]' '[A-Z]')"
if [ $b == "Y" ]; then
	echo 'The kernel version is set to:' $major.$minor
fi
done

cp ~/android/kernel/SpeedyKernel_G5/output830/arch/arm64/boot/Image.gz-dtb $(pwd)/zImage-dtb
zip -r9 SpeedyKernel-h830-by-Jeffsga88.zip * -x README SpeedyKernel-h830-by-Jeffsga88.zip

# Copy compiled kernel to desktop
cp $(pwd)/SpeedyKernel-h830-by-Jeffsga88.zip ~/Desktop/SpeedyKernel-h830-by-Jeffsga88-v$major.$minor.zip

# Remove h830 boot images and completed kernels first before running h850
rm zImage-dtb
rm SpeedyKernel-h830-by-Jeffsga88.zip

cp ~/android/kernel/SpeedyKernel_G5/output850/arch/arm64/boot/Image.gz-dtb $(pwd)/zImage-dtb
zip -r9 SpeedyKernel-h850-by-Jeffsga88.zip * -x README SpeedyKernel-h850-by-Jeffsga88.zip

# Copy compiled kernel to desktop

cp $(pwd)/SpeedyKernel-h850-by-Jeffsga88.zip ~/Desktop/SpeedyKernel-h850-by-Jeffsga88-v$major.$minor.zip

# Remove boot images and completed kernels before exiting

rm zImage-dtb
rm SpeedyKernel-h850-by-Jeffsga88.zip

