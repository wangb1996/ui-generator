#!/bin/bash
# 更新前的预处理钩子

echo "⚙️  执行更新前检查..."

# 检查是否有未提交的更改
if ! git diff-index --quiet HEAD -- 2>/dev/null; then
    echo "⚠️  警告: 存在未提交的更改"
    echo "建议先提交或暂存当前更改"
    read -p "是否继续? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# 备份当前版本
BACKUP_DIR=".backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"
cp -r skills/ui-generator "$BACKUP_DIR/"
echo "✓ 当前版本已备份到: $BACKUP_DIR"

exit 0
