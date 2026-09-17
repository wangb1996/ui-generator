# 常见问题模式库

## 目的

收集常见的 UI 生成问题和标准解决方案，避免重复犯错，提高生成质量。

## 问题分类

### 1. 结构问题

#### 问题 1.1: 混淆 Page Mode 和 Business View

**错误示例**：
```
用户：生成一个台账，有列表视图和卡片视图
错误理解：LEDGER + Business View (列表/卡片)
```

**正确理解**：
```
LEDGER + Page Mode (LIST/CARD) + Business View (业务维度切换)
```

**解决方案**：
- LIST/CARD 是 L2 Page Mode（布局方式）
- Business View 是 L3（业务维度，如：全部/在售/已售）
- 不要把 Page Mode 当成 Business View

#### 问题 1.2: DETAIL 页面误加 Page Mode

**错误示例**：
```
生成 DETAIL 类型页面，LIST 模式
```

**正确理解**：
```
DETAIL 是独立的页面类型，没有 Page Mode
使用 Independent Detail 布局规范
```

#### 问题 1.3: 多模块应用扁平化导航

**错误示例**：
```html
<div class="tabs">
  <div>工作台</div>
  <div>资产台账</div>
  <div>用户管理</div>
  <div>系统设置</div>
</div>
```

**正确理解**：
```html
<!-- Module Switcher -->
<div class="module-switcher">
  <div class="module">资产管理</div>  <!-- 模块组 -->
  <div class="module">系统管理</div>
</div>

<!-- Secondary Tabs（当前模块内） -->
<div class="secondary-tabs">
  <div>资产台账</div>
  <div>资产详情</div>
</div>
```

### 2. 样式问题

#### 问题 2.1: 使用随意的颜色值

**错误示例**：
```css
.button {
  background: #2196f3;  /* 随意的蓝色 */
}
```

**正确做法**：
```css
.button {
  background: var(--primary-color);  /* #1976d2 */
}
```

#### 问题 2.2: 间距不规范

**错误示例**：
```css
.container {
  padding: 15px;     /* 随意值 */
  margin-bottom: 18px;  /* 随意值 */
}
```

**正确做法**：
```css
.container {
  padding: var(--space-4);              /* 16px */
  margin-bottom: var(--application-space-3);  /* 16px */
}
```

#### 问题 2.3: Surface 圆角错误

**错误示例**：
```css
.record-list {
  border-radius: 8px;  /* 应该是 16px */
}
```

**正确做法**：
```css
.record-list {
  border-radius: var(--radius-xl);  /* 16px */
}
```

### 3. 组件问题

#### 问题 3.1: Business View 使用错误控件

**错误示例**：
```html
<!-- LEDGER 的 Business View 使用 Segmented Control -->
<div class="segmented-control">
  <button>全部</button>
  <button>在售</button>
  <button>已售</button>
</div>
```

**正确做法**：
```html
<!-- LEDGER 的 Business View 必须使用 Line Tabs -->
<div class="business-view-tabs">
  <div class="tab active">全部</div>
  <div class="tab">在售</div>
  <div class="tab">已售</div>
</div>

<style>
.tab.active {
  border-bottom: 2px solid var(--primary-color);
}
</style>
```

#### 问题 3.2: Page Mode 控件选择错误

**错误示例**：
```html
<!-- 普通 LIST 的 Page Mode 使用平铺按钮 -->
<div class="view-modes">
  <button>列表</button>
  <button>卡片</button>
  <button>看板</button>
</div>
```

**正确做法**：
```html
<!-- 普通 LIST 的 Page Mode 使用 Dropdown -->
<select class="view-mode-dropdown">
  <option>列表视图</option>
  <option>卡片视图</option>
  <option>看板视图</option>
</select>
```

#### 问题 3.3: Query Toolbar 单层结构

**错误示例**：
```html
<div class="toolbar">
  <input type="text" placeholder="搜索">
  <select>筛选</select>
  <button>新增</button>
</div>
```

**正确做法**：
```html
<div class="query-toolbar">
  <!-- 第一层：页面动作 -->
  <div class="toolbar-row">
    <button class="primary">新增</button>
    <button>导出</button>
  </div>
  
  <!-- 第二层：搜索筛选 -->
  <div class="toolbar-row">
    <input type="text" placeholder="搜索">
    <select>筛选</select>
  </div>
</div>
```

### 4. 状态问题

#### 问题 4.1: 缺少 Empty State

**错误示例**：
```html
<!-- 无数据时显示空表格 -->
<table>
  <thead>...</thead>
  <tbody>
    <!-- 空 -->
  </tbody>
</table>
```

**正确做法**：
```html
<div class="empty-state">
  <div class="empty-icon">📋</div>
  <div class="empty-title">暂无数据</div>
  <div class="empty-description">点击"新增"创建第一条记录</div>
  <button class="primary">+ 新增</button>
</div>
```

#### 问题 4.2: 缺少 Loading State

