#!/bin/bash
# 更新后的验证钩子

echo "⚙️  执行更新后验证..."

# 运行验证脚本
if bash "$(dirname "$0")/validate.sh"; then
    echo "✅ 更新验证通过"
    exit 0
else
    echo "❌ 更新验证失败"
    echo "可以从备份恢复: ls -la .backups/"
    exit 1
fi
