#!/bin/bash
MLX="$(pwd)"
AK=$MLX/AnyKernel3
AIK=$MLX/AIK
CLANG=~/TOOLCHAIN/clang
sudo apt update
sudo apt -f install -y aptitude
sudo aptitude -f install -y clang-11 lld-11
sudo aptitude -f install -y clang-10 lld-10
sudo aptitude -f install -y gcc-10
sudo aptitude -f install -y gcc-10-aarch64-linux-gnu gcc-10-arm-linux-gnueabi
sudo aptitude -f install -y gcc-aarch64-linux-gnu gcc-arm-linux-gnueabi
sudo aptitude -f install -y gcc clang binutils make flex bison bc build-essential libncurses-dev libssl-dev libelf-dev qt5-default
sudo apt -f --fix-missing install -y
sudo aptitude -f full-upgrade -y
cd $MLX && git pull
cd $AK && git pull
cd $AIK && git pull
cd $CLANG && git pull
cd $MLX
