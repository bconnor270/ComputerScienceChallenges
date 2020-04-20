#!/bin/bash

echo "Booting a Virtual Machine on emulated Intel x86 Architecture for installation."
echo "Wired TAP networking enabled."

read -p "Enter 1 for private bridging, or 2 for public bridging  : " type
read -p "What number is this device? (If this is the first device enter 0, second device enter 1 etc.)  : " devNum
tapName="tap$devNum"
read -p "How much RAM to allocate? (KB)  : " ram
read -p "Enter image name  : " image

sudo ip link add br0 type bridge
sudo ifconfig br0 up

if [ $devNum -lt 1]
then
	sudo ip link add br0 type bridge
	sudo ifconfig br0 up
fi


if [ $type -eq 1 ]
then
	sudo ip tuntap add $tapName mode tap user root
	sudo ifconfig $tapName up
	sudo ip link set $tapName master br0
fi

if [ $type -eq 2 ]
then
	read -p "What is the name of your host NIC?  : " nicName
	sudo ip addr flush dev $nicName
	sudo ip link set $nicName master br0
	sudo ip tuntap add $tapName mode tap user root
	sudo ip link set $tapName master br0
	sudo ifconfig $tapName up
	sudo ifconfig $nicName up
	sudo dhclient -v br0
fi

hexchars="0123456789ABCDEF"
end=$( for i in {1..6} ; do echo -n ${hexchars:$(( $RANDOM % 16 )):1} ; done | sed -e 's/\(..\)/-\1/g' )
macAddr="DE-AD-BE$end"
sudo qemu-system-x86_64 -m $ram -enable-kvm -hda $image -netdev tap,id=net0,ifname=$tapName -device e1000,netdev=net0,mac=$macAddr