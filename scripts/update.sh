#!/bin/bash
# UI Generator Plugin 更新脚本
# 从 GitHub 仓库同步最新的规范和项目校准内容

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="$(dirname "$SCRIPT_DIR")"
TEMP_DIR="$PLUGIN_DIR/.temp"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 清理临时目录
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        log_info "清理临时目录..."
        rm -rf "$TEMP_DIR"
    fi
}

trap cleanup EXIT

# 创建临时目录
mkdir -p "$TEMP_DIR"

# 读取配置
DESIGN_REPO="https://github.com/wangb1996/design-md"
DESIGN_BRANCH="agent/design-md-v2-self-contained"
PROJECT_REPO="https://github.com/songluo-ctyl/SupervisionPlatform"
PROJECT_BRANCH="main"

log_info "开始更新 UI Generator Plugin..."

# 1. 下载设计规范仓库
log_info "正在获取设计规范 (design-md)..."
if git clone --branch "$DESIGN_BRANCH" --depth 1 "$DESIGN_REPO" "$TEMP_DIR/design-md" 2>/dev/null; then
    log_info "✓ 设计规范仓库克隆成功"
else
    log_warn "Git克隆失败，尝试使用 GitHub API..."
    # 备选方案：使用 GitHub API 下载
    DESIGN_API="https://api.github.com/repos/wangb1996/design-md/contents"
    # TODO: 实现 API 下载逻辑
fi

# 2. 下载项目仓库
log_info "正在获取项目仓库 (SupervisionPlatform)..."
if git clone --branch "$PROJECT_BRANCH" --depth 1 "$PROJECT_REPO" "$TEMP_DIR/SupervisionPlatform" 2>/dev/null; then
    log_info "✓ 项目仓库克隆成功"
else
    log_warn "Git克隆失败，尝试使用 GitHub API..."
    # 备选方案：使用 GitHub API 下载
fi

# 3. 更新核心规范基线
log_info "正在更新核心规范基线..."
if [ -f "$TEMP_DIR/design-md/GENERATIVE-SPEC.md" ]; then
    # 提取关键内容并更新 core-normative-baseline.md
    node "$SCRIPT_DIR/extractors/extract-normative.js" \
        "$TEMP_DIR/design-md" \
        "$PLUGIN_DIR/ui-generator/references/core-normative-baseline.md"
    log_info "✓ 核心规范基线已更新"
else
    log_error "未找到 GENERATIVE-SPEC.md"
fi

# 4. 更新项目校准事实
log_info "正在更新项目校准事实..."
if [ -d "$TEMP_DIR/SupervisionPlatform/apps/web/src" ]; then
    node "$SCRIPT_DIR/extractors/extract-calibration.js" \
        "$TEMP_DIR/SupervisionPlatform" \
        "$PLUGIN_DIR/ui-generator/references/project-calibration.md"
    log_info "✓ 项目校准事实已更新"
else
    log_error "未找到项目源码目录"
fi

# 5. 更新 source-map.md 中的 commit 信息
log_info "正在更新版本信息..."
if [ -d "$TEMP_DIR/design-md/.git" ]; then
    DESIGN_COMMIT=$(cd "$TEMP_DIR/design-md" && git rev-parse HEAD)
    DESIGN_DATE=$(cd "$TEMP_DIR/design-md" && git log -1 --format=%cd --date=short)
    log_info "  design-md: $DESIGN_COMMIT ($DESIGN_DATE)"
fi

if [ -d "$TEMP_DIR/SupervisionPlatform/.git" ]; then
    PROJECT_COMMIT=$(cd "$TEMP_DIR/SupervisionPlatform" && git rev-parse HEAD)
    PROJECT_DATE=$(cd "$TEMP_DIR/SupervisionPlatform" && git log -1 --format=%cd --date=short)
    log_info "  SupervisionPlatform: $PROJECT_COMMIT ($PROJECT_DATE)"
fi

# 6. 更新 plugin.json 的 lastUpdated 字段
CURRENT_DATE=$(date +%Y-%m-%d)
if command -v jq &> /dev/null; then
    jq --arg date "$CURRENT_DATE" '.lastUpdated = $date' "$PLUGIN_DIR/plugin.json" > "$PLUGIN_DIR/plugin.json.tmp"
    mv "$PLUGIN_DIR/plugin.json.tmp" "$PLUGIN_DIR/plugin.json"
    log_info "✓ 插件元数据已更新"
fi

log_info "✅ 更新完成！"
echo ""
echo "下一步："
echo "1. 查看更新的内容: git diff"
echo "2. 运行验证: ./scripts/validate.sh"
echo "3. 提交更新: git commit -am 'chore: update plugin content from upstream'"
