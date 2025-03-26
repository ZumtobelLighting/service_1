# Simple Logging Service

A lightweight Go service that outputs log messages at regular intervals. This service is containerized and ready to deploy to Kubernetes or any container orchestration platform.

## Features

- Simple logging output every 5 seconds
- Configurable version via environment variable
- Containerized with multi-stage Docker build
- Automated build and publish pipeline with GitHub Actions

## Building Locally

To build the service locally:

```bash
go build -o main .
```

## Running Locally

To run the service:

```bash
./main
```

## Docker

### Building the Docker Image

```bash
docker build -t simple-logging-service:latest .
```

### Running the Docker Container

```bash
docker run -e VERSION=local-test simple-logging-service:latest
```

## CI/CD Pipeline

This repository includes a GitHub Actions workflow that:

1. Generates a version number based on git tags or commit hash
2. Builds the Docker image with the version information
3. Publishes the image to GitHub Container Registry (ghcr.io)

The workflow runs on pushes to the main branch, pull requests, and when tags are created.

## Environment Variables

- `VERSION`: Sets the version displayed in logs (default: "dev")
