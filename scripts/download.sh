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

ISO_URL=${DOWNLOAD_URL}/${RELEASE_VERSION}/release/${ISO_NAME}

build_download() {
	wget -c --tries=5 -P ${DOWNLOAD_DIR} ${ISO_URL}
}

build_extract() {
	# Make working directories, iso used for mount point
	mkdir -p ${BUILD_DIR}/iso
	mkdir -p ${BUILD_DIR}/rootfs

	# Mount Ubuntu to mount point
	mount -o loop ${DOWNLOAD_DIR}/${ISO_NAME} ${BUILD_DIR}/iso

	# Unpack squashfs
	unsquashfs -d ${BUILD_DIR}/rootfs	\
		${BUILD_DIR}/iso/install/filesystem.squashfs

	# Cleaned up
	umount ${BUILD_DIR}/iso
	rmdir ${BUILD_DIR}/iso

	# TODO: Use sed to remove root passwd and add tty device
}

build_download

