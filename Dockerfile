# Build stage
FROM golang:1.21-alpine AS builder

WORKDIR /app

# Copy go.mod and go.sum files first for better caching
COPY go.mod go.sum* ./
RUN go mod download

# Copy the source code
COPY . .

# Build the application
ARG VERSION=dev
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-X main.Version=${VERSION}" -o service_1 ./...

# Final stage
FROM alpine:3.18

WORKDIR /app

# Add non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Copy the binary from the builder stage
COPY --from=builder /app/service_1 .

# Expose the port
EXPOSE 8080

# Set environment variables
ENV GIN_MODE=release

# Command to run
ENTRYPOINT ["./service_1"]
