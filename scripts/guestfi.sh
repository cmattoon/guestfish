#!/bin/bash
docker run --rm -v $(PWD):/work -t cmattoon/guestfish $@
