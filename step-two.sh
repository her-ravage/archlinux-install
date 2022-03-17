#!/bin/bash

hwclock --systohc

vim /etc/locale.gen

echo "Enter your hostname: ";
read hoistname

echo "\"$hoistname\"" >> /etc/hostname

echo "YOU HAVE TO ADD encrypt IN VIM HOOKS"

sleep 5s

vim /etc/mkinitcpio.conf

mkinitcpio -p linux

blkid >> /tmp/id.txt

vim /tmp/id.txt


echo "

╭────────────────────────╮
|CONGO! 1st Step is done!|
╰────────────────────────╯

"
