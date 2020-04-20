#!/bin/bash

echo "Booting a Virtual Machine on emulated Intel x86 Architecture for installation."

read -p "How much RAM to allocate? (KB)  : " ram
read -p "Enter image name  : " image

sudo qemu-system-x86_64 -m $ram -enable-kvm -hda $image