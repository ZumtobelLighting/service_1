# my-product-helm-chart

## Overview

This Helm chart provides a deployment for the microservices of the my-product application. It includes configurations for deployment, service, ingress, and customizable values.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.x

## Installation

To install the chart, use the following command:

```bash
helm install my-product ./my-product-helm-chart
```

## Configuration

The following table lists the configurable parameters of the chart and their default values.

| Parameter                | Description                                   | Default                  |
|--------------------------|-----------------------------------------------|--------------------------|
| `replicaCount`           | Number of replicas for the deployment         | `5`                      |
| `image.repository`       | Container image repository                     | `nanajanashia/argocd-app`|
| `image.tag`              | Container image tag                           | `1.2`                    |
| `service.type`           | Kubernetes service type                       | `ClusterIP`              |
| `service.port`           | Service port                                  | `8080`                   |
| `ingress.enabled`        | Enable ingress resource                       | `false`                  |
| `ingress.hosts`          | Ingress hostnames                             | `[]`                     |

## Usage

1. **Customize the values** in `values.yaml` as needed.
2. **Install the chart** using the Helm install command.
3. **Verify the deployment** with `kubectl get deployments`.

## Uninstalling the Chart

To uninstall/delete the `my-product` deployment:

```bash
helm uninstall my-product
```

## Contributing

Feel free to submit issues and pull requests to improve this Helm chart.