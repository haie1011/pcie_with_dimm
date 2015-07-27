#
# Makefile for the linux pmfs-filesystem routines.
#
ifneq ($(KERNELRELEASE),)
	obj-m :=  pmfs.o
	pmfs-objs := bbuild.o balloc.o dir.o file.o inode.o namei.o super.o \
	symlink.o ioctl.o journal.o wprotect.o xip.o
else
	KDIR := /lib/modules/$(shell uname -r)/build
	PWD := $(shell pwd)
default:
	make -C $(KDIR) M=$(PWD) modules
clean:
	rm -rf *.o *.mod.c *.ko *.symvers
endif
#pmfs-$(CONFIG_PMFS_WRITE_PROTECT) += wprotect.o

