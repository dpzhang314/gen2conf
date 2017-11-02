# gen2conf
some configurations on gentoo linux for daily use. 

## Preparing the disks

fdisk

parted

mkfs.ext4 etc

    root # tar xvjpf stage3-*.tar.bz2 --xattrs --numeric-owner

## Prepare to mount 


```
sudo mkdir /mnt/gentoo
sudo mount /dev/sdxX /mnt/gentoo/
sudo mount -t proc /proc/ /mnt/gentoo/proc/
sudo mount --rbind /sys/ /mnt/gentoo/sys/
sudo mount --make-rslave /mnt/gentoo/sys/
sudo mount --rbind /dev /mnt/gentoo/dev/
sudo mount --make-rslave /mnt/gentoo/dev/
sudo test -L /dev/shm && rm /dev/shm && mkdir /dev/shm 
sudo mount -t tmpfs -o nosuid,nodev,noexec shm /dev/shm
sudo chmod 1777 /dev/shm
sudo cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
sudo chroot /mnt/gentoo/ /bin/bash
```

## Configure environment and portage

```
source /etc/profile
export PS1="(chroot) ${PS1}"
emerge-webrsync
emerge --sync
eselect profile list
eselect profile set 6 
emerge -avtuDN world
emerge -avt  gentoo-sources pciutils genkernel \
             sysklogd cronie dhcpcd grub:2     \
            gentoolkit eix 
rc-update add sysklogd default
rc-update add cronie default
rc-update add sshd default

## grub for UEFI (mount vfat EFI partation to /boot/efi/)
grub-install --target=x86_64-efi --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg


echo "Asia/Shanghai" > /etc/timezone
nano -w /etc/locale.gen
locale-gen
nano -w /etc/conf.d/hostname
nano    /etc/hosts
nano -w /etc/conf.d/hwclock
nano -w /etc/rc.conf

## remember to change root passwd
umount -l /mnt/gentoo/{dev,shm,pts}
umount -R /mnt/gentoo

```

## Networking

    emerge --ask net-wireless/wpa_supplicant net-wireless/wireless-tools

/etc/conf.d/net Force the use of wpa_supplicant

    ## Prefer wpa_supplicant over wireless-tools
    modules="wpa_supplicant"




