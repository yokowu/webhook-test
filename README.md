# Webhook Test

This repository contains configuration files for testing webhooks with various services.

## Services

- [MySQL](./mysql/manifest.yaml) - MySQL database configuration
- [PostgreSQL](./postgres/manifest.yaml) - PostgreSQL database configuration
- [Redis](./redis/manifest.yaml) - Redis key-value store configuration

## Structure

Each service has its own directory containing:
- `manifest.yaml` - Service metadata and configuration
- Additional configuration files as needed

## Usage

Each service directory contains a manifest file that describes the service configuration, including resource requirements, ports, and variables.

For example, the Redis service includes:
- Resource limits and recommendations
- Port configurations (Redis and Sentinel)
- Configurable variables like password, timeout, and TCP keepalive settings