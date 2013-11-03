#!/usr/bin/bash

rm /etc/pacman.d/mirrorlist
rm /etc/pacman.conf
cp ./pacman.conf /etc/
cp ./mirrorlist /etc/pacman.d/

pacman -Syy
/usr/bin/pacstrap -i /mnt $(cat /install/pacbac.repo)

/usr/bin/genfstab -U -p /mnt >> /mnt/etc/fstab
nano /mnt/etc/fstab

cp ./install2.sh /mnt/

echo Now we chroot! Run /mnt/install2.sh once in
wait 5

arch-chroot /mnt /bin/bash
