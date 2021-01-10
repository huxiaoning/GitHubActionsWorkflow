### `GitHub Actions`简介

了解`GitHub Actions`的核心概念和各种组件,展示一个示例，演示如何将自动化添加到存储库中。

#### 概览

`GitHub Actions`是事件驱动的，这意味着你可以在指定的事件发生后运行一系列命令。

比如当你`push`代码到仓库时，就可以执行你的测试脚本的命令。

#### `GitHub Actions`组件

![](https://docs.github.com/assets/images/help/images/overview-actions-design.png)

##### `Workflows`(工作流)

工作流是您添加到存储库的自动化过程。

工作流由一个或多个任务组成。

工作流可用于在`GitHub`上构建、测试、打包、发布或部署项目。

##### Events(事件)

事件是触发工作流的特定活动。

例如，当有人推送提交到存储库，或者创建了`pull request`。

还可以使用[repository dispatch webhook](https://docs.github.com/en/free-pro-team@latest/rest/reference/repos#create-a-repository-dispatch-event)在发生外部事件时来触发工作流。

完整的事件列表可以查看[Events that trigger workflows](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows).

##### `Jobs`任务

任务是一个步骤(`steps`)的集合。

默认情况下，具有多个任务的工作流将并行运行这些任务。

当然，是可以配置工作流按顺序运行任务的。

例如，一个工作流可以有两个顺序的任务：构建和测试。其中测试任务依赖构建任务。如果构建任务失败了，测试任务将不会运行。

##### `Steps`步骤

步骤是可以在任务中运行命令的单个任务。

一个步骤可以是一个`action`或一条`shell`命令。

任务中的每一个`step`都在同 一个`runner`上面执行，允许该`Job`中的`actions`共享数据。

##### `Actions`操作

`Actions`是独立的命令(`commands`)。

`Actions`可以组合成`steps`来创建一个`Job`.

我们可以创建自已的`actions`，也可以使用`GitHub`社区提供的`actions`。

##### `Runners`运行器

一个`runner`是一个安装了[GitHub Actions runner application](https://github.com/actions/runner)的服务器。

你可以使用`GitHub`托管的`runner`,也可以使用自已的`runner`。

`runner`侦听可用的`jobs`,一次运行一个`Job`。

运行完后，会将进度、日志和结果报告给`GitHub`。

对于`GitHub`托管的`runner`,工作流中的每个`job`都在新的虚拟环境中运行。(不同的`job`之间不共享数据)

`GitHub`托管的`runner`基于`Ubuntu Linux`、微软`Windows`和`macOS`。

有关`GitHub`托管的`runners`可以查看[Virtual environments for GitHub-hosted runners](https://docs.github.com/en/free-pro-team@latest/actions/reference/virtual-environments-for-github-hosted-runners).

如果你需要不同的操作系统或特定的硬件，你可以使用自已的`runner`。

如何使用自已的`runners`可以查看[Hosting your own runners](https://docs.github.com/en/free-pro-team@latest/actions/hosting-your-own-runners).



#### 创建一个示例工作流

##### 1 准备一个基于`Maven`的`Java`项目

```
用Idea创建一个maven quick start项目即可。
```

##### 2 创建工作流配置文件

```shell
$ mkdir -p .github/workflows/
$ vim .github/workflows/run-java-workflow.yml
name: run-java-workflow
on: [ push ]
jobs:
  run-java-job:
    name: run-java-job
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-java@v1
        with:
          java-version: '9.0.4' # The JDK version to make available on the path.
          java-package: jdk # (jre, jdk, or jdk+fx) - defaults to jdk
          architecture: x64 # (x64 or x86) - defaults to x64
      - uses: stCarolas/setup-maven@v4
        with:
          maven-version: 3.5.4
      - run: mvn clean package
      - run: java -cp target/actions-demo-1.0-SNAPSHOT.jar org.joey.App
      - run: echo $(pwd) # /home/runner/work/actions-demo/actions-demo
      - run: ls -l
```

##### 3 推送提交到`GitHub`

```shell
$ git add .
$ git commit -m 'UP'
$ git push
```

这样一个新的工作流配置文件就被安装到你的代码库中了，并且它将会在每次推送变更时自动执行，包括这一次推送。

可以到`GitHub`代码库中的`Actions`选项卡下面查看工作流的执行结果。

#### 了解工作流配置文件

| 示例                          | 说明                                                         |
| :---------------------------- | :----------------------------------------------------------- |
| `name: run-java-workflow`     | 可选 - 工作流的名字。<br />它将会出现在`GitHub`代码库的`Actions`选项卡中。<br />建议与`yaml`文件名同名。 |
| `on: [push]`                  | 指定触发工作流的事件为`push`。<br />可以指定特定的分支、路径、或`tags`。<br />语法示例可以查看["`Workflow syntax for GitHub Actions.`"](https://docs.github.com/actions/reference/workflow-syntax-for-github-actions#onpushpull_requestpaths) |
| `jobs:`                       | 组织`run-java-workflow`工作流中的所有`job`。<br />即所有`job`都要配置在`jobs`中。 |
| `run-java-job`                | 在`jobs`下定义一个`ID`为`run-java-job`的`job`(任务)          |
| `name: run-java-job`          | 定义`job`的名称为`run-java-job`<br />建议与`job`的`ID`一致。 |
| `runs-on: ubuntu-latest`      | 指定`job`(任务)运行的虚拟环境为`Ubuntu Linux Server`,<br />表示这个任务会在一个由`GitHub`l托管的纯净的虚拟机上面运行。<br />语法示例可以查看["Workflow syntax for GitHub Actions."](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on) |
| `steps:`                      | 组织`run-java-job`任务的所有步骤。<br />嵌套在此标记下的每一行都是一个单独的操作`action`。 |
| `- uses: actions/checkout@v2` | 使用一个叫`actions/checkout`的社区`action`,使用其`v2`版本。<br />这个操作检出你的代码库并下载到任务运行的`runner`上面。<br />这一步是必须的操作，因为你的任务一定是针对你的代码库的，如编译打包运行你的代码、使用你代码库中定义的`action`，都必须签出你的代码。 |
|                               |                                                              |

[原文地址](https://docs.github.com/en/free-pro-team@latest/actions/learn-github-actions/introduction-to-github-actions)