# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: gdubx android ios gdubx-cross swarm evm all test clean
.PHONY: gdubx-linux gdubx-linux-386 gdubx-linux-amd64 gdubx-linux-mips64 gdubx-linux-mips64le
.PHONY: gdubx-linux-arm gdubx-linux-arm-5 gdubx-linux-arm-6 gdubx-linux-arm-7 gdubx-linux-arm64
.PHONY: gdubx-darwin gdubx-darwin-386 gdubx-darwin-amd64
.PHONY: gdubx-windows gdubx-windows-386 gdubx-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

gdubx:
	build/env.sh go run build/ci.go install ./cmd/gdubx
	@echo "Done building."
	@echo "Run \"$(GOBIN)/gdubx\" to launch gdubx."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/gdubx.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/gdubx.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/jteeuwen/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go install ./cmd/abigen

# Cross Compilation Targets (xgo)

gdubx-cross: gdubx-linux gdubx-darwin gdubx-windows gdubx-android gdubx-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-*

gdubx-linux: gdubx-linux-386 gdubx-linux-amd64 gdubx-linux-arm gdubx-linux-mips64 gdubx-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-*

gdubx-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/gdubx
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep 386

gdubx-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/gdubx
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep amd64

gdubx-linux-arm: gdubx-linux-arm-5 gdubx-linux-arm-6 gdubx-linux-arm-7 gdubx-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep arm

gdubx-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/gdubx
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep arm-5

gdubx-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/gdubx
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep arm-6

gdubx-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/gdubx
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep arm-7

gdubx-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/gdubx
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep arm64

gdubx-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/gdubx
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep mips

gdubx-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/gdubx
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep mipsle

gdubx-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/gdubx
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep mips64

gdubx-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/gdubx
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-linux-* | grep mips64le

gdubx-darwin: gdubx-darwin-386 gdubx-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-darwin-*

gdubx-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/gdubx
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-darwin-* | grep 386

gdubx-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/gdubx
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-darwin-* | grep amd64

gdubx-windows: gdubx-windows-386 gdubx-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-windows-*

gdubx-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/gdubx
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-windows-* | grep 386

gdubx-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/gdubx
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gdubx-windows-* | grep amd64