**错误示例**：
```html
<!-- 加载时显示空白 -->
```

**正确做法**：
```html
<div class="loading-state">
  <div class="spinner"></div>
  <div>加载中...</div>
</div>
```

#### 问题 4.3: Disabled 状态不明显

**错误示例**：
```css
button:disabled {
  opacity: 0.8;  /* 不够明显 */
}
```

**正确做法**：
```css
button:disabled {
  opacity: 0.4;
  cursor: not-allowed;
  background: #e0e0e0;
  color: #9e9e9e;
}
```

### 5. 交互问题

#### 问题 5.1: 缺少 Hover 反馈

**错误示例**：
```css
.table-row {
  /* 没有 hover 样式 */
}
```

**正确做法**：
```css
.table-row:hover {
  background: var(--hover-bg);  /* #f9f9f9 */
  transition: background 200ms;
}
```

#### 问题 5.2: 批量操作不显示选中数量

**错误示例**：
```html
<button>批量删除</button>
```

**正确做法**：
```html
<div class="batch-actions">
  <span>已选中 5 条</span>
  <button>批量删除</button>
  <button>取消</button>
</div>
```

#### 问题 5.3: 动作按钮无确认

**错误示例**：
```html
<button onclick="delete()">删除</button>
```

**正确做法**：
```html
<button onclick="confirmDelete()">删除</button>

<script>
function confirmDelete() {
  if (confirm('确定要删除吗？此操作不可恢复。')) {
    delete();
  }
}
</script>
```

### 6. 响应式问题

#### 问题 6.1: 固定宽度不自适应

**错误示例**：
```css
.page-container {
  width: 1440px;  /* 固定宽度 */
}
```

**正确做法**：
```css
.page-container {
  max-width: 1440px;
  width: 100%;
  margin: 0 auto;
  padding: 0 24px;
}
```

#### 问题 6.2: 小屏不适配

**错误示例**：
```css
/* 没有响应式断点 */
```

**正确做法**：
```css
@media (max-width: 1024px) {
  .query-toolbar {
    flex-direction: column;
  }
  
  .table {
    font-size: 12px;
  }
}
```

### 7. 可访问性问题

#### 问题 7.1: 缺少语义化标签

**错误示例**：
```html
<div class="button" onclick="submit()">提交</div>
```

**正确做法**：
```html
<button type="submit">提交</button>
```

#### 问题 7.2: 缺少 ARIA 标签

**错误示例**：
```html
<div class="icon">×</div>
```

**正确做法**：
```html
<button aria-label="关闭" class="close-button">
  <span aria-hidden="true">×</span>
</button>
```

#### 问题 7.3: 颜色对比度不足

**错误示例**：
```css
.text {
  color: #999;  /* 在白色背景上对比度不足 */
  background: white;
}
```

**正确做法**：
```css
.text {
  color: var(--text-secondary);  /* #666，满足 WCAG AA */
  background: white;
}
```

## 快速检查清单

### 生成前

- [ ] 确认 Page Type 和 Page Mode 正确
- [ ] 理解 Business View 的真实含义
- [ ] 明确所有必需字段
- [ ] 确定所有必需动作

### 生成中

- [ ] 使用 Design Token 而非随意值
- [ ] 组件选择符合规范
- [ ] 双层 Query Toolbar
- [ ] Surface 使用 16px 圆角

### 生成后

- [ ] 验证 Empty State
- [ ] 验证 Loading State
- [ ] 验证 Hover 反馈
- [ ] 验证响应式
- [ ] 验证可访问性

## 常见错误速查

| 错误 | 原因 | 修复 |
|------|------|------|
| Business View 是 segmented | 误用控件 | 改用 line tabs |
| Query Toolbar 单层 | 不了解规范 | 改为双层结构 |
| Surface 圆角 8px | 使用错误值 | 改为 16px |
| Page Mode 平铺按钮 | 误用控件 | 改用 dropdown |
| 颜色值随意 | 未使用 token | 改用 Design Token |
| 间距不一致 | 随意设置 | 使用间距系统 |
| 缺少空态 | 遗漏状态 | 添加 Empty State |
| 无 hover 反馈 | 遗漏交互 | 添加 hover 样式 |

## 自我诊断

生成完成后问自己：

1. **结构层面**
   - 五层模型是否正确？
   - 导航层级是否清晰？

2. **样式层面**
   - 所有颜色都来自 Design Token？
   - 所有间距都使用系统变量？
   - 所有圆角都符合规范？

3. **组件层面**
   - Business View 用对控件了吗？
   - Page Mode 用对控件了吗？
   - Query Toolbar 是双层吗？

4. **状态层面**
   - 实现了所有必需状态吗？
   - Empty/Loading/Error 都有吗？

5. **交互层面**
   - Hover 有反馈吗？
   - 批量操作显示选中数量吗？
   - 危险动作有确认吗？

---

**持续更新**: 发现新问题时立即记录  
**版本**: 1.0.0  
**最后更新**: 2026-09-17
