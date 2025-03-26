FROM golang:1.21-alpine AS builder

WORKDIR /app

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

RUN go mod download

# Build the Go app
RUN go build -o main .

# Start a new stage from scratch
FROM debian:bookworm-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates

RUN update-ca-certificates

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/main /app/main

# Command to run the executable
ENTRYPOINT ["/app/main"]