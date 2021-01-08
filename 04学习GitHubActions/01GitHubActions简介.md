### `GitHub Actions`简介

了解`GitHub Actions`的核心概念和各种组件,展示一个示例，演示如何将自动化添加到存储库中。

#### 概览

`GitHub Actions`是事件驱动的，这意味着你可以在指定的事件发生后运行一系列命令。

比如当你`push`代码到仓库时，就可以执行你的测试脚本的命令。

#### `GitHub Actions`组件

![](https://docs.github.com/assets/images/help/images/overview-actions-design.png)

##### `Workflows`(工作流)

工作流是您添加到存储库的自动化过程。

`Workflows`由一个或多个`Jobs`组成。

工作流可用于在`GitHub`上构建、测试、打包、发布或部署项目。

##### Events(事件)

事件是触发工作流的特定活动。

例如，当有人推送提交到存储库，或者创建了`pull request`。

还可以使用[repository dispatch webhook](https://docs.github.com/en/free-pro-team@latest/rest/reference/repos#create-a-repository-dispatch-event)在发生外部事件时来触发工作流。

完整的事件列表可以查看[Events that trigger workflows](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows).

[原文地址](https://docs.github.com/en/free-pro-team@latest/actions/learn-github-actions/introduction-to-github-actions)