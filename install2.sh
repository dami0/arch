#!/usr/bin/bash

rm /etc/locale.gen
echo en_GB.UTF-8 UTF-8 > /etc/locale.gen
locale-gen

echo LANG=en_GB.UTF-8 > /etc/locale.conf
export LANG=en_GB.UTF-8

ln -s /usr/share/zoneinfo/Europe/London /etc/localtime

hwclock --systohc --utc

hostnamectl set-hostname DPC1a

systemctl enable dhcpcd.service

pacman -S grub
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo Root password
passwd

useradd -g wheel -G power,video,audio,storage,games d
echo d password
passwd d

echo We be finnish now...
sleep 5

cp ./etc/* /etc/
chmod -R 755 /etc

exit
