# 发布指南

本文档说明如何发布和分发 UI Generator Plugin。

## 📦 发布前检查清单

在发布新版本之前，请确保：

- [ ] 所有测试通过 (`./scripts/validate.sh`)
- [ ] 文档已更新（README.md, CHANGELOG.md）
- [ ] 版本号已更新（plugin.json, package.json）
- [ ] 上游仓库已同步到最新
- [ ] Git 提交历史清晰
- [ ] LICENSE 文件存在

## 🔢 版本管理

### 更新版本号

使用语义化版本号 (MAJOR.MINOR.PATCH)：

```bash
# 补丁版本（bug 修复）
npm version patch

# 次版本（新功能）
npm version minor

# 主版本（破坏性变更）
npm version major
```

或手动更新：
1. 修改 `plugin.json` 的 `version` 字段
2. 修改 `package.json` 的 `version` 字段
3. 更新 `CHANGELOG.md`

### 创建 Git 标签

```bash
# 创建版本标签
git tag -a v1.0.0 -m "Release version 1.0.0"

# 推送标签
git push origin v1.0.0
```

## 🚀 发布方法

### 方法 1: GitHub Release

1. 在 GitHub 上创建新的 Release
2. 选择对应的版本标签
3. 填写 Release Notes（从 CHANGELOG.md 复制）
4. 上传打包文件（可选）

```bash
# 创建分发包
tar -czf ui-generator-plugin-v1.0.0.tar.gz \
  ui-generator/ \
  scripts/ \
  plugin.json \
  package.json \
  README.md \
  LICENSE \
  CHANGELOG.md
```

### 方法 2: npm 发布（如果适用）

```bash
# 登录 npm
npm login

# 发布
npm publish
```

### 方法 3: 直接分发

用户可以直接克隆仓库：

```bash
git clone https://github.com/your-org/ui-generator-plugin.git
cd ui-generator-plugin
./scripts/validate.sh
```

## 📋 发布流程

### 完整发布步骤

```bash
# 1. 确保在主分支
git checkout main
git pull origin main

# 2. 同步上游内容
./scripts/update.sh

# 3. 运行验证
./scripts/validate.sh

# 4. 更新版本和文档
# 编辑 CHANGELOG.md，添加本次发布的内容
# 更新版本号

# 5. 提交变更
git add .
git commit -m "chore: release v1.0.0"

# 6. 创建标签
git tag -a v1.0.0 -m "Release version 1.0.0"

# 7. 推送到远程
git push origin main
git push origin v1.0.0

# 8. 在 GitHub 上创建 Release
```

## 📢 发布公告模板

```markdown
# UI Generator Plugin v1.0.0 发布

我们很高兴地宣布 UI Generator Plugin v1.0.0 正式发布！

## 🎉 主要特性

- ✨ 基于 design-md v2 规范
- 🎨 自动校准到 SupervisionPlatform 风格
- 🔄 支持自动更新
- 📦 完整的文档和参考

## 📥 安装

\`\`\`bash
git clone https://github.com/your-org/ui-generator-plugin.git ~/.claude/skills/ui-generator
\`\`\`

## 📚 文档

查看 [README.md](./README.md) 了解详细使用方法。

## 🔗 相关链接

- [完整变更日志](./CHANGELOG.md)
- [文档](./README.md)
- [问题反馈](https://github.com/your-org/ui-generator-plugin/issues)

感谢所有贡献者！
```

## 🔄 更新现有安装

用户更新到新版本：

```bash
cd ~/.claude/skills/ui-generator
git pull origin main
./scripts/validate.sh
```

或使用插件内置更新：

```bash
./scripts/update.sh
```

## 🐛 Hot-Fix 流程

紧急修复发布：

```bash
# 1. 创建 hotfix 分支
git checkout -b hotfix/1.0.1 v1.0.0

# 2. 修复问题
# ... 进行修复 ...

# 3. 运行验证
./scripts/validate.sh

# 4. 提交修复
git commit -am "fix: critical bug in validation"

# 5. 更新版本号（patch）
# 编辑 plugin.json 和 package.json

# 6. 合并到 main
git checkout main
git merge --no-ff hotfix/1.0.1

# 7. 创建标签并推送
git tag -a v1.0.1 -m "Hotfix version 1.0.1"
git push origin main
git push origin v1.0.1

# 8. 删除 hotfix 分支
git branch -d hotfix/1.0.1
```

## 📊 发布后

1. **监控反馈**: 关注 Issues 和用户反馈
2. **更新文档**: 根据用户问题更新 FAQ
3. **收集改进建议**: 规划下一版本
4. **社区沟通**: 在相关渠道宣布发布

## 🔐 安全发布

对于安全相关的更新：

1. 先在私有分支修复
2. 准备好 patch 后再公开
3. 在 Release Notes 中说明安全影响
4. 通知已知用户尽快更新

## 📝 Release Notes 模板

```markdown
## What's Changed

### ✨ New Features
- Feature A by @username
- Feature B by @username

### 🐛 Bug Fixes
- Fix X by @username
- Fix Y by @username

### 📚 Documentation
- Update README by @username
- Add examples by @username

### 🔧 Maintenance
- Update dependencies
- Improve build process

## 📦 Assets

- `ui-generator-plugin-v1.0.0.tar.gz` - 完整分发包

## 🔗 Links

- [Full Changelog](https://github.com/your-org/ui-generator-plugin/compare/v0.9.0...v1.0.0)
- [Documentation](./README.md)

**Full Changelog**: v0.9.0...v1.0.0
```

## ⚠️ 注意事项

1. **向后兼容**: 尽量保持向后兼容，避免破坏性变更
2. **测试充分**: 发布前充分测试
3. **文档同步**: 确保文档与代码同步
4. **用户通知**: 重大变更提前通知用户
5. **回滚准备**: 准备好快速回滚方案

## 🎯 下一步

发布完成后：

1. 更新项目看板
2. 开始规划下一版本
3. 处理用户反馈
4. 持续改进文档

---

有问题？查看 [FAQ](./docs/FAQ.md) 或提交 [Issue](https://github.com/your-org/ui-generator-plugin/issues)。
