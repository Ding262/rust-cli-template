# {{PROJECT_NAME}}

{{PROJECT_DESCRIPTION}}

> [!NOTE]
> 本项目目前处于早期开发阶段（v0.0.0），核心功能尚未实现。

## 安装

### 从源码构建

需要 Rust 1.88.0 或更高版本。

```bash
git clone https://github.com/{{GITHUB_USERNAME}}/{{REPO_NAME}}.git
cd {{REPO_NAME}}
cargo build --release
```

### 通过 Cargo 安装

```bash
cargo install {{PROJECT_NAME}}
```

### 通过 Homebrew 安装

```bash
brew tap {{GITHUB_USERNAME}}/tap
brew install {{PROJECT_NAME}}
```

### 通过 pip 安装

```bash
pip install {{PROJECT_NAME}}
```

## 开发

```bash
# 检查代码格式
cargo fmt --check

# 运行 Clippy 检查
cargo clippy -- -D warnings

# 运行测试
cargo test

# 构建文档站（需要 Node.js）
cd docs && yarn install && yarn docs:dev
```

## 文档

在线文档：https://{{GITHUB_USERNAME}}.github.io/{{REPO_NAME}}/

## 许可证

[MIT License](LICENSE) © 2026 {{AUTHOR_NAME}}
