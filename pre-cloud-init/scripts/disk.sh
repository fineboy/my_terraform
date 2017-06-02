#!/bin/bash


DEVICE_FS=`blkid -o value -s TYPE ${DEVICE}`
if [ "`echo -n $DEVICE_FS`" == "" ] ; then 
	mkfs.ext3 ${DEVICE}
fi
mkdir -p /innocent
echo '${DEVICE} /innocent ext3 defaults 0 0' >> /etc/fstab
mount /innocent
