# Makefile for my-go-app

# Define the Go binary name
BINARY_NAME=my-go-app

# Define the Docker image name
IMAGE_NAME=my-go-app-image

# Define the default target
.PHONY: all
all: build

# Build the Go application
.PHONY: build
build:
	go build -o $(BINARY_NAME) ./src/main.go

# Run tests
.PHONY: test
test:
	go test ./...

# Build the Docker image
.PHONY: docker
docker:
	docker build -t $(IMAGE_NAME) .

# Clean up build artifacts
.PHONY: clean
clean:
	go clean
	rm -f $(BINARY_NAME)