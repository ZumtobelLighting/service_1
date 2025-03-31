# Microservices Versions Chart

This Helm chart is designed to manage and track the versions of various microservices within a Kubernetes cluster. It provides a structured way to define, deploy, and maintain the microservices, ensuring that the correct versions are used in your environment.

## Chart Details

- **Chart Name**: Microservices Versions Chart
- **Version**: 1.0.0
- **Description**: A Helm chart for managing microservices versions.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.x

## Installation

To install the chart, use the following command:

```bash
helm install <release-name> ./microservices-versions-chart
```

Replace `<release-name>` with your desired release name.

## Configuration

The default configuration values for the chart can be found in the `values.yaml` file. You can customize the versions of the microservices by modifying this file.

### Example values.yaml

```yaml
microservices:
  serviceA:
    image: "serviceA:1.0.0"
  serviceB:
    image: "serviceB:2.0.0"
```

## Usage

After installation, you can access the microservices using the services defined in the `templates/service.yaml` file. Ensure that the correct versions are specified in the `values.yaml` file to avoid compatibility issues.

## Notes

For further customization and advanced usage, refer to the documentation in the `templates` directory and the `NOTES.txt` file provided after installation.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.