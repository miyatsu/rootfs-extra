# Copyright (c) 2018 Hunan ChenHan Information Technology Co., Ltd.
#
# SPDX-License-Identifier: GPL-3.0
#
# @author Ding Tao <miyatsu@qq.com>
#
# @date 28th Nov, 2018
#
# @brief This Makefile is for reset program

CC = aarch64-linux-gnu-gcc
#CC = gcc

register_reset_button: main.c -lpthread
	$(CC) -o register_reboot_button main.c -lpthread

.PHONY: clean
clean:
	-rm -f register_reboot_button
