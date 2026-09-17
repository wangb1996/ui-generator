# 快速开始

5分钟快速上手 UI Generator Plugin。

## 📦 安装

### 选项 1: 直接克隆

```bash
# 克隆到 Claude 插件目录
git clone https://github.com/your-org/ui-generator-plugin.git ~/.claude/plugins/ui-generator

# 或克隆到自定义位置
git clone https://github.com/your-org/ui-generator-plugin.git
cd ui-generator-plugin
```

### 选项 2: 下载压缩包

1. 下载最新版本: [Releases](https://github.com/your-org/ui-generator-plugin/releases)
2. 解压到 `~/.claude/plugins/ui-generator`

### 验证安装

```bash
cd ui-generator-plugin
./scripts/validate.sh
```

看到 ✅ 表示安装成功！

## 🎯 第一个页面

### 示例 1: 生成列表页

```
生成一个资产管理列表页，包含搜索、筛选和批量操作
```

插件会自动：
- 识别为 MANAGEMENT 页面类型
- 使用 LIST 布局模式
- 应用 SupervisionPlatform 风格
- 生成完整的 HTML/React 代码

### 示例 2: 生成台账页

```
按 SupervisionPlatform 风格生成房地产资产台账，需要支持不同业务视图切换
```

插件会：
- 识别为 LEDGER 页面类型
- 添加 Business View Tabs
- 支持多种数据展示模式
- 保持项目一致性

### 示例 3: 页面改造

```
这是我们现有的用户管理页面（附截图），请按规范重构它
```

插件会：
- 分析现有结构
- 映射到规范组件
- 保留业务逻辑
- 修正不符合规范的部分

## 🛠️ 基本用法

### 在 Claude 中使用

**方法 1: 通过技能名称**

```
/ui-generator 生成一个工作台页面
```

**方法 2: 自然语言触发**

只需在对话中提到关键词：
- "按规范生成"
- "SupervisionPlatform 风格"
- "生成业务应用"
- "创建页面"

### 指定页面类型

```
生成一个 LEDGER 类型的页面，使用 SPLIT 布局模式
```

支持的页面类型：
- `WORKBENCH` - 工作台
- `MANAGEMENT` - 管理页面
- `LEDGER` - 台账
- `ANALYSIS` - 分析页面
- `REPORT` - 报表页面
- `DETAIL` - 详情页面

支持的布局模式：
- `LIST` - 列表
- `CARD` - 卡片
- `SPLIT` - 分栏
- `BOARD` - 看板
- `CALENDAR` - 日历

## 📝 常见场景

### 场景 1: 新建业务模块

```
我需要创建一个项目管理模块，包含：
- 项目列表页
- 项目详情页
- 项目分析看板
请按 SupervisionPlatform 风格生成
```

### 场景 2: 审查现有 UI

```
请审查这个页面是否符合 design-md 规范：
[附上截图或代码]
```

插件会给出：
- ✅ 符合规范的部分
- ⚠️ 偏差项及原因
- 🔧 修改建议

### 场景 3: 生成整个应用

```
生成一个设备管理应用，需要：
- 设备台账
- 维护管理
- 统计分析
- 系统设置
```

## ⚙️ 配置

### 自定义更新策略

编辑 `plugin.json`：

```json
{
  "updatePolicy": {
    "autoUpdate": true,
    "updateInterval": "weekly",
    "updateTime": "02:00"
  }
}
```

可选值：
- `updateInterval`: `"daily"` | `"weekly"` | `"monthly"` | `"manual"`

### 添加项目校准规则

编辑 `ui-generator/references/project-calibration.md`，添加你的项目特定规则。

## 🔄 更新插件

### 手动更新

```bash
cd ui-generator-plugin
./scripts/update.sh
```

### 自动更新

启用自动更新后，插件会定期从上游仓库同步最新内容。

查看更新日志：

```bash
cat logs/update.log
```

## 🐛 故障排除

### 问题 1: 验证失败

```bash
# 查看详细错误
./scripts/validate.sh

# 常见原因：文件缺失、JSON 格式错误
# 解决：从备份恢复或重新克隆
```

### 问题 2: 更新失败

```bash
# 检查网络连接
ping github.com

# 检查权限
ls -la scripts/

# 手动克隆仓库
git clone --branch agent/design-md-v2-self-contained \
  https://github.com/wangb1996/design-md.git
```

### 问题 3: 生成结果不符合预期

1. 检查 SKILL.md 是否正确加载
2. 查看 references/ 文件是否完整
3. 确认上游仓库是否有更新
4. 运行 `./scripts/update.sh` 同步最新规范

## 📚 深入学习

### 推荐阅读顺序

1. [README.md](./README.md) - 完整功能说明
2. [ui-generator/SKILL.md](./ui-generator/SKILL.md) - 技能定义
3. [ui-generator/references/source-map.md](./ui-generator/references/source-map.md) - 知识来源
4. [CONTRIBUTING.md](./CONTRIBUTING.md) - 参与贡献

### 核心概念

**五层模型**

```
L1: Page Type (WORKBENCH/MANAGEMENT/LEDGER...)
  └─ L2: Page Mode (LIST/CARD/SPLIT/BOARD/CALENDAR)
      └─ L3: Business View (业务视图切换)
          └─ L4: Data Control (查询/筛选/排序)
              └─ L5: Data Presentation (展示形态)
```

**知识优先级**

```
用户要求 > 规范文档 > 项目校准 > 默认行为
```

## 🎓 示例集合

查看 `examples/` 目录（如果有）获取更多示例：

- `examples/list-page.md` - 列表页示例
- `examples/ledger-page.md` - 台账页示例
- `examples/workbench.md` - 工作台示例
- `examples/analysis-dashboard.md` - 分析看板示例

## 💡 最佳实践

1. **明确业务需求**: 清楚说明页面用途和核心功能
2. **指定页面类型**: 明确告知是 LEDGER、MANAGEMENT 还是其他类型
3. **提供上下文**: 提供用户角色、权限、业务场景
4. **保持项目风格**: 明确说明"按 SupervisionPlatform 风格"
5. **审查生成结果**: 使用审查功能确保符合规范

## ⚡ 快捷命令

```bash
# 验证插件
npm run validate

# 更新插件
npm run update

# 查看版本
cat plugin.json | grep version

# 查看更新日志
tail -f logs/update.log
```

## 🆘 获取帮助

- 📖 查看文档: [README.md](./README.md)
- 🐛 报告问题: [GitHub Issues](https://github.com/your-org/ui-generator-plugin/issues)
- 💬 讨论交流: [GitHub Discussions](https://github.com/your-org/ui-generator-plugin/discussions)
- 📧 联系我们: [email@example.com](mailto:email@example.com)

## 🎉 下一步

现在你已经准备好使用 UI Generator Plugin 了！

尝试生成你的第一个页面，体验规范驱动的 UI 生成吧！

---

**有问题？** 查看 [FAQ](./docs/FAQ.md) 或提交 [Issue](https://github.com/your-org/ui-generator-plugin/issues)。
