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

##### `Jobs`作业

作业是一个步骤(`steps`)的集合。

默认情况下，具有多个作业的工作流将并行运行这些作业。

当然，是可以配置工作流按顺序运行作业的。

例如，一个工作流可以有两个顺序的作业：构建和测试。其中测试作业依赖构建作业。如果构建作业失败了，测试作业将不会运行。

##### `Steps`步骤

步骤是可以在作业中运行命令的单个任务。

一个步骤可以是一个`action`或一条`shell`命令。

作业中的第一个`step`都在同 一个`runner`上面执行，允许该`Job`中的`actions`共享数据。

##### `Actions`操作

`Actions`是独立的命令(`commands`)。

`Actions`可以组合成`steps`来创建一个`Job`.

我们可以创建自已的`actions`，也可以使用`GitHub`社区提供的`actions`。



[原文地址](https://docs.github.com/en/free-pro-team@latest/actions/learn-github-actions/introduction-to-github-actions)