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

ISO_URL=${DOWNLOAD_URL}/${RELEASE_VERSION}/release/${ISO_NAME}

wget ${ISO_URL}

