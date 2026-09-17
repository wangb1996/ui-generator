# 视觉校准指南

## 目的

通过参考截图和实际项目实现，确保生成的 UI 在视觉上与 SupervisionPlatform 项目保持一致。

## 校准维度

### 1. 颜色系统

#### 主色调
```css
--primary-color: #1976d2;      /* 主要操作色 */
--primary-hover: #1565c0;      /* Hover 状态 */
--primary-light: #e3f2fd;      /* 浅色背景 */
```

#### 中性色
```css
--text-primary: #212121;       /* 主要文本 */
--text-secondary: #666666;     /* 次要文本 */
--text-disabled: #9e9e9e;      /* 禁用文本 */
--border-color: #e0e0e0;       /* 边框 */
--divider-color: #f0f0f0;      /* 分割线 */
```

#### 语义色
```css
--success-color: #2e7d32;      /* 成功/启用 */
--success-bg: #e8f5e9;         /* 成功背景 */
--error-color: #c62828;        /* 错误/禁用 */
--error-bg: #ffebee;           /* 错误背景 */
--warning-color: #f57c00;      /* 警告 */
--warning-bg: #fff3e0;         /* 警告背景 */
--info-color: #0288d1;         /* 信息 */
--info-bg: #e1f5fe;            /* 信息背景 */
```

#### 背景色
```css
--canvas-bg: #f5f5f5;          /* 页面背景 */
--surface-bg: #ffffff;         /* Surface 背景 */
--hover-bg: #f9f9f9;           /* Hover 背景 */
--selected-bg: #e3f2fd;        /* 选中背景 */
```

### 2. 字体系统

#### 字体家族
```css
--font-family: -apple-system, BlinkMacSystemFont, 
               'Segoe UI', 'Helvetica Neue', Arial, 
               'PingFang SC', 'Hiragino Sans GB', 
               'Microsoft YaHei', sans-serif;
```

#### 字体大小
```css
--font-size-xs: 11px;          /* 辅助说明 */
--font-size-sm: 12px;          /* 次要信息 */
--font-size-base: 14px;        /* 正文 */
--font-size-lg: 16px;          /* 小标题 */
--font-size-xl: 18px;          /* 标题 */
--font-size-2xl: 20px;         /* 大标题 */
```

#### 字重
```css
--font-weight-normal: 400;     /* 正常 */
--font-weight-medium: 500;     /* 中等（强调） */
--font-weight-semibold: 600;   /* 半粗（标题） */
```

#### 行高
```css
--line-height-tight: 1.2;      /* 紧凑 */
--line-height-normal: 1.5;     /* 正常 */
--line-height-relaxed: 1.75;   /* 松散 */
```

### 3. 间距系统

```css
--space-1: 4px;                /* 最小间距 */
--space-2: 8px;                /* 小间距 */
--space-3: 12px;               /* 基础间距 */
--space-4: 16px;               /* 常规间距 */
--space-5: 20px;               /* 中等间距 */
--space-6: 24px;               /* 大间距 */
--space-8: 32px;               /* 超大间距 */

/* 应用级间距 */
--application-space-1: 8px;
--application-space-2: 12px;
--application-space-3: 16px;
--application-space-4: 24px;
```

### 4. 圆角系统

```css
--radius-sm: 4px;              /* 小圆角（按钮、输入框） */
--radius-md: 8px;              /* 中圆角（卡片） */
--radius-lg: 12px;             /* 大圆角（对话框） */
--radius-xl: 16px;             /* 超大圆角（Surface） */
--radius-full: 9999px;         /* 完全圆角（徽章） */
```

### 5. 阴影系统

```css
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);           /* 微阴影 */
--shadow-md: 0 2px 4px rgba(0, 0, 0, 0.1);            /* 小阴影 */
--shadow-lg: 0 4px 8px rgba(0, 0, 0, 0.1);            /* 中阴影 */
--shadow-xl: 0 8px 16px rgba(0, 0, 0, 0.15);          /* 大阴影 */
--shadow-2xl: 0 16px 32px rgba(0, 0, 0, 0.2);         /* 超大阴影 */
```

### 6. 尺寸规范

#### Shell 高度
```css
--application-bar-height: 56px;        /* Application Bar */
--secondary-nav-height: 48px;          /* Secondary Navigation */
--toolbar-height: auto;                 /* 自适应内容 */
```

#### 控件高度
```css
--input-height: 32px;                  /* 输入框 */
--button-height-sm: 28px;              /* 小按钮 */
--button-height-md: 32px;              /* 中按钮 */
--button-height-lg: 40px;              /* 大按钮 */
```

