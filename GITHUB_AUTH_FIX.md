# 🔐 GitHub 推送权限问题解决方案

## 问题诊断

错误信息显示：
```
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.
```

这意味着需要配置 GitHub 认证。

## 🚀 解决方案（选择其一）

### 方案 1: 使用 Personal Access Token（推荐）

**步骤 1: 创建 GitHub Token**

1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token" → "Generate new token (classic)"
3. 填写：
   - Note: `ui-generator-plugin`
   - Expiration: 选择有效期
   - 勾选权限: `repo` (完整仓库访问权限)
4. 点击 "Generate token"
5. **复制生成的 token**（只显示一次！）

**步骤 2: 使用 Token 推送**

```bash
cd /tmp/claude-501/ui-generator-release

# 方法 A: 直接在URL中使用token
git remote set-url origin https://<YOUR_TOKEN>@github.com/wangb1996/ui-generator.git

# 方法 B: 使用用户名和token
git remote set-url origin https://wangb1996:<YOUR_TOKEN>@github.com/wangb1996/ui-generator.git

# 推送
git push -u origin main
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

### 方案 2: 配置 SSH 密钥

**步骤 1: 检查是否已有 SSH 密钥**

```bash
ls -la ~/.ssh
# 查找 id_rsa.pub 或 id_ed25519.pub
```

**步骤 2: 如果没有，创建新密钥**

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
# 按提示操作，可以直接回车使用默认值
```

**步骤 3: 添加密钥到 SSH Agent**

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

**步骤 4: 复制公钥到 GitHub**

```bash
# 显示公钥
cat ~/.ssh/id_ed25519.pub
# 或使用 pbcopy 复制到剪贴板
pbcopy < ~/.ssh/id_ed25519.pub
```

访问 https://github.com/settings/keys
- 点击 "New SSH key"
- 粘贴公钥
- 保存

**步骤 5: 测试并推送**

```bash
cd /tmp/claude-501/ui-generator-release

# 改用 SSH URL
git remote set-url origin git@github.com:wangb1996/ui-generator.git

# 测试连接
ssh -T git@github.com

# 推送
git push -u origin main
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

### 方案 3: 使用 GitHub CLI (gh)

如果已安装 GitHub CLI：

```bash
# 登录
gh auth login

# 推送
cd /tmp/claude-501/ui-generator-release
git push -u origin main
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

### 方案 4: 使用 GitHub Desktop（最简单）

1. 打开 GitHub Desktop
2. File → Add Local Repository
3. 选择路径: `/tmp/claude-501/ui-generator-release`
4. 点击 "Publish repository"
5. 选择账户: wangb1996
6. 仓库名: ui-generator
7. 取消勾选 "Keep this code private"（如果要公开）
8. 点击 Publish

### 方案 5: 手动上传（备选）

如果以上方法都不行：

1. 访问 https://github.com/wangb1996/ui-generator
2. 如果仓库不存在，点击 "+" → "New repository" 创建
3. 使用 GitHub 网页界面上传文件：
   - 上传发布包: `/tmp/claude-501/ui-generator-v1.0.0.tar.gz`
   - 或拖拽文件夹上传

## ✅ 推送成功后

### 验证

```bash
# 访问仓库确认
open https://github.com/wangb1996/ui-generator
```

### 创建 Release

1. 访问 https://github.com/wangb1996/ui-generator/releases/new
2. 填写：
   - Tag: `v1.0.0`
   - Title: `v1.0.0 - Initial Release`
   - Description: 参考 PUBLISH_GITHUB.md 中的内容
3. 点击 "Publish release"

## 🔍 故障排查

### 检查仓库是否存在

```bash
# 访问查看
open https://github.com/wangb1996/ui-generator

# 或使用 curl
curl -I https://github.com/wangb1996/ui-generator
```

### 检查权限

确保：
- 你是 wangb1996 账户的所有者
- 或者有该仓库的写权限
- Token 有正确的权限范围

### 查看当前 Git 配置

```bash
cd /tmp/claude-501/ui-generator-release
git remote -v
git config --list | grep user
```

## 💡 推荐方案

**最简单**: 方案 4 (GitHub Desktop)  
**最安全**: 方案 2 (SSH 密钥)  
**最快速**: 方案 1 (Personal Access Token)

## 📞 需要帮助？

如果问题依然存在：

1. 确认仓库已创建: https://github.com/wangb1996/ui-generator
2. 确认账户权限
3. 检查网络连接
4. 尝试使用发布包手动上传

---

**发布包位置**: `/tmp/claude-501/ui-generator-v1.0.0.tar.gz`  
**Git 仓库位置**: `/tmp/claude-501/ui-generator-release`
