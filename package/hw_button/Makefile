# Copyright (c) 2018 Hunan ChenHan Information Technology Co., Ltd.
#
# SPDX-License-Identifier: GPL-3.0
#
# @author Ding Tao <miyatsu@qq.com>
#
# @date 28th Nov, 2018
#
# @brief This Makefile is for reset program


# Use for cross compile
CC := $(CROSS_COMPILE)gcc

# No cross compiler specified, use arm64 by default
ifeq ($(CC), gcc)
	CC := aarch64-linux-gnu-gcc
endif

obj=hw_button

hw_button: main.c -lpthread
	$(CC) -o $(OUTPUT_DIR)/usr/local/bin/$(obj) main.c -lpthread

.PHONY: clean
clean:
	-rm -f $(obj)
