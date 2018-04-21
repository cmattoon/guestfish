#!/bin/bash
docker run --rm --entrypoint /bin/bash -v $(PWD):/work -it cmattoon/guestfish
