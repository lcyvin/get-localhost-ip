BINARY_NAME=get-localhost-ip

build:
	mkdir -p build
	mkdir -p build/amd64
	mkdir -p build/arm64
	GOARCH=amd64 GOOS=darwin go build -o build/amd64/${BINARY_NAME}-darwin main.go
	GOARCH=amd64 GOOS=linux go build -o build/amd64/${BINARY_NAME}-linux main.go
	GOARCH=amd64 GOOS=windows go build -o build/amd64/${BINARY_NAME}-windows main.go
	GOARCH=arm64 GOOS=darwin go build -o build/arm64/${BINARY_NAME}-darwin-arm main.go

run:
	./${BINARY_NAME}

build_and_run: build run

clean:
	go clean
	rm -rf build
