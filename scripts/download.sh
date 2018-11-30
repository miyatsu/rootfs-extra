#!/bin/sh

# Copyright (c) 2018 Hunan ChenHan Information Technology Co., Ltd.
#
# SPDX-License-Identifier: GPL-3.0
#
# @author Ding Tao <miyatsu@qq.com>
#
# @date 28th Nov, 2018
#
# @brief This shell script will download the Ubuntu image to dl dir

DOWNLOAD_URL=http://cdimage.ubuntu.com/releases
RELEASE_VERSION=18.04
ISO_NAME=ubuntu-18.04.1-server-arm64.iso

DOWNLOAD_DIR=${1}
BUILD_DIR=${2}
OUTPUT_DIR=${3}

ISO_URL=${DOWNLOAD_URL}/${RELEASE_VERSION}/release/${ISO_NAME}

build_download() {
	wget -c --tries=5 -P ${DOWNLOAD_DIR} ${ISO_URL}
}

build_extract() {
	# Make iso dir as mount point
	if [ -e ${BUILD_DIR}/iso ]
	then
		rm -rf ${BUILD_DIR}/iso
	fi
	mkdir -p ${BUILD_DIR}/iso

	# Mount Ubuntu to mount point
	mount -o loop ${DOWNLOAD_DIR}/${ISO_NAME} ${BUILD_DIR}/iso

	# Remove rootfs dir for next process
	if [ -e ${BUILD_DIR}/rootfs ]
	then
		rm -rf ${BUILD_DIR}/rootfs
	fi

	# Unpack squashfs to new dir rootfs
	unsquashfs -d ${BUILD_DIR}/rootfs	\
		${BUILD_DIR}/iso/install/filesystem.squashfs

	# Cleaned up
	umount ${BUILD_DIR}/iso
	rmdir ${BUILD_DIR}/iso

}

build_alter() {
	# TODO: Use sed to remove root passwd

	# Add Marvell TTY device
	echo "ttyMV0" >> ${BUILD_DIR}/rootfs/etc/securetty
}

build_append() {
	# Append useful file into rootfs
}

build_pack() {
	# Pack all stuff into one single tar file
	tar -cjvf rootfs.tar.bz2 -C ${BUILD_DIR}/rootfs ${OUTPUT_DIR}
}

build_download
build_extract

