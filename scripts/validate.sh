#!/bin/bash
# 验证插件内容的完整性和一致性

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="$(dirname "$SCRIPT_DIR")"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "🔍 验证 UI Generator Plugin..."
echo ""

errors=0

# 1. 检查必需文件
echo "1️⃣ 检查必需文件..."
required_files=(
    "plugin.json"
    "ui-generator/SKILL.md"
    "ui-generator/references/source-map.md"
    "ui-generator/references/core-normative-baseline.md"
    "ui-generator/references/project-calibration.md"
    "ui-generator/references/conflicts-and-precedence.md"
    "ui-generator/references/component-routing.md"
    "ui-generator/references/page-type-routing.md"
    "ui-generator/references/navigation-action-panels.md"
    "ui-generator/references/acceptance-gate.md"
    "ui-generator/references/visual-reference-index.md"
)

for file in "${required_files[@]}"; do
    if [ -f "$PLUGIN_DIR/$file" ]; then
        echo -e "  ${GREEN}✓${NC} $file"
    else
        echo -e "  ${RED}✗${NC} $file (缺失)"
        ((errors++))
    fi
done

# 2. 检查 JSON 格式
echo ""
echo "2️⃣ 检查 plugin.json 格式..."
if command -v jq &> /dev/null; then
    if jq empty "$PLUGIN_DIR/plugin.json" 2>/dev/null; then
        echo -e "  ${GREEN}✓${NC} JSON 格式正确"
    else
        echo -e "  ${RED}✗${NC} JSON 格式错误"
        ((errors++))
    fi
else
    echo "  ⚠️  未安装 jq，跳过 JSON 验证"
fi

# 3. 检查 SKILL.md 结构
echo ""
echo "3️⃣ 检查 SKILL.md 结构..."
skill_file="$PLUGIN_DIR/ui-generator/SKILL.md"
if grep -q "^---$" "$skill_file" && grep -q "^name:" "$skill_file" && grep -q "^description:" "$skill_file"; then
    echo -e "  ${GREEN}✓${NC} Frontmatter 格式正确"
else
    echo -e "  ${RED}✗${NC} Frontmatter 格式错误"
    ((errors++))
fi

# 4. 检查引用链接
echo ""
echo "4️⃣ 检查内部引用..."
if grep -q "references/source-map.md" "$skill_file"; then
    echo -e "  ${GREEN}✓${NC} 引用了 source-map.md"
else
    echo -e "  ${RED}✗${NC} 未引用 source-map.md"
    ((errors++))
fi

# 5. 统计文件大小
echo ""
echo "5️⃣ 文件统计..."
total_size=$(du -sh "$PLUGIN_DIR/ui-generator" | cut -f1)
echo "  总大小: $total_size"
file_count=$(find "$PLUGIN_DIR/ui-generator" -type f | wc -l)
echo "  文件数: $file_count"

# 总结
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ $errors -eq 0 ]; then
    echo -e "${GREEN}✅ 验证通过！插件结构完整。${NC}"
    exit 0
else
    echo -e "${RED}❌ 发现 $errors 个错误，请修复后重试。${NC}"
    exit 1
fi
