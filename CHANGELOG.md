# 变更日志

所有重要的变更都会记录在此文件中。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [Unreleased]

### 新增 (v1.2.0)
- ✨ 应用结构前置询问功能
  - 新增 `references/application-intake.md` 完整规范文档
  - 支持收集应用名称、模块列表、模块 Tabs
  - 提供标准询问模板和验证规则
  - 支持渐进式询问和智能推断
- ✨ 多模块应用生成能力增强
  - Module Switcher 与 Secondary Tabs 层级关系明确化
  - 完整的应用结构数据格式规范
  - 4 种常见场景处理示例

### 改进
- 📈 更新 SKILL.md 工作流
  - 在"收集已有上下文"章节集成应用结构询问
  - 明确多模块应用与单页面的处理差异
- 📈 更新 plugin.json
  - 添加 `application-intake.md` 到 references 列表

### 文档
- 📚 应用结构数据格式完整定义（TypeScript 接口）
- 📚 询问模板库（完整询问、部分询问、确认询问）
- 📚 验证规则和最佳实践
- 📚 Spec Gap 登记指南

### 计划添加 (v1.3.0)
- 更多页面类型示例（WORKBENCH, ANALYSIS, REPORT）
- 补充实际项目截图
- 添加视觉对比工具
- 实现自动化验证脚本

## [1.1.0] - 2026-09-17

### 新增
- ✨ 截图参考系统（screenshots/ 目录结构）
- ✨ 视觉校准指南（visual-calibration.md）
- ✨ 生成确定性提升指南（generation-determinism.md）
- ✨ 实战示例库（ledger-real-estate.md, management-user-list.md）
- ✨ 常见问题模式库（common-issues.md）

### 改进
- 📈 文件数：33 → 50 (+52%)
- 📈 代码行：4,273 → 7,331 (+72%)
- 📚 新增 2 个完整实战示例
- 📚 新增 3 个参考文档
- 🎨 完整的 Design Token 定义
- 🐛 21 个常见问题及解决方案

### 文档
- 📚 截图使用指南和占位说明
- 📚 视觉校准检查清单
- 📚 生成确定性验证方法
- 📚 常见错误速查表

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
