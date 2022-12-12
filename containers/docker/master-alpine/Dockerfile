FROM alpine:3.5

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 --branch release/1.7 https://github.com/DUBXCOIN/go-dubxcoin && \
  (cd go-dubxcoin && make gdubx) && \
  cp go-dubxcoin/build/bin/gdubx /gdubx && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-dubxcoin && rm -rf /var/cache/apk/*

EXPOSE 8326
EXPOSE 32609

ENTRYPOINT ["/gdubx"]
