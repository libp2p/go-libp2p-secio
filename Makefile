test: deps
	go test -race -v ./...

export IPFS_API ?= v04x.ipfs.io

gx:
	go get -u github.com/whyrusleeping/gx
	go get -u github.com/whyrusleeping/gx-go

deps: gx
	gx --verbose install --global
	gx-go rewrite
	go get -t ./...

mod_deps:
	env GO111MODULE=on go mod download
