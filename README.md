# Webhook Test Suite

This repository provides a comprehensive test suite for validating webhook implementations across multiple services. It includes pre-configured environments for MySQL, PostgreSQL, and Redis, allowing developers to easily test their webhook integrations.

## Services Overview

### MySQL
- **Description**: MySQL database service for testing database-related webhooks
- **Version**: 1.1.0
- **Tags**: db, database
- **Resource Requirements**:
  - **Minimum**:
    - CPU: 1 core
    - Memory: 1024M
    - Disk: 1G
  - **Recommended**:
    - CPU: 2 cores
    - Memory: 2048M
    - Disk: 2G
- **Access Ports**:
  - IP: 127.0.0.1
  - Port: 3306
  - Description: MySQL service
- **Configuration Variables**:
  - `password`: MySQL's initial password (ensure complexity)
  - `db`: Database name

### PostgreSQL
- **Description**: PostgreSQL database service for advanced database webhook testing
- **Version**: 1.15.0
- **Tags**: db, database
- **Resource Requirements**:
  - **Minimum**:
    - CPU: 1 core
    - Memory: 1024M
    - Disk: 1G
  - **Recommended**:
    - CPU: 2 cores
    - Memory: 2048M
    - Disk: 2G
- **Access Ports**:
  - IP: 127.0.0.1
  - Port: 5432
  - Description: PostgreSQL service
- **Configuration Variables**:
  - `password`: PostgreSQL's initial password (ensure complexity)
  - `db`: Database name

### Redis
- **Description**: Fast key-value database for testing caching and real-time webhooks
- **Version**: 1.1.3
- **Tags**: kv, cache
- **Resource Requirements**:
  - **Minimum**:
    - CPU: 1 core
    - Memory: 1024M
    - Disk: 1G
  - **Recommended**:
    - CPU: 2 cores
    - Memory: 2048M
    - Disk: 2G
- **Access Ports**:
  - **Redis**:
    - IP: 127.0.0.1
    - Port: 6379
    - Description: Redis service
  - **Sentinel**:
    - IP: 0.0.0.0
    - Port: 26379
    - Description: Sentinel service
- **Configuration Variables**:
  - `password`: Redis's initial password (ensure complexity)
  - `timeout`: Client idle time in seconds before connection close (0 to disable)
  - `db`: Database name
  - `tcp-keepalive`: Redis TCP connection keepalive time in seconds (default 300)

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/yokowu/webhook-test.git
   ```

2. Navigate to the service directory you want to test:
   ```bash
   cd webhook-test/mysql  # or postgres or redis
   ```

3. Configure the service variables in the manifest.yaml file

4. Deploy the service using your preferred containerization tool

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.