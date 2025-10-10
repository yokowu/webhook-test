# webhook-test

## 项目简介

webhook-test 是一个用于测试和验证 Webhook 功能的简单工具。它可以帮助开发者快速搭建和测试 Webhook 接收端，验证各种 Webhook 事件的处理逻辑。

## 功能特点

- 支持多种 Webhook 事件类型
- 简单易用的测试接口
- 实时查看接收到的 Webhook 数据
- 支持自定义响应处理

## 安装和部署

### 环境要求

- Node.js (版本 >= 12.0.0)
- npm 或 yarn

### 安装步骤

1. 克隆项目仓库：
   ```bash
   git clone https://github.com/your-username/webhook-test.git
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

4. 启动服务：
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

## 配置选项

| 参数 | 说明 | 默认值 |
|------|------|--------|
| PORT | 服务监听端口 | 3000 |
| WEBHOOK_PATH | Webhook 接收路径 | /webhook |

可以通过环境变量或配置文件来设置这些参数。

## 贡献指南

欢迎提交 Issue 和 Pull Request 来改进这个项目。

### 开发流程

1. Fork 本仓库
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 许可证

本项目采用 MIT 许可证。详情请查看 [LICENSE](LICENSE) 文件。