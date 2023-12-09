# LimeSurvey Docker & Kubernetes Deployment

This repository contains the necessary files to containerize and deploy LimeSurvey using Docker and Kubernetes. LimeSurvey is an open-source online survey application that provides powerful tools to create and manage surveys. The `Dockerfile` is used to create a LimeSurvey container image, and the Kubernetes YAML files are used to deploy LimeSurvey together with PostgreSQL on a Kubernetes cluster.

## Dockerfile

The `Dockerfile` in this repository is based on the `debian:bullseye` image and installs PHP along with the necessary PHP extensions required by LimeSurvey. It also prepares the LimeSurvey application by copying and unzipping the LimeSurvey zip file into the container.

## Kubernetes Deployment

The Kubernetes YAML files define the necessary resources to deploy LimeSurvey and PostgreSQL within the `limesurvey` namespace. It includes:

- Namespace creation
- Deployments for LimeSurvey and PostgreSQL
- Services for internal networking
- PersistentVolumeClaims for data persistence
- An APIRule for routing and access control

## Prerequisites

Before deploying LimeSurvey on Kubernetes, ensure that you have the following prerequisites:

- A Kubernetes cluster
- kubectl command-line tool installed and configured
- Access to a container registry (if you plan to build and push the Docker image)

## Usage

### Building the Docker Image

1. Clone the repository and navigate to the directory containing the `Dockerfile`.
2. Build the Docker image using the following command:

```bash
docker build -t your-registry/limesurvey:latest .
```

3. Push the image to your container registry:

```bash
docker push your-registry/limesurvey:latest
```

Replace `your-registry` with your actual container registry path.

### Deploying to Kubernetes

1. Update the image reference in the LimeSurvey deployment YAML file to point to your Docker image.
2. Apply the Kubernetes YAML files using `kubectl`:

```bash
kubectl apply -f deploy-limesurvey.yaml
```

This command will create all the necessary resources in your Kubernetes cluster.

### Accessing LimeSurvey

After deployment, LimeSurvey should be accessible through the hostname specified in the `APIRule` (e.g., `apj-sap-survey`). Ensure that this hostname is properly configured
