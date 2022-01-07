FROM alpine:3.7

RUN apk add --no-cache lighttpd curl ffmpeg bash

RUN mkdir /tmp/www

WORKDIR /

COPY . .

EXPOSE 80

HEALTHCHECK CMD curl --fail http://localhost/snapshot.jpg || exit 1

ENTRYPOINT ["/grab.sh"]

