#!/bin/bash
### MLX COMPILATION SCRIPT
DATE_START=$(date +"%s")
yellow="\033[1;93m" 
magenta="\033[05;1;95m"
restore="\033[0m"
echo -e "${magenta}"
echo ΜΑΛΆΚΑΣ KERNEL
echo -e "${yellow}"
make kernelversion 
echo -e "${restore}"
export USE_CCACHE=1
export USE_PREBUILT_CACHE=1
export PREBUILT_CACHE_DIR=~/.ccache
export CCACHE_DIR=~/.ccache
ccache -M 30G

export KBUILD_BUILD_USER=thanas
export KBUILD_BUILD_HOST=MLX

###setup
MLX=~/GIT/malakas_kernel_xiaomi_sdm845
AK=$MLX/AnyKernel3
OUT=$MLX/out/arch/arm64/boot
KERNEL=~/Desktop/MLX
TC=~/TOOLCHAIN
###
GCC32=$TC/arm-linux-gnueabi/bin 
GCC64=$TC/aarch64-linux-gnu/bin
CLANG=$TC/clang/bin
BINUTILS=$TC/binutils/bin
###
DEFCONFIG=malakas_beryllium_defconfig
checkhz=$( grep -ic "framerate = < 0x3C >" $MLX/arch/arm64/boot/dts/qcom/dsi-panel-tianma-fhd-nt36672a-video.dtsi )
if [ $checkhz -eq -1 ]; then
HZ=stock
echo -e "${yellow}"
echo you are building stock
echo -e "${restore}"
else
HZ=69-65hz
echo -e "${yellow}"
echo you are building with refreshrate overdrive
echo -e "${restore}"
fi;
DEVICE=beryllium
VERSION=q
KERNELINFO=${VERSION}_${DEVICE}_${HZ}_$(date +"%Y-%m-%d")
KERNELNAME=malakas_kernel_$KERNELINFO.zip
THREADS=-j$(nproc --all)
#FLAGS="AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip"
#CLANG_FLAGS="CC=clang"
#VERBOSE="V=1"

###
export ARCH=arm64 && export SUBARCH=arm64 $DEFCONFIG

export CROSS_COMPILE=$GCC64/aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=$GCC32/arm-linux-gnueabi-

#export CLANG_TRIPLE=$GCC64/aarch64-linux-gnu-
#export LD_LIBRARY_PATH="$CLANG/../lib:$CLANG/../lib64:$LD_LIBRARY_PATH"
#export PATH="$CLANG:$BINUTILS:$PATH"

###start compilation 
mkdir -p out
make O=out ARCH=arm64 $DEFCONFIG
make O=out $THREADS $VERBOSE $CLANG_FLAGS $FLAGS 

###zip kernel
if [ -e $OUT/Image.gz-dtb ]; then
echo -e "${yellow}"
echo zipping kernel...
echo -e "${restore}"
mkdir -p $KERNEL/.compile/
mv $OUT/Image.gz-dtb $AK/Image.gz-dtb
cp $MLX/out/include/generated/compile.h $KERNEL/.compile/compile.h
cd $AK
zip -r $KERNELNAME * -x .git .gitignore README.md *placeholder
rm -rf Image.gz-dtb
mv $KERNELNAME $KERNEL

###
echo -e "${yellow}"
cat $KERNEL/.compile/compile.h
echo "-------------------"
echo "Build Completed in:"
echo "-------------------"
DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo -e "${magenta}"
echo "Time: $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
echo -e "${restore}"

###push kernel
cd $KERNEL
###configure adb over wifi
#adb kill-server
#adb tcpip 5555
#adb connect 192.168.3.101:5555
#sleep 2
echo -e "${magenta}"
echo CONNECT DEVICE TO PUSH KERNEL!!!
echo -e "${restore}"
adb wait-for-device
adb push $KERNELNAME /sdcard/MLX/$KERNELNAME
adb reboot recovery
else
echo -e "${magenta}"
echo "-------------------"
echo "   Build Failed    "
echo "-------------------"
echo -e "${restore}"
fi;
###
function clean_all {
if [ -e $MLX/out ]; then
cd $MLX
rm -rf out
make O=out clean
make mrproper
fi;
}
while read -p "Clean stuff (y/n)? " cchoice
do
case "$cchoice" in
    y|Y )
        clean_all
        echo
        echo "All Cleaned now."
        break
        ;;
    n|N )
        break
        ;;
    * )
        echo
        echo "Invalid try again!"
        echo
        ;;
esac
done
if [ -e $MLX/out/include/generated/compile.h ]; then
cd $MLX
echo -e "${yellow}"
echo overriding option, force clean due to build success
echo -e "${restore}"
rm -rf out
make O=out clean
make mrproper
fi;

