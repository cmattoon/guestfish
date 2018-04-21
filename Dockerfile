FROM ubuntu:16.04

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="guestfish"
LABEL org.label-schema.description="Provides libguestfs guestfish"
LABEL org.label-schema.usage="README.md"
LABEL org.label-schema.vcs-url="https://github.com/cmattoon/guestfish.git"
LABEL org.label-schema.docker.cmd.help="docker run --rm $CONTAINER"
LABEL org.label-schema.docker.cmd.debug="docker run --rm -v $(PWD):/work --entrypoint /bin/bash -it $CONTAINER"

ENV DEBIAN_FRONTEND noninteractive
ENV LIBGUESTFS_DEBUG 1
ENV LIBGUESTFS_TRACE 0

RUN apt-get update \
    && apt-get install -y \
       linux-image-generic \
       libguestfs-tools \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/work"]

WORKDIR /work

ENTRYPOINT ["guestfish"]

CMD ["-h"]
