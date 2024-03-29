.PHONY: default clean lint build deps test testdeps

BIN_NAME = "pocket-dupekiller"
DIST_DIR = "dist"

default: clean lint build

build: clean $(DIST_DIR)
	go build -o $(DIST_DIR)/$(BIN_NAME) $(BIN_NAME).go

lint:
	golangci-lint run

clean:
	rm -rf $(DIST_DIR)

$(DIST_DIR):
	mkdir -p $(DIST_DIR)

deps:
	go get ./...

test: testdeps
	go test ./...

testdeps:
	go get -t ./...
