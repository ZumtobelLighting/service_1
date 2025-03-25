# My Go Application

This project is a simple Go application that demonstrates how to build and deploy a Go service using Docker and Kubernetes.

## Project Structure

```
my-go-app
├── src
│   ├── main.go          # Entry point of the application
│   └── internal
│       └── app.go      # Core application logic
├── go.mod               # Module dependencies
├── go.sum               # Dependency checksums
├── Dockerfile           # Docker image build instructions
├── .dockerignore        # Files to ignore when building the Docker image
├── Makefile             # Automation tasks for building and testing
├── helm
│   ├── Chart.yaml       # Helm chart metadata
│   ├── values.yaml      # Default configuration values for the Helm chart
│   └── templates
│       ├── deployment.yaml # Kubernetes deployment resource
│       └── service.yaml    # Kubernetes service resource
└── README.md            # Project documentation
```

## Getting Started

### Prerequisites

- Go 1.16 or later
- Docker
- Kubernetes (optional, for deployment)
- Helm (optional, for deployment)

### Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   cd my-go-app
   ```

2. Install dependencies:
   ```
   go mod tidy
   ```

### Running the Application

To run the application locally, use the following command:

```
go run src/main.go
```

### Building the Docker Image

To build the Docker image, run:

```
docker build -t my-go-app .
```

### Deploying with Helm

To deploy the application using Helm, follow these steps:

1. Package the Helm chart:
   ```
   helm package helm
   ```

2. Install the chart:
   ```
   helm install my-go-app helm/my-go-app-<version>.tgz
   ```

### Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

### License

This project is licensed under the MIT License. See the LICENSE file for details.