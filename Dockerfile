# Build Gdubx in a stock Go builder container
FROM golang:1.9-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /go-dubxcoin
RUN cd /go-dubxcoin && make gdubx

# Pull Gdubx into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-dubxcoin/build/bin/gdubx /usr/local/bin/

EXPOSE 8326 8326 32609 32609/udp
ENTRYPOINT ["gdubx"]
