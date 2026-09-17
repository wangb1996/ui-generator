# 截图占位说明

## 重要提示

本目录用于存放 SupervisionPlatform 项目的参考截图。由于隐私和版权原因，实际截图需要从项目中获取。

## 如何获取截图

### 方法 1: 从运行的项目截取

1. 启动 SupervisionPlatform 项目
2. 访问各个功能页面
3. 使用截图工具（Cmd+Shift+4）截取关键页面
4. 保存到对应目录

### 方法 2: 从设计稿导出

如果有 Figma/Sketch 设计稿：
1. 打开设计文件
2. 选择要导出的画板
3. 导出为 2x PNG
4. 保存到对应目录

### 方法 3: 从文档中提取

如果文档中有截图：
1. 从文档中复制图片
2. 调整分辨率为 2x
3. 保存到对应目录

## 目录结构

```
screenshots/
├── shell/                      # 应用外壳截图
│   ├── .gitkeep
│   └── README.md              # 说明需要哪些截图
│
├── page-types/                 # 页面类型截图
│   ├── ledger/
│   ├── management/
│   ├── workbench/
│   ├── analysis/
│   ├── report/
│   └── detail/
│
├── components/                 # 组件截图
│   └── .gitkeep
│
└── states/                     # 状态截图
    └── .gitkeep
```

## 优先级

### 必需截图（P0）

1. **LEDGER 完整页面**
   - 文件名: `page-types/ledger/overview.png`
   - 内容: 完整的台账页面，包含 Business View Tabs
   - 用途: 最常用的页面类型参考

2. **Application Shell**
   - 文件名: `shell/application-bar.png`
   - 内容: Application Bar + Module Switcher + Secondary Nav
   - 用途: 应用外壳结构参考

3. **Query Toolbar**
   - 文件名: `components/query-toolbar.png`
   - 内容: 双层 Query Toolbar 完整结构
   - 用途: 查询工具栏标准样式

4. **Record List Surface**
   - 文件名: `components/record-list.png`
   - 内容: 带 Surface 的表格，包含 Pagination
   - 用途: 列表展示标准样式

### 重要截图（P1）

5. MANAGEMENT 页面
6. Module Switcher 展开状态
7. Empty State
8. Loading State

### 可选截图（P2）

9. WORKBENCH 页面
10. SPLIT 布局
11. Drawer 展开
12. Settings 面板

## 截图规范

### 技术要求

- **格式**: PNG（支持透明）
- **分辨率**: 2x（Retina）
- **最大宽度**: 1920px
- **压缩**: 使用 ImageOptim 压缩

### 内容要求

- **真实数据**: 使用真实但脱敏的数据
- **完整上下文**: 包含足够的上下文信息
- **清晰度**: 文字清晰可读
- **代表性**: 选择典型场景

### 命名规范

```
<category>-<description>-<variant>.png

示例:
- ledger-overview-default.png
- ledger-overview-with-filters.png
- button-primary-hover.png
- empty-state-no-data.png
```

## 使用截图

### 在生成过程中

```javascript
// 读取参考截图
const reference = await readScreenshot('page-types/ledger/overview.png');

// 提取视觉特征
const features = extractFeatures(reference);

// 应用到生成
generatePage({
  reference: reference,
  features: features
});
```

### 在文档中引用

```markdown
参考截图: `screenshots/page-types/ledger/overview.png`
```

## 更新维护

### 何时更新

- 项目视觉风格调整后
- 规范更新后
- 发现截图过时后

### 如何更新

1. 重新截取最新页面
2. 覆盖旧截图（保持文件名不变）
3. 更新 README.md 中的说明
4. 提交到版本控制

## 版权说明

- 截图仅用于内部参考，不得公开传播
- 确保截图中不包含敏感信息
- 使用前需获得适当授权

## 占位图片

在实际截图未准备好之前，可以使用占位图片：

```html
<!-- 占位图片示例 -->
<img src="https://via.placeholder.com/1440x900/f5f5f5/666666?text=LEDGER+Overview" 
     alt="LEDGER 页面占位图">
```

---

**负责人**: Design System Team  
**获取帮助**: 联系项目维护者获取截图  
**最后更新**: 2026-09-17
