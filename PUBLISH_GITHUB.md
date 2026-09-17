# 发布到 GitHub 指南

由于当前目录存在权限限制，请按以下步骤手动发布到 GitHub：

## 📦 步骤 1: 准备仓库

在 GitHub 上确保仓库 `wangb1996/ui-generator` 已创建。

## 🚀 步骤 2: 初始化并推送

在**另一个目录**执行以下命令（避免权限问题）：

```bash
# 1. 复制插件到新位置
cp -r "/Users/apple/Documents/生成插件" ~/Desktop/ui-generator-temp
cd ~/Desktop/ui-generator-temp

# 2. 初始化 Git
git init

# 3. 添加所有文件
git add .

# 4. 创建初始提交
git commit -m "feat: initial release of UI Generator Plugin v1.0.0

- Complete plugin architecture with auto-update mechanism
- 9 reference documents for normative baseline and project calibration
- Automated scripts for syncing from upstream repositories
- Comprehensive documentation and contribution guidelines
- Validation and lifecycle hooks

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"

# 5. 添加远程仓库
git remote add origin https://github.com/wangb1996/ui-generator.git

# 6. 创建主分支并推送
git branch -M main
git push -u origin main

# 7. 创建版本标签
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

## 📝 步骤 3: 在 GitHub 上创建 Release

1. 访问 https://github.com/wangb1996/ui-generator/releases
2. 点击 "Create a new release"
3. 选择标签 `v1.0.0`
4. 发布标题: `v1.0.0 - Initial Release`
5. 发布说明（从下方复制）：

```markdown
# UI Generator Plugin v1.0.0

首次正式发布！🎉

## ✨ 主要特性

- 🎨 基于 design-md v2 规范生成企业级 UI
- 🔄 自动校准到 SupervisionPlatform 项目风格
- 📦 完整的自动更新机制
- ✅ 持续同步上游规范和项目代码
- 📚 完整的文档和参考体系

## 📦 支持的功能

### 页面类型
- WORKBENCH (工作台)
- MANAGEMENT (管理页面)
- LEDGER (台账)
- ANALYSIS (分析页面)
- REPORT (报表页面)
- DETAIL (详情页面)

### 布局模式
- LIST (列表)
- CARD (卡片)
- SPLIT (分栏)
- BOARD (看板)
- CALENDAR (日历)

## 🚀 快速开始

```bash
# 克隆插件
git clone https://github.com/wangb1996/ui-generator.git

# 验证安装
cd ui-generator
./scripts/validate.sh
```

## 📚 文档

- [README](./README.md) - 完整文档
- [QUICK_START](./QUICK_START.md) - 快速上手
- [STRUCTURE](./STRUCTURE.md) - 项目结构
- [CONTRIBUTING](./CONTRIBUTING.md) - 贡献指南

## 🔗 相关仓库

- 规范仓库: [wangb1996/design-md](https://github.com/wangb1996/design-md)
- 项目仓库: [songluo-ctyl/SupervisionPlatform](https://github.com/songluo-ctyl/SupervisionPlatform)

## 📊 统计

- 26 个文件
- ~3,700 行代码和文档
- 9 个参考文档
- 7 个自动化脚本

感谢所有贡献者！🙏
```

## 🎯 步骤 4: 更新 README 徽章（可选）

编辑 README.md，添加真实的徽章：

```markdown
[![GitHub Release](https://img.shields.io/github/v/release/wangb1996/ui-generator)](https://github.com/wangb1996/ui-generator/releases)
[![GitHub Stars](https://img.shields.io/github/stars/wangb1996/ui-generator)](https://github.com/wangb1996/ui-generator/stargazers)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)
```

## 📢 步骤 5: 宣布发布

可以在以下渠道宣布：

1. **GitHub Discussions** - 创建公告
2. **团队内部** - Slack/钉钉/飞书
3. **文档网站** - 更新安装指南

## ✅ 验证发布

发布后，测试克隆和使用：

```bash
# 测试克隆
git clone https://github.com/wangb1996/ui-generator.git test-install
cd test-install

# 验证
./scripts/validate.sh

# 测试更新
./scripts/update.sh
```

## 🔄 后续更新

以后更新插件时：

```bash
cd ui-generator
git add .
git commit -m "feat: add new feature"
git push origin main

# 发布新版本
git tag -a v1.1.0 -m "Release version 1.1.0"
git push origin v1.1.0
```

---

**注意**: 如果遇到权限问题，确保：
1. 你有仓库的写权限
2. 正确配置了 SSH 密钥或个人访问令牌
3. 检查 Git 配置: `git config --list`
