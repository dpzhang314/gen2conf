# gen2conf
some configurations on gentoo linux for daily use. 

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
sudo chroot /mnt/gentoo/ /bin/bash
```
