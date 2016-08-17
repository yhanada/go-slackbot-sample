ROOT_GOPATH=$(shell pwd)
VENDOR_GOPATH=$(shell pwd)/vendor
GOPATH=$(VENDOR_GOPATH)
APP_NAME=go-slackbot-sample
TOKEN=slack-bot-token

all: install build

install:
	mkdir -p $(VENDOR_GOPATH)
	go get -u github.com/kyokomi/slackbot

clean:
	rm -f $(APP_NAME)
	rm -rf $(VENDOR_GOPATH)

fmt:
	gofmt -w ./src/main.go
	goimports -w ./src

run: install
	go run ./src/main.go -token $(TOKEN)

build: install
	go build -o $(APP_NAME) ./src/main.go

test: install
	GOPATH=$(VENDOR_GOPATH):$(ROOT_GOPATH) go test -v ./src/...
