FROM alpine:latest
MAINTAINER Peter Winter <peter@pwntr.com>

# create dirs for the config, the music, and the music to be imported
RUN mkdir /config /music /import

# update the base system
RUN apk update && apk upgrade

# install python 2, pip, GNU wget (replacing busybox' wget), and clear the cache afterwards
RUN apk add python py-pip wget && rm -rf /var/cache/apk/*

# upgrade pip and install beets
RUN yes | pip install -U pip \
    yes | pip install beets

VOLUME /config /music /import
	
ENTRYPOINT ["beet"]
CMD ["--version"]
