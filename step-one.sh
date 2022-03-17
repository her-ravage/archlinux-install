#!/bin/bash

lsblk

echo "Select the disk: #/dev/nvme0n1";
read lsblkdisk

cgdisk $lsblkdisk

lsblk

echo "Select the partition: #/dev/nvme0n1p6 root";
read lsblkpartroot

cryptsetup -y --use-random luksFormat $lsblkpartroot

cryptsetup luksOpen $lsblkpartroot cryptroot

lsblk

sleep 3s

ls /dev/mapper

sleep 3s

echo "Select the partition: #/dev/nvme0n1p5 boot";
read lsblkpartboot

mkfs.ext4 $lsblkpartboot

mkfs.ext4 /dev/mapper/cryptroot

mount /dev/mapper/cryptroot /mnt

mkdir /mnt/boot /mnt/boot/efi

mount /dev/$lsblkpartboot /mnt/boot

lsblk

echo "Select the partition of windows efi: #/dev/nvme0n1p2 efi";
read lsblkpartefi

mount /dev/$lsblkpartefi

echo "Select your CPU (amd or intel): ";
read AI

if [[ $AI == "amd" ]]; then
CPU=amd-ucode
else
CPU=intel-ucode
fi

pacstrap /mnt linux linux-firmware base base-devel git vim grub efibootmgr $CPU

genfstab -U /mnt >> /mnt/etc/fstab

echo "

╭────────────────────────╮
|CONGO! 1st Step is done!|
╰────────────────────────╯

"

arch-chroot /mnt
