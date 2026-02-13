#!/usr/bin/env bash
set -euo pipefail

# rust-cli-template 初始化脚本
# 用法: ./init.sh

echo "=== Rust CLI Template 初始化 ==="
echo ""

read -rp "项目名称 (kebab-case, 如 my-tool): " PROJECT_NAME
read -rp "仓库名称 (如 MyTool，留空则与项目名相同): " REPO_NAME
REPO_NAME="${REPO_NAME:-$PROJECT_NAME}"
read -rp "项目描述: " PROJECT_DESCRIPTION
read -rp "GitHub 用户名: " GITHUB_USERNAME
read -rp "作者名称: " AUTHOR_NAME
read -rp "作者邮箱: " AUTHOR_EMAIL

# Homebrew formula 类名：kebab-case -> PascalCase
FORMULA_CLASS=$(echo "$PROJECT_NAME" | sed -E 's/(^|-)([a-z])/\U\2/g')

echo ""
echo "即将替换以下占位符："
echo "  {{PROJECT_NAME}}        -> $PROJECT_NAME"
echo "  {{REPO_NAME}}           -> $REPO_NAME"
echo "  {{PROJECT_DESCRIPTION}} -> $PROJECT_DESCRIPTION"
echo "  {{GITHUB_USERNAME}}     -> $GITHUB_USERNAME"
echo "  {{AUTHOR_NAME}}         -> $AUTHOR_NAME"
echo "  {{AUTHOR_EMAIL}}        -> $AUTHOR_EMAIL"
echo ""
read -rp "确认？(y/N) " CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
  echo "已取消。"
  exit 0
fi

# 替换所有文件中的占位符
find . -type f \
  -not -path './.git/*' \
  -not -path './target/*' \
  -not -path './docs/node_modules/*' \
  -not -path './init.sh' \
  -exec sed -i '' \
    -e "s|{{PROJECT_NAME}}|${PROJECT_NAME}|g" \
    -e "s|{{REPO_NAME}}|${REPO_NAME}|g" \
    -e "s|{{PROJECT_DESCRIPTION}}|${PROJECT_DESCRIPTION}|g" \
    -e "s|{{GITHUB_USERNAME}}|${GITHUB_USERNAME}|g" \
    -e "s|{{AUTHOR_NAME}}|${AUTHOR_NAME}|g" \
    -e "s|{{AUTHOR_EMAIL}}|${AUTHOR_EMAIL}|g" \
    {} +

# 用项目 README 替换模板说明 README
mv README.template.md README.md

echo ""
echo "初始化完成。你可以删除 init.sh 了。"
echo ""
echo "下一步："
echo "  1. git init && git add -A && git commit -m 'feat: init project'"
echo "  2. 在 GitHub 创建仓库 ${GITHUB_USERNAME}/${REPO_NAME}"
echo "  3. 配置 GitHub Secrets："
echo "     - CARGO_REGISTRY_TOKEN (crates.io)"
echo "     - PYPI_API_TOKEN (PyPI)"
echo "     - HOMEBREW_TAP_TOKEN (GitHub PAT，需要 repo 权限)"
echo "     - CODECOV_TOKEN (可选，代码覆盖率)"
echo "  4. 配置 GitHub Variables (Settings → Secrets and variables → Variables)："
echo "     - HOMEBREW_TAP_OWNER   (tap 仓库所有者，如 ${GITHUB_USERNAME})"
echo "     - HOMEBREW_TAP_REPO    (tap 仓库名，如 homebrew-tap)"
echo "     - HOMEBREW_FORMULA_CLASS (formula 类名 PascalCase，如 ${FORMULA_CLASS})"
echo "     - PROJECT_DESCRIPTION  (项目描述)"
echo "  5. git remote add origin git@github.com:${GITHUB_USERNAME}/${REPO_NAME}.git"
echo "  6. git push -u origin master"
