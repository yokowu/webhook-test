# webhook-test

This repository contains configurations and templates for setting up various database services using Docker Compose.

## Services

### Redis
- **Description**: Fast KV database for testing.
- **Port**: 6379
- **Sentinel Port**: 26379
- **Configuration**: [redis/manifest.yaml](./redis/manifest.yaml)

### MySQL
- **Description**: MySQL database service.
- **Port**: 5432
- **Configuration**: [mysql/manifest.yaml](./mysql/manifest.yaml)

### PostgreSQL
- **Description**: PostgreSQL database service.
- **Port**: 5432
- **Configuration**: [postgres/manifest.yaml](./postgres/manifest.yaml)

## Usage

Each service directory contains:
- `manifest.yaml`: Service metadata and configuration.
- `docker-compose.yaml`: Docker Compose template for deployment.
- `config/`: Additional configuration files (if any).

To deploy a service, navigate to its directory and use the Docker Compose template.

## Contributing

Feel free to contribute by submitting issues or pull requests.

## License

Specify your license here.