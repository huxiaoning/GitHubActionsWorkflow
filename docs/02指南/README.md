# 指南

这些`GitHub Actions`指南包括了具体的用例和示例，以帮助您配置工作流。



### 创建自定义的持续集成工作流

你可以使用`GitHub Actions`创建自定义的持续集成工作流，持续集成工作流可以构建和测试使用不同编程语言开发的项目。

- 关于持续集成
- 用工作流模板设置CI(持续集成)
- 构建和测试`Node.js`
- 构建和测试`Python`
- 用`Maven`构建和测试`Java`
- 用`Gradle`构建和测试`Java`
- 用`Ant`构建和测试`Java`

### 发布软件包

你可以自动发布软件包，作为持续交付(CD)工作流的一部分。软件包可以发布到任何软件包主机，`GitHub Packages`可通过`GitHub Free`、`GitHub Pro`、`GitHub Free for organizations`、`GitHub Team`、`GitHub Enterprise Cloud`、`GitHub Enterprise Server 2.22`和`GitHub One`提供。

`GitHub Packages`对于私有存储库不可用，这些存储库所属账户使用传统的按存储库支付计划。此外使用传统的按存储库计划的帐户无法访问`GitHub Container Registry`，因为这些帐户是按存储库计费的。更多信息查看[`GitHub's products`](https://docs.github.com/en/free-pro-team@latest/articles/github-s-products)

- 关于使用`GitHub Actions`打包
- 发布`Node.js`包
- 用`Maven`发布`Java`包
- 用`Gradle`发布`Java`包
- 发布`Docker`镜像

### 缓存和存储工作流数据

缓存依赖项和存储工件以使工作流运行更高效。

- 将工作流数据存储为工件
- 缓存依赖项以加快工作流

### 在工作流中使用服务容器

使用服务容器将服务连接到工作流。

- 关于服务容器
- 创建`redis`服务容器
- 创建`PostgreSQL`服务容器