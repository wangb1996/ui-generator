# 截图参考索引

## 目的

提供真实项目截图作为视觉参考，确保生成结果与 SupervisionPlatform 项目风格一致。

## 截图组织结构

```
screenshots/
├── shell/                      # 应用外壳
│   ├── application-bar.png     # Application Bar 顶栏
│   ├── module-switcher.png     # Module Switcher 模块切换器
│   ├── secondary-nav.png       # Secondary Navigation 二级导航
│   └── right-actions.png       # 右侧动作区域
│
├── page-types/                 # 页面类型
│   ├── ledger/
│   │   ├── overview.png
│   │   ├── business-tabs.png
│   │   └── data-table.png
│   ├── management/
│   │   ├── list-view.png
│   │   └── card-view.png
│   └── workbench/
│       └── dashboard.png
│
├── components/                 # 组件
│   ├── query-toolbar.png
│   ├── record-list.png
│   ├── pagination.png
│   ├── filters.png
│   └── action-buttons.png
│
└── states/                     # 状态
    ├── empty-state.png
    ├── loading-state.png
    ├── error-state.png
    └── selected-state.png
```

## 使用方式

### 在 SKILL.md 中引用

```markdown
生成时参考截图：`screenshots/page-types/ledger/overview.png`
```

### 在生成过程中

1. 读取对应的截图参考
2. 识别关键视觉特征
3. 确保生成结果与截图风格一致

## 关键视觉特征

### Application Shell

- **Application Bar**: 高度 56px，白色背景
- **Module Switcher**: 左侧模块列表 + 当前选中高亮
- **Secondary Tabs**: 图标 + 文字 + active underline
- **Right Actions**: 设置、通知、账户等图标按钮

### Query Toolbar

- **双层结构**: Tabs 行 + Search/Filter 行
- **间距**: `application-space-3` 级别
- **背景**: Canvas 背景
- **控件**: 左对齐搜索，右对齐筛选和视图切换

### Record List

- **Surface**: 16px radius、白色背景
- **Padding**: 12px 级别内边距
- **Table**: 斑马纹、hover 高亮
- **Pagination**: 底部居中

## 截图获取来源

1. **SupervisionPlatform 实际运行截图**
   - 从项目演示环境截取
   - 确保为实际生产风格

2. **规范展示应用截图**
   - 从 standards-showcase 功能截取
   - 体现标准规范的实现

3. **组件中心截图**
   - UI Component Center 的组件示例
   - 展示单个组件的各种状态

## 截图要求

### 技术规格

- **格式**: PNG（支持透明）
- **分辨率**: 2x（Retina）
- **最大宽度**: 1920px
- **压缩**: 使用 ImageOptim 或类似工具

### 内容要求

- **清晰度**: 文字可读，边界清晰
- **完整性**: 包含上下文，不要过度裁剪
- **真实性**: 使用真实数据，不要 Lorem Ipsum
- **代表性**: 选择典型场景和常见状态

## 截图标注

对于复杂截图，可以添加标注版本：

```
screenshots/
├── ledger-overview.png          # 原始截图
└── ledger-overview-annotated.png # 标注版本
```

标注内容：
- 关键区域框选
- 尺寸标注
- 组件名称
- 交互说明

## 更新流程

1. **定期更新**: 每次项目视觉调整后更新截图
2. **版本标记**: 在文件名或元数据中记录版本
3. **对比验证**: 生成结果与最新截图对比

## 截图清单

### 必需截图（高优先级）

- [ ] Application Bar 完整视图
- [ ] Module Switcher 展开状态
- [ ] LEDGER 页面完整视图
- [ ] LIST 布局完整视图
- [ ] Query Toolbar 双层结构
- [ ] Record List Surface
- [ ] Empty State
- [ ] Loading State

### 可选截图（中优先级）

- [ ] 各种 Page Mode 切换
- [ ] Drawer 展开效果
- [ ] Popover 浮层
- [ ] Settings 面板
- [ ] 响应式布局（不同分辨率）

### 补充截图（低优先级）

- [ ] 组件 Hover 状态
- [ ] Focus 状态
- [ ] Disabled 状态
- [ ] 动画过渡效果

## 注意事项

1. **隐私保护**: 截图中不包含敏感信息
2. **授权许可**: 确保有使用截图的权限
3. **文件大小**: 控制总体积，避免仓库过大
4. **命名规范**: 使用 kebab-case，描述性命名

## 使用示例

### 在生成 LEDGER 页面时

```javascript
// 1. 读取参考截图
const referenceImage = await readScreenshot('page-types/ledger/overview.png');

// 2. 识别关键特征
const features = {
  businessViewTabs: '顶部 line tabs',
  queryToolbar: '双层结构',
  recordList: '带 Surface 的表格'
};

// 3. 应用到生成
generateLedgerPage({
  reference: referenceImage,
  features: features
});
```

---

**维护**: 每次规范或项目重大更新后更新截图  
**负责人**: Design System Team  
**最后更新**: 2026-09-17