#### 表格
```css
--table-row-height: 48px;              /* 表格行高 */
--table-header-height: 48px;           /* 表头高度 */
--table-cell-padding: 12px;            /* 单元格内边距 */
```

## 视觉校准检查清单

### Shell 层面
- [ ] Application Bar 高度为 56px
- [ ] Application Bar 背景为白色
- [ ] Application Bar 有 1px 底部边框
- [ ] Secondary Navigation 高度为 48px
- [ ] Module Switcher Tabs 使用正确的图标
- [ ] Active Tab 有蓝色下划线（2px）

### 页面层面
- [ ] Canvas 背景为 #f5f5f5
- [ ] 页面内容最大宽度 1440px，居中显示
- [ ] 页面内边距 24px
- [ ] 区块之间间距为 16px (application-space-3)

### 组件层面
- [ ] Surface 使用 16px 圆角
- [ ] Surface 背景为白色
- [ ] Surface 内边距 12px
- [ ] Line Tabs 使用 2px 下划线
- [ ] 按钮使用 4px 圆角
- [ ] 输入框使用 4px 圆角
- [ ] 输入框边框 1px solid #ddd

### 表格层面
- [ ] 表头使用 2px 底部边框
- [ ] 表格行使用 1px 底部边框
- [ ] Hover 时背景变为 #f9f9f9
- [ ] 选中时背景变为 #e3f2fd
- [ ] 单元格内边距 12px
- [ ] 表格行高 48px

### 文字层面
- [ ] 主要文本 14px
- [ ] 标题文本 16px 或 18px
- [ ] 辅助文本 12px
- [ ] 主要文本颜色 #212121
- [ ] 次要文本颜色 #666666
- [ ] 行高 1.5

### 交互层面
- [ ] Hover 有明显反馈
- [ ] Active 状态有视觉区分
- [ ] Disabled 状态为灰色且不可交互
- [ ] Focus 有聚焦边框
- [ ] 过渡动画 200-300ms

## 使用参考截图进行校准

### 步骤 1: 对照截图识别差异

```javascript
// 伪代码示例
const visualDiff = compareWithScreenshot({
  generated: generatedUI,
  reference: 'screenshots/page-types/ledger/overview.png',
  tolerance: 0.95  // 95% 相似度
});

if (visualDiff.similarity < 0.95) {
  console.log('需要调整的部分:', visualDiff.differences);
}
```

### 步骤 2: 调整关键差异

优先调整：
1. 颜色不匹配
2. 间距不一致
3. 字体大小差异
4. 圆角不符合
5. 阴影缺失

### 步骤 3: 验证响应式

在不同分辨率下对照截图：
- 1920×1080 (桌面)
- 1440×900 (笔记本)
- 1366×768 (小屏)
- 1024×576 (最小支持)

## 常见视觉问题及修复

### 问题 1: 间距过大或过小

❌ 错误：
```css
.toolbar {
  margin-bottom: 20px;  /* 随意值 */
}
```

✅ 正确：
```css
.toolbar {
  margin-bottom: var(--application-space-3);  /* 16px */
}
```

### 问题 2: 颜色不准确

❌ 错误：
```css
.primary-button {
  background: #2196f3;  /* 不准确的蓝色 */
}
```

✅ 正确：
```css
.primary-button {
  background: var(--primary-color);  /* #1976d2 */
}
```

### 问题 3: 圆角不一致

❌ 错误：
```css
.surface {
  border-radius: 10px;  /* 随意值 */
}
```

✅ 正确：
```css
.surface {
  border-radius: var(--radius-xl);  /* 16px */
}
```

### 问题 4: 字体大小混乱

❌ 错误：
```css
.title {
  font-size: 15px;  /* 不在系统中 */
}
```

✅ 正确：
```css
.title {
  font-size: var(--font-size-lg);  /* 16px */
}
```

## 自动化校准工具（未来）

```javascript
// 自动校准工具示例
const autoCalibrate = {
  // 从截图提取颜色
  extractColors(screenshot) {
    return dominantColors;
  },
  
  // 测量间距
  measureSpacing(screenshot) {
    return spacingValues;
  },
  
  // 识别字体
  detectFont(screenshot) {
    return fontFamily;
  },
  
  // 应用校准
  applyCalibration(generated, calibrationData) {
    return calibratedUI;
  }
};
```

---

**维护**: 随项目视觉更新同步更新  
**参考**: design-md Token 定义 + 项目实际实现  
**最后更新**: 2026-09-17
