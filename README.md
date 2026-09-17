# UI Generator Plugin

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](./plugin.json)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)
[![Auto-Update](https://img.shields.io/badge/auto--update-enabled-brightgreen.svg)](./plugin.json)

一个基于 **design-md v2** 规范与 **SupervisionPlatform** 项目校准事实的 UI 生成插件，用于生成企业级业务应用界面。

## 🎯 特性

- ✅ **规范驱动**: 基于 design-md 正式规范生成 UI
- 🎨 **项目一致性**: 自动校准到 SupervisionPlatform 项目风格
- 🔄 **持续更新**: 支持自动同步上游仓库的最新内容
- 📦 **开箱即用**: 完整的技能定义和参考文档
- 🛠️ **可扩展**: 支持自定义校准规则和组件映射

## 📦 安装

### 方法 1: 直接克隆

```bash
git clone https://github.com/wangb1996/ui-generator.git ~/.claude/plugins/ui-generator
```

### 方法 2: 作为 Claude Skill

将本仓库放置到 Claude 的 skills 目录：

```bash
cp -r ui-generator ~/.claude/skills/
```

## 🚀 使用

### 基本用法

在 Claude 中调用技能：

```
/ui-generator 生成一个资产管理台账页面
```

或自然语言触发：

```
按 SupervisionPlatform 风格生成一个列表页
```

### 支持的生成场景

- **新建整个业务应用**: 多模块应用结构
- **单个业务页面**: LIST / CARD / SPLIT / BOARD / CALENDAR
- **页面类型**: WORKBENCH / MANAGEMENT / LEDGER / ANALYSIS / REPORT / DETAIL
- **页面改造**: 基于截图或现有代码的规范化重构
- **UI 审查**: 检查现有实现是否符合规范

## 🔄 更新插件

### 自动更新

插件默认启用自动更新（每日 02:00）。可以在 `plugin.json` 中配置：

```json
"updatePolicy": {
  "autoUpdate": true,
  "updateInterval": "daily",
  "updateTime": "02:00"
}
```

### 手动更新

运行更新脚本：

```bash
./scripts/update.sh
```

更新流程：
1. 从 GitHub 拉取最新的规范和项目代码
2. 提取关键内容并更新参考文档
3. 验证插件完整性
4. 更新版本信息

### 更新钩子

- **pre-update.sh**: 更新前备份和检查
- **post-update.sh**: 更新后验证
- **validate.sh**: 验证插件结构完整性

## 📚 文档结构

```
ui-generator/
├── SKILL.md                          # 主技能定义
└── references/                        # 参考文档
    ├── source-map.md                  # 源仓库映射
    ├── core-normative-baseline.md     # 核心规范基线
    ├── project-calibration.md         # 项目校准事实
    ├── conflicts-and-precedence.md    # 冲突处理规则
    ├── component-routing.md           # 组件路由表
    ├── page-type-routing.md           # 页面类型路由
    ├── navigation-action-panels.md    # 导航与动作面板
    ├── acceptance-gate.md             # 验收检查清单
    └── visual-reference-index.md      # 视觉参考索引
```

## 🔧 配置

### plugin.json

核心配置文件，包含：

- **元数据**: 名称、版本、描述
- **仓库信息**: 上游规范和项目仓库地址
- **更新策略**: 自动更新配置
- **技能定义**: 入口点和触发器
- **钩子**: 生命周期脚本

### 自定义校准规则

编辑 `ui-generator/references/project-calibration.md` 添加项目特定的校准规则。

## 🧪 验证

运行验证脚本检查插件完整性：

```bash
./scripts/validate.sh
```

验证内容：
- ✅ 必需文件完整性
- ✅ JSON 格式正确性
- ✅ SKILL.md 结构
- ✅ 内部引用链接
- ✅ 文件统计

## 📖 工作原理

### 五层模型

插件基于五层模型生成 UI：

1. **L1 - Page Type**: WORKBENCH / MANAGEMENT / LEDGER / ANALYSIS / REPORT / DETAIL
2. **L2 - Page Mode**: LIST / CARD / SPLIT / BOARD / CALENDAR
3. **L3 - Business View**: 业务视图切换
4. **L4 - Data Control**: 查询、筛选、排序
5. **L5 - Data Presentation**: 数据展示形态

### 知识来源优先级

1. 用户当前明确要求
2. design-md 的 GENERATIVE-SPEC.md
3. Normative Owner 文档（Token、Shell、Page Type、Component）
4. SupervisionPlatform 项目校准事实
5. 组件和页面路由表

### 生成流程

```
判断任务类型 → 收集上下文 → 确定五层模型 → 读取规范
    ↓
检查冲突 → 应用项目校准 → 形成页面合同 → 生成实现
    ↓
执行验收检查 → 输出成品
```

## 🔗 上游仓库

### 规范仓库 (design-md)

- **插件仓库**: [wangb1996/ui-generator](https://github.com/wangb1996/ui-generator)
- **规范仓库**: [wangb1996/design-md](https://github.com/wangb1996/design-md)
- **分支**: `agent/design-md-v2-self-contained`
- **作用**: 提供正式的 UI 生成规范

### 项目仓库 (SupervisionPlatform)

- **仓库**: [songluo-ctyl/SupervisionPlatform](https://github.com/songluo-ctyl/SupervisionPlatform)
- **分支**: `main`
- **作用**: 提供项目风格校准事实

## 🤝 贡献

### 更新规范基线

1. 修改上游 design-md 仓库
2. 运行 `./scripts/update.sh` 同步
3. 审查 diff 确认更新符合预期
4. 提交更新

### 更新项目校准

1. 修改上游 SupervisionPlatform 仓库
2. 运行 `./scripts/update.sh` 同步
3. 审查项目校准事实的变化
4. 提交更新

### 提交规范

```bash
# 功能更新
git commit -m "feat: add new component routing"

# 内容更新
git commit -m "chore: update plugin content from upstream"

# 修复
git commit -m "fix: correct page type routing logic"
```

## 📋 待办事项

- [ ] 实现 GitHub API 备选方案（当 git clone 失败时）
- [ ] 添加定时任务调度器
- [ ] 支持插件版本回滚
- [ ] 添加更多页面类型模板
- [ ] 生成示例和测试用例
- [ ] 集成 CI/CD 自动化测试

## 🐛 故障排除

### Git 克隆失败

如果 `./scripts/update.sh` 因权限问题失败，尝试：

1. 检查网络连接
2. 验证 GitHub 访问权限
3. 使用备选 GitHub API 方式（开发中）

### 验证失败

运行 `./scripts/validate.sh` 查看具体错误，常见问题：

- 缺失必需文件：恢复最近的备份
- JSON 格式错误：检查 `plugin.json` 语法
- 引用链接失效：更新文件路径

## 📄 许可证

MIT License - 详见 [LICENSE](./LICENSE) 文件

## 🙏 致谢

- **design-md**: 提供完整的 UI 生成规范体系
- **SupervisionPlatform**: 提供真实项目的校准参考

---

**版本**: 1.0.0  
**最后更新**: 2026-09-17  
**维护者**: Design System Team
