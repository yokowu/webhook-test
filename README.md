# Webhook Test

This repository contains test configurations for various services that can be used to test webhooks.

## Services

### MySQL
- **Description**: MySQL database service
- **Version**: 1.1.0
- **Tags**: db, database
- **Resource Limits**:
  - CPU: 1
  - Memory: 1024M
  - Disk: 1G
- **Recommended Resources**:
  - CPU: 2
  - Memory: 2048M
  - Disk: 2G
- **Ports**:
  - IP: 127.0.0.1
  - Port: 3306
  - Description: MySQL
- **Variables**:
  - Password: MySQL's initial password. Please note the password complexity.
  - DB: MySQL database name.

### PostgreSQL
- **Description**: PostgreSQL database service
- **Version**: 1.15.0
- **Tags**: db, database
- **Resource Limits**:
  - CPU: 1
  - Memory: 1024M
  - Disk: 1G
- **Recommended Resources**:
  - CPU: 2
  - Memory: 2048M
  - Disk: 2G
- **Ports**:
  - IP: 127.0.0.1
  - Port: 5432
  - Description: PostgreSQL
- **Variables**:
  - Password: PostgreSQL's initial password. Please note the password complexity.
  - DB: PostgreSQL database name.

### Redis
- **Description**: Fast key-value database for testing.
- **Version**: 1.1.3
- **Tags**: kv, cache
- **Resource Limits**:
  - CPU: 1
  - Memory: 1024M
  - Disk: 1G
- **Recommended Resources**:
  - CPU: 2
  - Memory: 2048M
  - Disk: 2G
- **Ports**:
  - Redis:
    - IP: 127.0.0.1
    - Port: 6379
    - Description: Redis
  - Sentinel:
    - IP: 0.0.0.0
    - Port: 26379
    - Description: Sentinel
- **Variables**:
  - Password: Redis's initial password. Please note the password complexity.
  - Timeout: Client idle time in seconds after which the connection will be closed. 0 to disable.
  - DB: Redis database name.
  - TCP Keepalive: Redis TCP connection keepalive time in seconds. Default is 300.