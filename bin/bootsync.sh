#!/bin/sh
sudo umount /var/www
sudo /usr/local/etc/init.d/nfs-client start
sleep 1
sudo mount.nfs 192.168.99.1:/var/www /var/www -v -o rw,async,noatime,rsize=32768,wsize=32768,proto=udp,udp,nfsvers=3
grep '\-\-dns' /var/lib/boot2docker/profile || {
	echo 'EXTRA_ARGS="$EXTRA_ARGS --dns 192.168.99.100 --dns 8.8.8.8 --dns 8.8.4.4"' | sudo tee -a /var/lib/boot2docker/profile	
}
echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee /etc/resolv.conf
