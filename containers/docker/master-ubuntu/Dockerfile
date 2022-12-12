FROM ubuntu:xenial

RUN \
  apt-get update && apt-get upgrade -q -y && \
  apt-get install -y --no-install-recommends golang git make gcc libc-dev ca-certificates && \
  git clone --depth 1 --branch release/1.7 https://github.com/DUBXCOIN/go-dubxcoin && \
  (cd go-dubxcoin && make gdubx) && \
  cp go-dubxcoin/build/bin/gdubx /gdubx && \

  apt-get remove -y golang git make gcc libc-dev && apt autoremove -y && apt-get clean && \
  rm -rf /go-dubxcoin

EXPOSE 8326
EXPOSE 32609

ENTRYPOINT ["/gdubx"]
