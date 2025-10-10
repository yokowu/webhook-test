# webhook-test

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 项目简介

webhook-test 是一个用于测试和验证 Webhook 功能的简单工具。它可以帮助开发者快速搭建和测试 Webhook 接收端，验证各种 Webhook 事件的处理逻辑。

## 功能特点

- 支持多种 Webhook 事件类型
- 简单易用的测试接口
- 实时查看接收到的 Webhook 数据
- 支持自定义响应处理
- 集成 MySQL、PostgreSQL 和 Redis 数据库支持

## 架构说明

本项目除了核心的 Webhook 测试功能外，还提供了数据库服务的配置模板，方便在实际部署时集成数据库功能。

项目包含以下目录：
- `mysql/` - MySQL 数据库配置模板
- `postgres/` - PostgreSQL 数据库配置模板
- `redis/` - Redis 数据库配置模板

## 安装和部署

### 环境要求

- Node.js (版本 >= 12.0.0)
- npm 或 yarn
- Docker 和 Docker Compose (用于数据库服务)

### 安装步骤

1. 克隆项目仓库：
   ```bash
   git clone https://github.com/yokowu/webhook-test.git
   ```

2. 进入项目目录：
   ```bash
   cd webhook-test
   ```

3. 安装依赖：
   ```bash
   npm install
   # 或者
   yarn install
   ```

4. 启动数据库服务（可选）：
   ```bash
   # 启动 Redis 服务
   docker-compose -f redis/docker-compose.yaml up -d
   
   # 启动 MySQL 服务 (配置文件在 mysql/manifest.yaml)
   # 启动 PostgreSQL 服务 (配置文件在 postgres/manifest.yaml 和 postgres/conf/pg.conf)
   ```

5. 启动服务：
   ```bash
   npm start
   # 或者
   yarn start
   ```

## 使用方法

1. 启动服务后，默认监听端口为 3000
2. 配置你的 Webhook 发送端，指向 `http://localhost:3000/webhook`
3. 发送 Webhook 请求，可以在控制台查看接收到的数据
4. 根据需要自定义响应处理逻辑
5. 如需使用数据库功能，请根据 `mysql/`、`postgres/` 和 `redis/` 目录中的配置模板进行相应配置

### 示例

发送一个测试 Webhook 请求：

```bash
curl -X POST http://localhost:3000/webhook \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, webhook!"}'
```

服务端会打印接收到的数据，并返回默认响应。

## 配置选项

| 参数 | 说明 | 默认值 |
|------|------|--------|
| PORT | 服务监听端口 | 3000 |
| WEBHOOK_PATH | Webhook 接收路径 | /webhook |

可以通过环境变量或配置文件来设置这些参数。

## 数据库集成

本项目提供了常见数据库的配置模板，可以根据实际需求进行定制：

### Redis
- 配置文件位于 `redis/docker-compose.yaml`
- 可以通过修改此文件来自定义 Redis 容器配置

### MySQL
- 配置文件位于 `mysql/manifest.yaml`
- 包含基本的 MySQL 服务配置

### PostgreSQL
- 配置文件位于 `postgres/manifest.yaml`
- 相关配置参数位于 `postgres/conf/pg.conf`

## 贡献指南

欢迎提交 Issue 和 Pull Request 来改进这个项目。

### 开发流程

1. Fork 本仓库
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

### 文档规范

当修改 README 或其他文档时，请确保：
1. 内容准确且最新
2. 结构清晰，易于阅读
3. 包含必要的使用示例
4. 保持与其他文档的一致性

## 许可证

本项目采用 MIT 许可证。详情请查看 [LICENSE](LICENSE) 文件。