FROM alpine:latest
MAINTAINER Peter Winter <peter@pwntr.com>

# create dirs for the config, the music, and the music to be imported
RUN mkdir /config /music /import

# set the beets dir environment variable. This tells beets where to store configs, dbs, plugin sidecar files etc.
ENV BEETSDIR /config

# copy the config from the project folder into the container
COPY config.yaml /config/

# install python 3, GNU wget (replacing busybox' wget), imagemagick
RUN apk add --no-cache python3 wget imagemagick

# upgrade pip and install beets with some useful plugins and requirements
RUN pip3 install --upgrade pip && \
    pip3 install beets requests discogs-client pylast

VOLUME /config /music /import

ENTRYPOINT ["beet"]

# by default, import everything from within the /import dir when starting this container
CMD ["import", "/import"]
