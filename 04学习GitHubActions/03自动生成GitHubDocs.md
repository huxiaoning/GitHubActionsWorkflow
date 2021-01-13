## 自动生成`GitHub Docs`



### 我自已的脚本

```yaml
name: build-gitbook
on:
  push:
    paths-ignore:
      - 'docs/**'
jobs:
  build-gitbook-job:
    name: build-gitbook-job
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-java@v1
        with:
          java-version: '9.0.4' # The JDK version to make available on the path.
          java-package: jdk # (jre, jdk, or jdk+fx) - defaults to jdk
          architecture: x64 # (x64 or x86) - defaults to x64
      - uses: actions/setup-node@v1
      - run: npm install -g gitbook-cli
      - run: gitbook install
      - run: java -jar -Dwork.dir=$(pwd) ./.github/scripts/gitbook-helper-1.0-SNAPSHOT.jar
      - run: rm -rf docs
      - run: gitbook build
      - run: mv _book docs
      - run: git config --global user.email "secrets.EMAIL"
      - run: git config --global user.name "secrets.NAME"
      - run: git add .
      - run: git commit -m "UP"
      - run: git push
```

目录排序问题已优化。

### 也可以使用别人的

```yaml
name: build-gitbook
on:
  push:
    paths-ignore:
      - 'docs/**'
jobs:
  build-gitbook-job:
    name: build-gitbook-job
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v1
      - run: npm install -g gitbook-cli
      - run: npm install -g gitbook-summary
      - run: gitbook install
      - run: book sm
      - run: rm -rf docs
      - run: gitbook build
      - run: mv _book docs
      - run: git config --global user.email "secrets.EMAIL"
      - run: git config --global user.name "secrets.NAME"
      - run: git add .
      - run: git commit -m "UP"
      - run: git push
```

