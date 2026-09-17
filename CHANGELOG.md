# 变更日志

所有重要的变更都会记录在此文件中。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [Unreleased]

### 计划添加
- GitHub API 备选方案
- 定时任务调度器
- 插件版本回滚功能
- 更多页面类型模板

## [1.0.0] - 2026-09-17

### 新增
- ✨ 初始插件架构
- ✨ 完整的技能定义 (SKILL.md)
- ✨ 9 个核心参考文档
- ✨ 自动更新脚本 (update.sh)
- ✨ 规范提取器 (extract-normative.js)
- ✨ 项目校准提取器 (extract-calibration.js)
- ✨ 更新生命周期钩子 (pre-update, post-update)
- ✨ 验证脚本 (validate.sh)
- ✨ 插件元数据配置 (plugin.json)
- ✨ 完整的 README 文档

### 文档
- 📚 五层模型说明
- 📚 生成工作流程
- 📚 Shell 结构规范
- 📚 组件路由表
- 📚 页面类型路由
- 📚 验收检查清单
- 📚 冲突处理规则

### 基线
- 📌 design-md 分支: `agent/design-md-v2-self-contained`
- 📌 design-md commit: `d5d9bfaee91a2e4a4affbffba908b3a09915b687` (2026-09-17)
- 📌 SupervisionPlatform 分支: `main`
- 📌 SupervisionPlatform commit: `de8952a336ed0ae7633f06210402af92abc040d0` (2026-09-16)

### 支持的功能
- ✅ 生成 WORKBENCH / MANAGEMENT / LEDGER / ANALYSIS / REPORT / DETAIL 页面
- ✅ 支持 LIST / CARD / SPLIT / BOARD / CALENDAR 布局
- ✅ SupervisionPlatform Basic Business Application Shell
- ✅ Application Bar 配置和右侧动作面板
- ✅ Module Switcher 和 Secondary Navigation
- ✅ Enterprise Query Toolbar
- ✅ 项目风格校准
- ✅ 页面改造与截图还原
- ✅ UI 规范审查

## [0.1.0] - 2026-09-17 (内部)

### 新增
- 🚀 项目初始化
- 🚀 基础目录结构
- 🚀 核心技能文件迁移

---

## 版本说明

### 主版本号 (Major)
重大架构变更或不兼容的 API 修改

### 次版本号 (Minor)
向后兼容的新功能

### 修订号 (Patch)
向后兼容的问题修复

---

**约定提交类型**:
- `feat`: 新功能
- `fix`: 修复问题
- `docs`: 文档更新
- `style`: 代码格式（不影响功能）
- `refactor`: 重构（不增加功能也不修复问题）
- `perf`: 性能优化
- `test`: 测试相关
- `chore`: 构建过程或辅助工具的变动
