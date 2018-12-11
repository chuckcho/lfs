## Description

This repository contains docker configuration to build bootable iso image with the latest [Linux From Scratch 8.3](http://www.linuxfromscratch.org/lfs/downloads/8.3/LFS-BOOK-8.3.pdf).

## Why

General idea is to learn Linux by building and running LFS system in isolation from the host system.

## Structure

Scripts are organized in the way of following book structure whenever it makes sense. Some deviations are done to make a bootable iso image.

## Build

Use the following command:
```
    docker rm lfs
    docker build --tag lfs:8.3 .
    sudo docker run -it --privileged --name lfs lfs:8.3
    sudo docker cp lfs:/tmp/lfs.iso
    # Ramdisk you can find here: /tmp/ramdisk.img
```

Please note, that extended privileges are required by docker container in order to execute some commands (e.g. mount).

## Usage

Final result is bootable iso image with LFS system which, for example, can be used to load the system inside virtual machine (tested with VirtualBox).

## License

This work is based on instructions from [Linux from Scratch](http://www.linuxfromscratch.org/lfs) project and provided with MIT license.

## Todo

Some hard-coded paths need to be inferred -- e.g. GCC version in [5.08-make-libstdc.sh](scripts/prepare/5.08-make-libstdc.sh).
