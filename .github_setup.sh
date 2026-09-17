#!/bin/bash
# GitHub 发布辅助脚本

echo "🚀 准备发布 UI Generator Plugin 到 GitHub..."
echo ""

# 获取当前目录
CURRENT_DIR=$(pwd)
TEMP_DIR=~/Desktop/ui-generator-release

echo "当前目录: $CURRENT_DIR"
echo "临时目录: $TEMP_DIR"
echo ""

# 询问是否继续
read -p "是否要复制文件到临时目录并初始化 Git? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "已取消"
    exit 0
fi

# 创建临时目录
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

# 复制文件（排除不需要的）
echo "复制文件..."
rsync -av \
  --exclude='.temp' \
  --exclude='.backups' \
  --exclude='logs' \
  --exclude='node_modules' \
  --exclude='.DS_Store' \
  --exclude='.github_setup.sh' \
  "$CURRENT_DIR/" "$TEMP_DIR/"

cd "$TEMP_DIR"

# 初始化 Git
echo ""
echo "初始化 Git 仓库..."
git init

# 添加文件
git add .

# 创建提交
git commit -m "feat: initial release of UI Generator Plugin v1.0.0

- Complete plugin architecture with auto-update mechanism
- 9 reference documents for normative baseline and project calibration
- Automated scripts for syncing from upstream repositories
- Comprehensive documentation and contribution guidelines
- Validation and lifecycle hooks

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"

# 添加远程仓库
git remote add origin https://github.com/wangb1996/ui-generator.git

# 显示后续步骤
echo ""
echo "✅ Git 仓库已准备好！"
echo ""
echo "📍 当前位置: $TEMP_DIR"
echo ""
echo "🚀 下一步（请手动执行）："
echo ""
echo "  cd $TEMP_DIR"
echo "  git branch -M main"
echo "  git push -u origin main"
echo "  git tag -a v1.0.0 -m 'Release version 1.0.0'"
echo "  git push origin v1.0.0"
echo ""
echo "然后在 GitHub 上创建 Release"
echo ""

