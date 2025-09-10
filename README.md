# Webhook Test Project

This project contains configurations for testing webhooks with various database services.

## Services

### MySQL
- Configuration file: `mysql/manifest.yaml`
- Provides MySQL database service for webhook testing.

### PostgreSQL
- Configuration file: `postgres/manifest.yaml`
- Includes database configuration in `postgres/conf/pg.conf`.
- Provides PostgreSQL database service for webhook testing.

### Redis
- Configuration file: `redis/manifest.yaml`
- Docker Compose file: `redis/docker-compose.yaml`
- Provides Redis service for webhook testing.

## Usage

Each service is configured with its own manifest file that defines:
- Resource requirements (CPU, memory, disk)
- Port configurations
- Service-specific variables (like passwords and database names)

You can deploy each service independently using its respective configuration files.