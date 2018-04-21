PREFIX=/usr/local
IMG_NAME=guestfish
IMG_TAG=latest
IMG_REPO=cmattoon
DOCKERFILE_DIR=.

.PHONY: install
install:
	cp scripts/guestfi.sh $(PREFIX)/bin/guestfi.sh
	chmod +x $(PREFIX)/bin/guestfi.sh

.PHONY: container
container:
	docker build -t $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG) $(DOCKERFILE_DIR)

.PHONY: clean
clean:
	docker rmi -f $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG)
