cmattoon/guestfish
==================

This image provides the `guestfish` program from `libguestfs`


Usage
-----

The `guestfi.sh` script runs the image with `-v $(PWD):/work`, which is the `WORKDIR` of the
image. This lets you use `guestfi.sh` just as you would if you installed `guestfish`.

## CLI

   1. Run `./scripts/cli.sh`
   2. In the container, run `guestfish`


Conversion Scripts
------------------

## Convert *.img to Docker Image

    `./scripts/docker-import-img.sh <path-to-img> <docker-img-tag>`

Build
-----

## Make

If you have `make` installed, use:

    make container


## Docker

If you don't have `make` installed, build normally with docker:

    docker build -t cmattoon/guestfish .

