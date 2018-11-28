# Copyright (c) 2018 Hunan ChenHan Information Technology Co., Ltd.
#
# SPDX-License-Identifier: GPL-3.0
#
# @author Ding Tao <miyatsu@qq.com>
# 
# @date 28th Nov, 2018
#
# @brief This Makefile is a good tools to generate Ubuntu rootfs by adding our
#	 own files.
#
# This Makefile is the top level Makefile of this project, and it will somehow
# include sub Makefile in this repo.

.PHONY: help install clean distclean

help:
	@echo "Usage : make <target>"
	@echo "Where the target can be one of the following options"
	@echo "Help informations:"
	@echo "    help         - Show help message"
	@echo "Cleaning targets:"
	@echo "    clean        - Clean build file, but leave download files"
	@echo "    distclean    - Clean all build process generated files"

install:
	echo

clean:
	-rm -rf build/

distclean: clean
	-rm -rf dl/

