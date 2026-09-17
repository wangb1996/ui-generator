# 示例：资产管理台账（LEDGER）

## 页面信息

- **页面类型**: LEDGER
- **页面模式**: LIST
- **业务场景**: 房地产资产管理
- **参考截图**: `screenshots/page-types/ledger/real-estate-ledger.png`

## 需求描述

创建一个房地产资产台账页面，支持：
- 多个业务视图（全部资产、在售、已售、租赁）
- 快速搜索和高级筛选
- 多列表格展示
- 批量操作

## 五层模型

```
L1: LEDGER (台账)
  └─ L2: LIST (列表模式)
      └─ L3: Business View (业务视图切换)
          ├─ 全部资产
          ├─ 在售
          ├─ 已售
          └─ 租赁
      └─ L4: Data Control (数据控制)
          ├─ 搜索: 资产名称、编号
          ├─ 筛选: 类型、区域、状态
          └─ 排序: 面积、价格、时间
      └─ L5: Data Presentation (数据展示)
          └─ 表格视图
```

## 字段定义

### 主要字段

| 字段 | 类型 | 说明 |
|------|------|------|
| 资产编号 | String | 唯一标识 |
| 资产名称 | String | 项目名称 |
| 类型 | Enum | 住宅/商业/办公 |
| 区域 | String | 所在区域 |
| 面积 | Number | 平方米 |
| 单价 | Currency | 元/平米 |
| 总价 | Currency | 元 |
| 状态 | Enum | 在售/已售/租赁 |
| 更新时间 | Date | 最后更新 |

## 生成结果

### HTML 结构

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>房地产资产台账 - SupervisionPlatform</title>
  <style>
    /* 参考 design-md 的 Foundation Token */
    :root {
      --application-bar-height: 56px;
      --secondary-nav-height: 48px;
      --application-space-3: 16px;
      --surface-radius: 16px;
      --surface-bg: #ffffff;
      --canvas-bg: #f5f5f5;
    }
    
    body {
      margin: 0;
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
      background: var(--canvas-bg);
    }
    
    /* Application Shell */
    .application-bar {
      height: var(--application-bar-height);
      background: white;
      border-bottom: 1px solid #e0e0e0;
      display: flex;
      align-items: center;
      padding: 0 24px;
      position: sticky;
      top: 0;
      z-index: 100;
    }
    
    .app-logo {
      font-size: 20px;
      font-weight: 600;
      margin-right: auto;
    }
    
    /* Secondary Navigation */
    .secondary-nav {
      height: var(--secondary-nav-height);
      background: white;
      border-bottom: 1px solid #e0e0e0;
      display: flex;
      align-items: center;
      padding: 0 24px;
      position: sticky;
      top: var(--application-bar-height);
      z-index: 99;
    }
    
    .module-switcher {
      display: flex;
      gap: 24px;
    }
    
    .module-tab {
      display: flex;
      align-items: center;
      gap: 8px;
      padding: 12px 0;
      border-bottom: 2px solid transparent;
      cursor: pointer;
      color: #666;
    }
    
    .module-tab.active {
      color: #1976d2;
      border-bottom-color: #1976d2;
    }
    
    /* Page Content */
    .page-container {
      padding: 24px;
      max-width: 1440px;
      margin: 0 auto;
    }
    
    /* Business View Tabs (line style) */
    .business-view-tabs {
      display: flex;
      gap: 32px;
      margin-bottom: var(--application-space-3);
    }
    
    .business-tab {
      padding: 8px 0;
      border-bottom: 2px solid transparent;
      cursor: pointer;
      color: #666;
      font-size: 14px;
    }
    
    .business-tab.active {
      color: #1976d2;
      border-bottom-color: #1976d2;
      font-weight: 500;
    }
    
    /* Query Toolbar (双层) */
    .query-toolbar {
      margin-bottom: var(--application-space-3);
    }
    
    .toolbar-row {
      display: flex;
      align-items: center;
      gap: 12px;
      margin-bottom: 12px;
    }
    
    .search-input {
      flex: 1;
      max-width: 400px;
      padding: 8px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }
    
    .filter-dropdown {
      padding: 8px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      background: white;
      cursor: pointer;
    }
    
    /* Record List Surface */
    .record-list-surface {
      background: var(--surface-bg);
      border-radius: var(--surface-radius);
      padding: 12px;
    }
    
    .data-table {
      width: 100%;
      border-collapse: collapse;
    }
    
    .data-table th {
      text-align: left;
      padding: 12px;
      border-bottom: 2px solid #e0e0e0;
      font-weight: 500;
      color: #333;
    }
    
    .data-table td {
      padding: 12px;
      border-bottom: 1px solid #f0f0f0;
    }
    
    .data-table tr:hover {
      background: #f9f9f9;
    }
    
    /* Pagination */
    .pagination {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 8px;
      margin-top: 16px;
      padding-top: 16px;
      border-top: 1px solid #f0f0f0;
    }
    
    .page-btn {
      padding: 6px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      background: white;
      cursor: pointer;
    }
    
    .page-btn.active {
      background: #1976d2;
      color: white;
      border-color: #1976d2;
    }
  </style>
