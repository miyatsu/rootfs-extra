#!/bin/sh

# Copyright (c) 2018 Hunan ChenHan Information Technology Co., Ltd.
#
# SPDX-License-Identifier: GPL-3.0
#
# @author Ding Tao <miyatsu@qq.com>
#
# @date 3rd Dec, 2018
#
# @brief This shell script will install openssh via apt and modify some
#	 configurations like allow password login.

apt install -y binutils gcc git

# Get the u-boot code
if [ -e u-boot ]
then
	rm -rf u-boot
fi
git clone --depth=50 -b u-boot-2018.03-armada-18.09 \
	https://github.com/MarvellEmbeddedProcessors/u-boot-marvell \
	u-boot
if [ $? -ne 0 ]
then
	echo "'git clone' exit none zero!"
	exit 1
fi

# Cd to source code and compile it
cd u-boot
make mvebu_espressobin-88f3720_defconfig
make env
if [ ! -e tools/env/lib.a ]
then
	echo "'make' exit none zero!"
	exit 1
fi

# Move shared library to rootfs
cp tools/env/lib.a /usr/local/lib/libubootenv.a

