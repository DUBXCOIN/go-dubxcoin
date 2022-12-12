.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/DUBXCOIN/go-dubxcoin/cmd/swarm
	go build -o bin/gdubx     github.com/DUBXCOIN/go-dubxcoin/cmd/gdubx
	go build -o bin/bootnode github.com/DUBXCOIN/go-dubxcoin/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/DUBXCOIN/go-dubxcoin/swarm/...
