FROM alpine:latest
MAINTAINER Peter Winter <peter@pwntr.com>

# create dirs for the config, the music, and the music to be imported
RUN mkdir /config /music /import

# set the beets dir
ENV BEETSDIR /config

# copy the config
COPY config.yaml /config/config.yaml

# copy the flac test script to the root dir and make it executable
COPY testflacs.sh /

RUN chmod +x testflacs.sh

# update the base system
RUN apk update && apk upgrade

# install python 2, GNU wget (replacing busybox' wget), imagemagick, flac, and clear the cache afterwards
RUN apk add python py-pip wget imagemagick flac && rm -rf /var/cache/apk/*

# upgrade pip and install beets with some useful plugins and requirements
RUN pip install -U pip && \
    pip install beets requests discogs-client pylast https://github.com/ocelma/python-itunes/archive/master.zip

VOLUME /config /music /import

# by default, import everything in the /import dir when starting this container
CMD ["beet", "import", "/import"]
