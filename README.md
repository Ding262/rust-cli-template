# rust-cli-template

Rust CLI 项目模板，包含完整的 CI/CD 流水线、多平台发布、VitePress 文档站、Homebrew tap 和 PyPI 发布。

## 包含什么

- Rust CLI 项目骨架（Cargo + edition 2024）
- CI 流水线：格式检查、Clippy、多平台测试、安全审计、代码覆盖率、MSRV 检查
- Release 流水线：6 平台构建 + crates.io + Homebrew + PyPI + GitHub Release
- VitePress 文档站 + GitHub Pages 自动部署
- PyO3/maturin Python 绑定骨架
- CHANGELOG 模板

## 使用方式

### 1. 从模板创建仓库

点击 GitHub 上的 **Use this template** → **Create a new repository**。

### 2. 克隆并初始化

```bash
git clone git@github.com:你的用户名/你的仓库.git
cd 你的仓库
./init.sh
```

脚本会交互式地询问项目名称、描述、GitHub 用户名等信息，然后自动替换所有占位符。

### 3. 配置 GitHub Secrets

在仓库 **Settings → Secrets and variables → Actions → Secrets** 中添加：

| Secret | 用途 |
|--------|------|
| `CARGO_REGISTRY_TOKEN` | crates.io API token |
| `PYPI_API_TOKEN` | PyPI API token |
| `HOMEBREW_TAP_TOKEN` | GitHub PAT（需要 `repo` 权限），用于更新 homebrew-tap 仓库 |
| `CODECOV_TOKEN` | （可选）Codecov 上传 token |

### 4. 配置 GitHub Variables

在仓库 **Settings → Secrets and variables → Actions → Variables** 中添加：

| Variable | 说明 | 示例 |
|----------|------|------|
| `HOMEBREW_TAP_OWNER` | homebrew-tap 仓库所有者 | `AptS-1547` |
| `HOMEBREW_TAP_REPO` | homebrew-tap 仓库名 | `homebrew-tap` |
| `HOMEBREW_FORMULA_CLASS` | Homebrew formula 类名（PascalCase） | `MyTool` |
| `PROJECT_DESCRIPTION` | 项目描述，用于 Homebrew formula | `A fast CLI tool` |

### 5. 提交并推送

```bash
git add -A
git commit -m "feat: init project"
git push -u origin master
```

### 6. 发布新版本

```bash
# 1. 更新 Cargo.toml 中的 version
# 2. 更新 CHANGELOG.md
# 3. （可选）在 docs/release-notes/ 下写 vX.Y.Z.md
# 4. 提交并打 tag
git add -A
git commit -m "chore: release v0.1.0"
git tag v0.1.0
git push && git push --tags
```

打 tag 后会自动触发：构建 6 平台二进制 → 发布到 crates.io → 更新 Homebrew tap → 构建并上传 PyPI wheels → 发布 GitHub Release。

## 项目结构

```
├── .github/workflows/
│   ├── ci.yml            # CI 检查
│   ├── release.yml       # 发布流水线
│   └── vitepress.yml     # 文档部署
├── docs/
│   ├── .vitepress/config.mts
│   ├── guide/getting-started.md
│   ├── release-notes/    # 版本发布说明
│   ├── index.md
│   └── package.json
├── python/
│   └── pyproject.toml    # PyO3/maturin 配置
├── src/main.rs
├── Cargo.toml
├── CHANGELOG.md
├── init.sh               # 初始化脚本（用完可删）
├── LICENSE
└── README.md             # ← 你现在在看的这个，init 后会被替换
```

## 占位符列表

`init.sh` 会替换以下占位符：

| 占位符 | 说明 |
|--------|------|
| `{{PROJECT_NAME}}` | 项目名称（kebab-case） |
| `{{REPO_NAME}}` | GitHub 仓库名 |
| `{{PROJECT_DESCRIPTION}}` | 项目描述 |
| `{{GITHUB_USERNAME}}` | GitHub 用户名 |
| `{{AUTHOR_NAME}}` | 作者名称 |
| `{{AUTHOR_EMAIL}}` | 作者邮箱 |

## 许可证

[MIT License](LICENSE)
