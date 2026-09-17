# 项目结构

```
ui-generator-plugin/
│
├── 📄 README.md                    # 项目主文档
├── 📄 QUICK_START.md               # 快速开始指南
├── 📄 CHANGELOG.md                 # 变更日志
├── 📄 CONTRIBUTING.md              # 贡献指南
├── 📄 PUBLISHING.md                # 发布指南
├── 📄 LICENSE                      # MIT 许可证
├── 📄 .gitignore                   # Git 忽略规则
├── 📄 package.json                 # npm 包配置
├── 📄 plugin.json                  # 插件元数据配置
├── 📄 crontab.example              # 定时任务示例
│
├── 📁 ui-generator/                # 核心技能目录
│   ├── 📄 SKILL.md                 # 主技能定义文件
│   │                               # - 包含完整的生成规则
│   │                               # - 定义工作流程
│   │                               # - 说明硬约束和边界
│   │
│   └── 📁 references/              # 参考文档目录
│       ├── 📄 source-map.md        # 源仓库映射表
│       │                           # - design-md 分支和路径
│       │                           # - SupervisionPlatform 关键文件
│       │                           # - 版本冻结信息
│       │
│       ├── 📄 core-normative-baseline.md
│       │                           # 核心规范基线（离线摘要）
│       │                           # - 五层模型
│       │                           # - Foundation Token
│       │                           # - Shell 结构
│       │                           # - Page Type/Mode 规范
│       │                           # - 高频组件
│       │
│       ├── 📄 project-calibration.md
│       │                           # 项目校准事实
│       │                           # - Shell 节奏
│       │                           # - 组件组合
│       │                           # - 交互细节
│       │                           # - 视觉节奏
│       │
│       ├── 📄 conflicts-and-precedence.md
│       │                           # 冲突处理规则
│       │                           # - 优先级裁决
│       │                           # - Spec Gap 登记
│       │                           # - 已知冲突表
│       │
│       ├── 📄 component-routing.md # 组件路由表
│       │                           # - 组件 Owner 映射
│       │                           # - 何时读取哪个组件
│       │
│       ├── 📄 page-type-routing.md # 页面类型路由
│       │                           # - Page Type 对应的文档
│       │                           # - 读取路径指南
│       │
│       ├── 📄 navigation-action-panels.md
│       │                           # 导航与动作面板
│       │                           # - Application Bar 配置
│       │                           # - 右侧动作结构
│       │                           # - Overlay 行为
│       │
│       ├── 📄 acceptance-gate.md   # 验收检查清单
│       │                           # - 产品一致性
│       │                           # - 规范符合度
│       │                           # - 可用性检查
│       │
│       └── 📄 visual-reference-index.md
│                                   # 视觉参考索引
│                                   # - 截图索引
│                                   # - 视觉校准证据
│
├── 📁 scripts/                     # 自动化脚本目录
│   ├── 📄 update.sh                # 主更新脚本
│   │                               # - 从 GitHub 拉取最新内容
│   │                               # - 提取规范和项目事实
│   │                               # - 更新版本信息
│   │
│   ├── 📄 validate.sh              # 验证脚本
│   │                               # - 检查文件完整性
│   │                               # - 验证 JSON 格式
│   │                               # - 检查引用链接
│   │
│   ├── 📄 pre-update.sh            # 更新前钩子
│   │                               # - 备份当前版本
│   │                               # - 检查 Git 状态
│   │
│   ├── 📄 post-update.sh           # 更新后钩子
│   │                               # - 运行验证
│   │                               # - 确认更新结果
│   │
│   ├── 📄 github-downloader.js     # GitHub API 下载器
│   │                               # - 备选下载方案
│   │                               # - 处理 git clone 失败
│   │
│   └── 📁 extractors/              # 内容提取器
│       ├── 📄 extract-normative.js # 规范提取器
│       │                           # - 从 design-md 提取关键内容
│       │                           # - 生成 core-normative-baseline.md
│       │
│       └── 📄 extract-calibration.js
│                                   # 项目校准提取器
│                                   # - 从 SupervisionPlatform 提取
│                                   # - 生成 project-calibration.md
│
├── 📁 .temp/                       # 临时目录（gitignored）
│   ├── design-md/                  # 克隆的规范仓库
│   └── SupervisionPlatform/        # 克隆的项目仓库
│
├── 📁 .backups/                    # 备份目录（gitignored）
│   └── YYYYMMDD_HHMMSS/            # 按时间戳组织的备份
│
└── 📁 logs/                        # 日志目录（gitignored）
    └── update.log                  # 更新日志
```

