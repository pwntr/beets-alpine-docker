FROM alpine:latest
MAINTAINER Peter Winter <peter@pwntr.com>

# create dirs for the config, the music, and the music to be imported
RUN mkdir /config /music /import

# update the base system
RUN apk update && apk upgrade

# install python 2, GNU wget (replacing busybox' wget), imagemagick, and clear the cache afterwards
RUN apk add --update python py-pip wget imagemagick && rm -rf /var/cache/apk/*

# upgrade pip and install beets with some useful plugin requirements
RUN pip install -U pip && \
    pip install beets && \
    pip install requests && \
    pip install discogs-client

VOLUME /config /music /import
	
ENTRYPOINT ["beet"]
CMD ["--version"]
