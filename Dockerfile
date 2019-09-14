FROM golang:alpine

COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache \
  bash \
  git \
  hugo

ENTRYPOINT [ "/entrypoint.sh" ]
