# STM32CubeCLT GitHub Container Registry (GHCR) Setup

This repository demonstrates how to register a container using STM32CubeCLT on GitHub Container Registry (GHCR). Follow this guide to create and push your own GHCR container.

## Prerequisites

- Docker installed
- GitHub account
- Personal Access Token (PAT)
- STM32CubeCLT installation script

## Preparing the STM32CubeCLT Installation Script

First, clone this repository and navigate to the directory:

```bash
git clone https://github.com/hulryung/stm32cubeclt-ghcr.git
cd stm32cubeclt-ghcr
```

Download the STM32CubeCLT installation script from the [ST website](https://www.st.com/en/development-tools/stm32cubeclt.html) and place it in the same directory as the Dockerfile.

```bash
unzip en.st-stm32cubeclt_1.16.0_21983_20240628_1741_amd64.deb_bundle.sh
mv en.st-stm32cubeclt_1.16.0_21983_20240628_1741_amd64.deb_bundle.sh deb_bundle.sh
```

## Building the Docker Image

Build the Docker image using the following command:

```bash
docker build -t ghcr.io/USERNAME/stm32cubeclt:0.1 ./
```

Replace `USERNAME` with your GitHub username.

## Logging in to GitHub Container Registry

1. [Generate a Personal Access Token](https://github.com/settings/tokens)
   - Ensure it has `write:packages` permissions.

2. Log in using the generated token:

```bash
echo "YOUR_PAT" | docker login ghcr.io -u USERNAME --password-stdin
```

Replace `YOUR_PAT` with your generated token and `USERNAME` with your GitHub username.

## Pushing the Docker Image

Push the built image to GHCR:

```bash
docker push ghcr.io/USERNAME/stm32cubeclt:0.1
```

## Version Management

When releasing a new version, build and push with a new tag. For example:

```bash
docker build -t ghcr.io/USERNAME/stm32cubeclt:0.2 ./
docker push ghcr.io/USERNAME/stm32cubeclt:0.2
```

## Usage

To use this container:

```bash
docker pull ghcr.io/USERNAME/stm32cubeclt:0.1
docker run -it ghcr.io/USERNAME/stm32cubeclt:0.1
```

## Notes

- Replace `USERNAME` with your GitHub username.
- Manage version numbers appropriately.
- Modify the Dockerfile contents to suit your project needs.

You can create and manage your own STM32CubeCLT GHCR container by referring to this guide.
