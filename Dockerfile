FROM alpine:3.7

RUN apk add idris=1.0-r1 \
  --update-cache \
  --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
  --allow-untrusted

COPY Examples.idr /

ENTRYPOINT idris /Examples.idr
