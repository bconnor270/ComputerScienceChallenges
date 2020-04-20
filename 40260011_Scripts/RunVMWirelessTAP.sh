#!/bin/bash

echo "Booting a Virtual Machine on emulated Intel x86 Architecture for installation."
echo "Wired TAP networking enabled."

read -p "How much RAM to allocate? (KB)  : " ram
read -p "Enter image name  : " image

sudo ip tuntap add tap0 mode tap user root
sudo

if [ $type -eq 1 ]
then
	sudo ip tuntap add tap0 mode tap user root


sudo qemu-system-x86_64 -m $ram -enable-kvm -hda $image -netdev user,id=net0 -device e1000,netdev=net0,mac=DE:AD:BE:EF:12:34