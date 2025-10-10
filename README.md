# Webhook Test Environment

本仓库提供了常见数据库服务的测试环境配置，包括 MySQL、PostgreSQL 和 Redis。主要用于 webhook 测试场景下的数据存储支持。

## 目录结构

```
.
├── mysql/          # MySQL 服务配置
├── postgres/       # PostgreSQL 服务配置
├── redis/          # Redis 服务配置
└── README.md       # 项目说明文档
```

## 服务说明

### MySQL
- 描述：关系型数据库
- 默认端口：3306 (注意：原 README 中的 5432 是错误的)
- 配置文件：`mysql/manifest.yaml`

### PostgreSQL
- 描述：高级开源关系型数据库
- 默认端口：5432
- 配置文件：`postgres/manifest.yaml`

### Redis
- 描述：高性能键值数据库
- 默认端口：6379
- 配置文件：`redis/manifest.yaml`

## 配置说明

每个服务目录下都有一个 `manifest.yaml` 文件，包含以下关键配置项：

- `metadata.name`：服务名称
- `metadata.version`：版本号
- `resource.limit`：资源限制（CPU、内存、磁盘）
- `ports`：端口映射配置
- `variables`：初始化变量设置

## 使用方法

1. 选择需要的服务目录
2. 修改 `manifest.yaml` 中的配置参数（如密码等）
3. 使用配套工具部署对应服务

## 安全提醒

所有服务配置中都包含了默认密码，请在实际使用时务必修改为强密码，避免安全风险。

## 贡献

欢迎提交 Issue 和 Pull Request 来帮助改进这个项目。