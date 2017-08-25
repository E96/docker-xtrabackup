#!/bin/sh
IP=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
echo "Waiting for backup on $IP:9999"
nc -l 9999 | tar -C /data -x
echo "Stream complete"
du -sh /data
echo "prepare backup"
xtrabackup --prepare --target-dir /data
