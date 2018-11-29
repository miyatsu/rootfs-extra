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


# Define sub directory name of build and download
BUILD_DIR_NAME := build
DOWNLOAD_DIR_NAME := download


# Top directory, build directory and download directory
TOP_DIR := $(shell pwd)
BUILD_DIR := $(shell mkdir -p $(TOP_DIR)/$(BUILD_DIR_NAME) && \
		    cd $(TOP_DIR)/$(BUILD_DIR_NAME) && \
		    pwd)

DOWNLOAD_DIR := $(shell mkdir -p $(TOP_DIR)/$(DOWNLOAD_DIR_NAME) && \
		       cd $(TOP_DIR)/$(DOWNLOAD_DIR_NAME) && \
		       pwd)

# Clean targets
CLEAN_TARGETS := $(BUILD_DIR)
DISTCLEAN_TARGETS := $(DOWNLOAD_DIR)


.PHONY: help install download clean distclean

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

download:
	$(TOP_DIR)/scripts/download.sh $(DOWNLOAD_DIR) $(BUILD_DIR)

clean:
	-rm -rf $(CLEAN_TARGETS)

distclean: clean
	-rm -rf $(DISTCLEAN_TARGETS)

