# Helm Chart for Microservices

This Helm chart provides a structure for deploying multiple microservices with versioning support. Each microservice is encapsulated in its own sub-chart, allowing for modular deployment and management.

## Directory Structure

```
helm-chart
├── charts
│   └── microservice1
│       ├── Chart.yaml
│       ├── templates
│       │   └── deployment.yaml
│       └── values.yaml
├── Chart.yaml
├── README.md
└── values.yaml
```

## Installation

To install the Helm chart, use the following command:

```bash
helm install <release-name> ./helm-chart
```

Replace `<release-name>` with your desired release name.

## Configuration

You can customize the deployment by modifying the `values.yaml` files located in the root of the Helm chart and within each microservice's directory. The root `values.yaml` applies to all microservices, while the microservice-specific `values.yaml` allows for individual configuration.

## Updating

To update the chart or the microservices, modify the respective `Chart.yaml` files and use the following command:

```bash
helm upgrade <release-name> ./helm-chart
```

## Notes

- Ensure that you have Helm installed and configured in your Kubernetes environment.
- Each microservice can have its own versioning, allowing for independent updates and rollbacks.