#!/bin/bash
CMD="$@"
if [ -z "$CMD" ]; then
    CMD="-h"
fi
docker run --rm -v $(PWD):/work -t cmattoon/guestfish $CMD
