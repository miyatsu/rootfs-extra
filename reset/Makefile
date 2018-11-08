CC = aarch64-linux-gnu-gcc
#CC = gcc

register_reset_button: main.c
	$(CC) -o register_reset_button main.c -lpthread

.PHONY: clean
clean:
	-rm -f register_reset_button
