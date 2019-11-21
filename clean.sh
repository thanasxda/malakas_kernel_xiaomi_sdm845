#!/bin/bash
rm -rf out
make O=out clean
make O=out mrproper
clear
green='\033[01;32m'
restore='\033[0m'
echo -e "${green}"
echo "Μαλάκα!"
echo -e "${restore}"
