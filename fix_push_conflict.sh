#!/bin/bash
# 解决 Git 推送冲突的脚本

cd /tmp/claude-501/ui-generator-release || exit 1

echo "🔧 准备解决推送冲突..."
echo ""

# 清除代理设置
unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY

echo "📥 选项 1: 强制推送（覆盖远程）"
echo "   警告: 会覆盖远程仓库的现有内容！"
echo ""
echo "   git push -u origin main --force"
echo ""

echo "📥 选项 2: 拉取后合并推送（保留远程内容）"
echo ""
echo "   git pull origin main --allow-unrelated-histories"
echo "   git push -u origin main"
echo ""

echo "📥 选项 3: 重新创建仓库"
echo "   1. 删除远程仓库 https://github.com/wangb1996/ui-generator"
echo "   2. 重新创建空仓库"
echo "   3. 执行 git push -u origin main"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "💡 推荐方案："
echo ""
echo "如果远程仓库是空的或测试用的，使用强制推送："
echo "   cd /tmp/claude-501/ui-generator-release"
echo "   git push -u origin main --force"
echo ""
echo "如果远程有重要内容，先备份再操作！"
echo ""
