FROM golang:1.21-alpine AS builder

WORKDIR /app

# Copy go.mod first for better layer caching
COPY go.mod ./
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app with version information
ARG VERSION=dev
ENV VERSION=${VERSION}
RUN go build -ldflags="-X main.version=${VERSION}" -o main .

# Start a new stage for a smaller image
FROM alpine:3.19

# Install CA certificates for HTTPS connections
RUN apk --no-cache add ca-certificates

WORKDIR /app

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/main /app/main

# Set environment variable for runtime
ENV VERSION=${VERSION}

# Command to run the executable
ENTRYPOINT ["/app/main"]