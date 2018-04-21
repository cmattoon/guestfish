#!/bin/bash
# Converts *.img to *.tgz, then imports to docker
#
# Usage:
#    ./docker-import-img <img> <docker-img-tag>
#
# Example:
#    ./docker-import-img ~/Desktop/raspbian-jessie.img cmattoon/raspbian:jessie
#
SRC_IMG=${1:?"argv[1] = source image (.img)"}
IMAGE_NAME=${2:?"argv[2] = docker image name + tag ('foo/bar:1.0')"}
DST_FILE="import-me.tgz"
KEEP_TAR=${KEEP_TAR:-"nope"}

echo " [+] Converting $SRC_IMG to $DST_FILE"
./guestfi.sh --ro -a "/work/$SRC_IMG" -m /dev/sda2:/ tar-out / "$DST_FILE"

test -f "$DST_FILE" || { echo "Failed to create tarball" && exit 1; }

echo " [+] Importing $DST_FILE as $IMAGE_NAME"
cat "$DST_FILE" | docker import - "${IMAGE_NAME}"
RC=$?

if [ "$RC" == "0" ]; then
    echo " [+] Done"
    
    if [ "$KEEP_TAR" != "yes" ]; then
	echo " ... Removing $DST_FILE"
	rm -f "$DST_FILE"
    fi
fi

