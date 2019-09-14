FROM golang:alpine

COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache \
  bash \
  git \
  hugo
# RUN go get -v github.com/gohugoio/hugo

ENTRYPOINT [ "/entrypoint.sh" ]
