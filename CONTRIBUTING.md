# 贡献指南

感谢你对 UI Generator Plugin 的兴趣！本文档将指导你如何为项目做出贡献。

## 🤝 贡献方式

你可以通过以下方式贡献：

- 🐛 报告 bug
- 💡 提出新功能建议
- 📝 改进文档
- 🔧 提交代码修复或新功能
- 🧪 编写测试
- 🎨 改进用户体验

## 🚀 开始之前

### 环境准备

1. Fork 本仓库
2. 克隆你的 fork

```bash
git clone https://github.com/your-username/ui-generator-plugin.git
cd ui-generator-plugin
```

3. 添加上游仓库

```bash
git remote add upstream https://github.com/your-org/ui-generator-plugin.git
```

4. 安装依赖（如果有）

```bash
npm install  # 或者其他包管理器
```

5. 运行验证

```bash
./scripts/validate.sh
```

## 📋 贡献流程

### 1. 创建 Issue

在开始工作之前，先创建或认领一个 Issue：

- **Bug Report**: 使用 bug 模板
- **Feature Request**: 使用 feature 模板
- **Documentation**: 使用 documentation 模板

### 2. 创建分支

从 main 分支创建你的工作分支：

```bash
git checkout main
git pull upstream main
git checkout -b feature/your-feature-name
# 或
git checkout -b fix/your-bug-fix
```

分支命名规范：
- `feature/` - 新功能
- `fix/` - Bug 修复
- `docs/` - 文档更新
- `refactor/` - 代码重构
- `test/` - 测试相关
- `chore/` - 构建/工具相关

### 3. 进行修改

遵循代码规范进行修改：

- 保持代码风格一致
- 添加必要的注释
- 更新相关文档
- 编写或更新测试

### 4. 提交变更

使用清晰的提交信息：

```bash
git add .
git commit -m "feat: add new component routing logic"
```

提交信息格式：

```
<type>(<scope>): <subject>

<body>

<footer>
```

类型 (type)：
- `feat`: 新功能
- `fix`: Bug 修复
- `docs`: 文档更新
- `style`: 代码格式（不影响功能）
- `refactor`: 重构
- `perf`: 性能优化
- `test`: 测试相关
- `chore`: 构建/工具

示例：

```
feat(component-routing): add support for dynamic components

- Add dynamic component loader
- Update routing table structure
- Add tests for new functionality

Closes #123
```

### 5. 推送到你的 Fork

```bash
git push origin feature/your-feature-name
```

### 6. 创建 Pull Request

1. 访问你的 fork 页面
2. 点击 "New Pull Request"
3. 填写 PR 模板
4. 确保所有检查通过
5. 等待审核

## ✅ Pull Request 检查清单

在提交 PR 前，请确保：

- [ ] 代码遵循项目风格
- [ ] 所有测试通过 (`./scripts/validate.sh`)
- [ ] 添加了必要的文档
- [ ] 更新了 CHANGELOG.md
- [ ] 提交信息清晰明确
- [ ] 没有合并冲突
- [ ] PR 描述清楚说明了变更内容

## 📝 代码规范

### Shell 脚本

```bash
#!/bin/bash
# 脚本说明

set -e  # 遇到错误立即退出

# 使用变量
VARIABLE_NAME="value"

# 函数定义
function_name() {
    local arg=$1
    echo "Processing: $arg"
}

# 主逻辑
main() {
    echo "Starting..."
    function_name "test"
}

main "$@"
```

### JavaScript/Node.js

```javascript
/**
 * 函数说明
 * @param {string} param - 参数说明
 * @returns {Promise<void>}
 */
async function functionName(param) {
  // 实现
}
```

### Markdown 文档

- 使用清晰的标题层级
- 代码块指定语言
- 添加必要的链接
- 保持格式一致

## 🧪 测试

### 运行验证

```bash
./scripts/validate.sh
```

### 测试更新流程

```bash
./scripts/update.sh
```

### 测试钩子

```bash
./scripts/pre-update.sh
./scripts/post-update.sh
```

## 📚 文档贡献

文档同样重要！你可以：

- 修复拼写/语法错误
- 改进说明的清晰度
- 添加示例
- 翻译文档

## 🐛 报告 Bug

好的 bug 报告应包含：

1. **清晰的标题**
2. **重现步骤**
3. **期望行为**
4. **实际行为**
5. **环境信息**（OS, Claude 版本等）
6. **截图/日志**（如果适用）

## 💡 功能建议

好的功能建议应包含：

1. **清晰的用例**
2. **为什么需要这个功能**
3. **建议的实现方式**
4. **可能的替代方案**

## 👥 代码审查

作为审查者：

- 保持友善和建设性
- 解释你的建议
- 认可好的实践
- 提出改进建议

作为被审查者：

- 虚心接受反馈
- 讨论不同观点
- 及时回应评论
- 感谢审查者的时间

## 🔄 保持同步

定期同步上游变更：

```bash
git checkout main
git pull upstream main
git push origin main
```

在你的功能分支上 rebase：

```bash
git checkout feature/your-feature
git rebase main
```

## 📞 获得帮助

如果需要帮助：

1. 查看 [README.md](./README.md)
2. 搜索现有 Issues
3. 加入讨论区
4. 创建新 Issue

## 🎯 成为维护者

活跃的贡献者可能被邀请成为维护者。维护者职责：

- 审查 Pull Requests
- 管理 Issues
- 参与项目规划
- 帮助其他贡献者

## 📜 行为准则

请遵循以下原则：

- **尊重**: 尊重所有参与者
- **包容**: 欢迎不同背景的贡献者
- **建设性**: 提供建设性的反馈
- **专注**: 保持讨论的专业性
- **帮助**: 帮助新贡献者

## 🎉 致谢

所有贡献者都会被列入 CHANGELOG.md 和 Release Notes。

感谢你的贡献！

---

有问题？欢迎在 Issues 中提问或发送邮件至 [email@example.com](mailto:email@example.com)。