</head>
<body>
  <!-- Application Bar -->
  <div class="application-bar">
    <div class="app-logo">监管平台</div>
    <div style="display: flex; gap: 16px;">
      <button>设置</button>
      <button>通知</button>
      <button>账户</button>
    </div>
  </div>
  
  <!-- Secondary Navigation -->
  <div class="secondary-nav">
    <div class="module-switcher">
      <div class="module-tab">
        <span>📊</span>
        <span>工作台</span>
      </div>
      <div class="module-tab active">
        <span>📋</span>
        <span>资产台账</span>
      </div>
      <div class="module-tab">
        <span>⚙️</span>
        <span>系统管理</span>
      </div>
    </div>
  </div>
  
  <!-- Page Content -->
  <div class="page-container">
    <!-- Business View Tabs -->
    <div class="business-view-tabs">
      <div class="business-tab active">全部资产</div>
      <div class="business-tab">在售</div>
      <div class="business-tab">已售</div>
      <div class="business-tab">租赁</div>
    </div>
    
    <!-- Query Toolbar -->
    <div class="query-toolbar">
      <div class="toolbar-row">
        <input type="text" class="search-input" placeholder="搜索资产名称、编号...">
        <select class="filter-dropdown">
          <option>类型：全部</option>
          <option>住宅</option>
          <option>商业</option>
          <option>办公</option>
        </select>
        <select class="filter-dropdown">
          <option>区域：全部</option>
        </select>
        <button style="margin-left: auto;">导出</button>
      </div>
    </div>
    
    <!-- Record List -->
    <div class="record-list-surface">
      <table class="data-table">
        <thead>
          <tr>
            <th><input type="checkbox"></th>
            <th>资产编号</th>
            <th>资产名称</th>
            <th>类型</th>
            <th>区域</th>
            <th>面积(㎡)</th>
            <th>单价(元/㎡)</th>
            <th>总价(万元)</th>
            <th>状态</th>
            <th>更新时间</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="checkbox"></td>
            <td>A001</td>
            <td>滨江花园A座</td>
            <td>住宅</td>
            <td>浦东新区</td>
            <td>120</td>
            <td>55,000</td>
            <td>660</td>
            <td><span style="color: green;">在售</span></td>
            <td>2026-09-15</td>
            <td>
              <button>查看</button>
              <button>编辑</button>
            </td>
          </tr>
          <tr>
            <td><input type="checkbox"></td>
            <td>A002</td>
            <td>CBD商务大厦</td>
            <td>办公</td>
            <td>静安区</td>
            <td>500</td>
            <td>80,000</td>
            <td>4,000</td>
            <td><span style="color: blue;">租赁</span></td>
            <td>2026-09-14</td>
            <td>
              <button>查看</button>
              <button>编辑</button>
            </td>
          </tr>
          <!-- 更多记录... -->
        </tbody>
      </table>
      
      <!-- Pagination -->
      <div class="pagination">
        <button class="page-btn">上一页</button>
        <button class="page-btn active">1</button>
        <button class="page-btn">2</button>
        <button class="page-btn">3</button>
        <button class="page-btn">下一页</button>
        <span style="margin-left: 16px;">共 156 条</span>
      </div>
    </div>
  </div>
</body>
</html>
```

## 关键特征对照

### ✅ 符合规范的部分

- Application Bar 高度 56px
- Secondary Navigation 高度 48px
- Business View 使用 line Tabs（下划线风格）
- Query Toolbar 保持双层结构
- Record List 使用 Surface 包裹（16px radius）
- 表格使用斑马纹和 hover 效果
- Pagination 居中显示

### 📋 需要注意的细节

- 图标使用项目实际图标字体
- 颜色使用项目 Design Token
- 间距使用 `application-space-*` 系列
- 动作按钮样式与项目一致
- Empty State / Loading State 需要单独实现

## 生成说明

此示例展示了完整的 LEDGER 页面结构，包括：

1. **应用外壳**: Application Bar + Secondary Navigation
2. **业务视图**: Line Tabs 切换
3. **查询工具栏**: 双层结构
4. **数据列表**: Surface + Table + Pagination
5. **交互状态**: Hover、Active、Selected

生成时参考此示例的结构和样式，确保与 SupervisionPlatform 项目风格一致。

---

**参考截图**: `screenshots/page-types/ledger/real-estate-ledger.png`  
**规范文档**: `05-页面类型/02-台账/台账.md`  
**项目校准**: `references/project-calibration.md`
