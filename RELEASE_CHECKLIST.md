# 📋 发布检查清单

## ✅ 发布前检查

### 代码和文件
- [x] 所有核心文件已创建（26个文件）
- [x] 脚本有执行权限
- [x] JSON 格式验证通过
- [x] 插件结构验证通过 (`./scripts/validate.sh`)
- [x] .gitignore 配置正确

### 文档
- [x] README.md 完整且准确
- [x] QUICK_START.md 提供快速上手指南
- [x] CHANGELOG.md 记录版本历史
- [x] LICENSE 文件存在（MIT）
- [x] 所有链接指向正确的仓库地址

### 配置
- [x] plugin.json 配置正确
- [x] package.json 指向正确的仓库
- [x] 版本号一致（v1.0.0）
- [x] 仓库地址更新为 wangb1996/ui-generator

## 🚀 发布步骤

### 方法 A: 使用辅助脚本（推荐）

```bash
# 运行辅助脚本
./.github_setup.sh

# 然后按提示操作
cd ~/Desktop/ui-generator-release
git push -u origin main
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

### 方法 B: 手动操作

参考 [PUBLISH_GITHUB.md](./PUBLISH_GITHUB.md) 的详细步骤。

## 📦 发布后

### GitHub Release
1. 访问 https://github.com/wangb1996/ui-generator/releases/new
2. 选择标签 v1.0.0
3. 填写 Release 说明（见 PUBLISH_GITHUB.md）
4. 点击发布

### 验证安装
```bash
# 在新位置测试克隆
git clone https://github.com/wangb1996/ui-generator.git test-verify
cd test-verify
./scripts/validate.sh
```

### 宣布发布
- [ ] 更新团队文档
- [ ] 发送通知给团队成员
- [ ] 更新内部 Wiki/知识库

## 🔄 维护

### 定期更新
```bash
cd ui-generator
./scripts/update.sh
git add .
git commit -m "chore: update content from upstream"
git push
```

### 版本发布
```bash
# 更新版本号
# 编辑 plugin.json 和 package.json

# 提交变更
git commit -am "chore: bump version to 1.1.0"

# 创建标签
git tag -a v1.1.0 -m "Release version 1.1.0"
git push origin main
git push origin v1.1.0

# 在 GitHub 创建 Release
```

## 📊 成功指标

发布成功后，确认：
- [ ] GitHub 仓库可访问
- [ ] README 正常显示
- [ ] Release 页面已创建
- [ ] 可以成功克隆
- [ ] 验证脚本通过
- [ ] 更新脚本可运行

## 🎉 完成！

插件已准备好发布和使用！

---

**当前状态**: ✅ 准备就绪  
**版本**: v1.0.0  
**仓库**: https://github.com/wangb1996/ui-generator
