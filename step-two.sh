#!/bin/bash

hwclock --systohc

vim /etc/locale.gen

echo "Enter your hostname: ";
read hoistname

echo "\"$hoistname\"" >> /etc/hostname

echo "YOU HAVE TO ADD encrypt IN VIM HOOKS"

sleep 5s

nano /etc/mkinitcpio.conf

mkinitcpio -p linux

blkid >> /tmp/id.txt

nano /tmp/id.txt


echo "

╭────────────────────────╮
|CONGO! 2nd Step is done!|
╰────────────────────────╯

"