## 📋 文件说明

### 核心配置文件

- **plugin.json**: 插件的元数据和配置
  - 版本信息
  - 仓库地址
  - 更新策略
  - 技能入口
  - 生命周期钩子

- **package.json**: npm 包配置
  - 依赖管理
  - 脚本命令
  - 项目信息

### 技能文件

- **SKILL.md**: 主技能定义
  - 完整的生成规则
  - 工作流程说明
  - 硬约束和边界
  - 验收标准

### 参考文档

所有参考文档位于 `ui-generator/references/`：

1. **source-map.md**: 知识来源映射
2. **core-normative-baseline.md**: 离线规范摘要
3. **project-calibration.md**: 项目特定事实
4. **conflicts-and-precedence.md**: 冲突解决规则
5. **component-routing.md**: 组件查找表
6. **page-type-routing.md**: 页面类型查找表
7. **navigation-action-panels.md**: 导航结构
8. **acceptance-gate.md**: 验收清单
9. **visual-reference-index.md**: 视觉参考

### 自动化脚本

- **update.sh**: 主更新入口
- **validate.sh**: 完整性验证
- **pre-update.sh**: 更新前准备
- **post-update.sh**: 更新后检查
- **github-downloader.js**: API 下载备选
- **extract-normative.js**: 规范内容提取
- **extract-calibration.js**: 项目事实提取

## 🔄 数据流

```
┌─────────────────────────────────────────────────────────────┐
│                    上游仓库 (GitHub)                         │
├─────────────────────────────────────────────────────────────┤
│  design-md (规范)         SupervisionPlatform (项目)        │
│  - GENERATIVE-SPEC.md     - 壳层结构                        │
│  - Token 定义             - 组件实现                         │
│  - 页面规范               - 样式细节                         │
└─────────────────────────────────────────────────────────────┘
                            ↓
                    ┌───────────────┐
                    │  update.sh    │
                    └───────────────┘
                            ↓
        ┌───────────────────┴───────────────────┐
        ↓                                       ↓
┌──────────────────┐                  ┌──────────────────┐
│ extract-         │                  │ extract-         │
│ normative.js     │                  │ calibration.js   │
└──────────────────┘                  └──────────────────┘
        ↓                                       ↓
┌──────────────────┐                  ┌──────────────────┐
│ core-normative-  │                  │ project-         │
│ baseline.md      │                  │ calibration.md   │
└──────────────────┘                  └──────────────────┘
                            ↓
                    ┌───────────────┐
                    │  validate.sh  │
                    └───────────────┘
                            ↓
                    ┌───────────────┐
                    │   SKILL.md    │
                    │   (使用参考)   │
                    └───────────────┘
                            ↓
                    ┌───────────────┐
                    │  生成 UI      │
                    └───────────────┘
```

## 🎯 扩展点

### 添加新的参考文档

1. 在 `ui-generator/references/` 创建新文件
2. 在 `plugin.json` 的 `references` 数组中添加路径
3. 在 `SKILL.md` 中引用新文档

### 添加新的提取器

1. 在 `scripts/extractors/` 创建新的 `.js` 文件
2. 在 `update.sh` 中调用新提取器
3. 定义输出文件路径

### 自定义更新逻辑

编辑 `scripts/update.sh`：
- 修改克隆逻辑
- 添加预处理步骤
- 自定义提取规则

## 📦 分发结构

发布时的打包结构：

```
ui-generator-plugin-v1.0.0/
├── ui-generator/
├── scripts/
├── plugin.json
├── package.json
├── README.md
├── QUICK_START.md
├── LICENSE
└── CHANGELOG.md
```

排除：
- `.temp/`
- `.backups/`
- `logs/`
- `node_modules/`
- `.git/`

## 🔒 权限要求

- **读取**: 所有文件可读
- **执行**: `scripts/*.sh` 需要执行权限
- **写入**: `.temp/`, `.backups/`, `logs/` 需要写入权限

---

**维护**: 保持此文档与实际结构同步  
**最后更新**: 2026-09-17
