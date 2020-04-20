Scripts for the QEMU project.

FirstTimeInstallation.sh - this will perform the first time running of a brand new VM.

RunVMNoNetworking.sh - this will run an image with an OS already installed, with no networking enabled.

RunVMUserModeNetworking - this will run an image with an OS already installed, with the default user-mode networking enabled.

RunVMWiredTAP - this will run an image with an OS already installed, and will add the device to either a privately or publicly bridged network.
	This script can be run multiple times in succession in order to construct a VLAN. (NB: the same image cannot be instantiated more than once).

TODO: Create a script to automate Wireless TAP Networking - see How-To guide stored in ComputerScienceChallenges/40260011_HowTo/wireless.html




Author: Ben Connor
Student No: 40260011
Queen's University Belfast