# 人力资源系统 UI 组件使用说明

本文档说明如何使用生成的人力资源系统工作台和人员台账页面。

## 📋 目录

- [组件概览](#组件概览)
- [技术规范](#技术规范)
- [工作台页面](#工作台页面)
- [人员台账页面](#人员台账页面)
- [集成指南](#集成指南)
- [定制化指南](#定制化指南)

---

## 组件概览

本次生成包含两个完整的页面组件：

1. **HRWorkbench** - 人力资源工作台（WORKBENCH）
2. **HREmployeeLedger** - 人员台账（LEDGER）

### 设计规范

- ✅ **规范基础**: design-md v2 规范
- 🎨 **风格对齐**: SupervisionPlatform 项目风格
- 📐 **五层模型**: 严格遵循 L1-L5 层级架构
- 🔧 **组件体系**: Foundation + Application Atomic + Application Module

---

## 技术规范

### Foundation Token

所有组件严格遵循以下设计 Token：

**间距系统**
```css
--space-1: 4px
--space-2: 8px
--space-3: 12px
--space-4: 16px
--space-5: 24px
```

**圆角系统**
```css
--radius-8: 8px
--radius-12: 12px
--radius-16: 16px
--radius-20: 20px
```

**字体系统**
```css
字体：PingFang SC, PingFang TC, Microsoft YaHei
字号：12px / 14px / 16px / 20px / 24px
行高：16px / 20px / 24px / 28px / 32px
字重：400 / 500 / 600 / 700
```

**颜色系统**
```css
主色：#0071E3 (Primary)
成功：#0D8F50 (Success)
警告：#E68A00 (Warning)
危险：#D93025 (Danger)
中性背景：#FFFFFF / #FAFAF9 / #F5F4F1
中性前景：#1F1E1A / #4D4B45 / #6E6C64 / #757169
```

---

## 工作台页面

### 页面类型

- **Page Type**: WORKBENCH
- **结构**: COMPOSITE/hybrid
- **用途**: 关键指标、待办事项、快捷入口、数据分析

### 功能区域

#### 1. 页面头部（Page Context）
```jsx
- 页面标题
- 最后更新时间
- 刷新按钮
- 新建任务按钮
```

#### 2. 核心指标（Core Metrics）
```jsx
- 4 个关键指标卡片
- 每个指标包含：标签、数值、单位、趋势
- 趋势显示与上月对比
```

#### 3. 工作区域（Work Region）

**待办事项（Pending Work）**
- 显示待审批事项列表
- 优先级标识（高/中/低）
- 快捷操作按钮（批准/拒绝/更多）
- Empty 状态处理

**快捷操作（Quick Actions）**
- 2 列网格布局
- 图标 + 标题 + 描述
- Hover 状态带上浮效果
- Disabled 状态支持

#### 4. 数据分析（Analysis Region）
```jsx
- 2 列图表网格
- 支持图表类型切换
- 图表占位符（可替换为 ECharts/Chart.js）
```

### 状态处理

**Empty State**
- Region 内原位呈现
- 最小高度 160px
- 虚线边界 + 插图
- 简短说明文字

**交互状态**
- Hover: 轻量 Accent 提示
- Focus-visible: 明确的焦点环
- Active: 1px 向下反馈
- Disabled: 保持结构，弱化显示

### 响应式适配

**Compact 模式（≤ 1180px）**
```css
- Metrics: 4列 → 2列
- Work Region: 双列 → 单列
- Analysis: 2列 → 1列
- Quick Actions: 2列 → 1列
```

---

## 人员台账页面

### 页面类型

- **Page Type**: LEDGER
- **Page Mode**: LIST + DataTable
- **用途**: 员工信息查询、核对、批量处理

### 功能区域

#### 1. 应用页面头部（Application Page Header）
```jsx
- 页面标题 + 元信息
- 刷新按钮
- 导出按钮
- 新增员工按钮
```

#### 2. 查询工具栏（Query Toolbar）

**企业级双行结构**

**第一行（Header Row）**
- 业务视图 Tabs（Line 风格）：全部员工 / 在职员工 / 试用期员工
- 右侧操作组：视图模式下拉菜单 + 列设置

**第二行（Query Row）**
- 结果摘要
- 搜索入口
- 筛选按钮
- 更多操作

**关键规范**
```css
- 两行之间保持 application-space-3 (12px) gap
- Line Tabs 使用文本 + 2px active underline
- 不使用 segmented / pill / boxed Toggle
```

#### 3. 记录列表（Record List）

**Result Surface 边界**
```jsx
- 外层 Card 透明无边框
- tableContainer 承担 Surface 职责
- radius: 16px
- padding: 12px
- 子区域 gap: 12px
```

**批量操作栏（Batch Action Bar）**
- 选中 > 0 时显示
- 显示选中数量
- 批量操作按钮组
- 清除选择按钮

**数据表格（DataTable）**
```jsx
列配置：
- 复选框列
- 工号
- 姓名
- 部门
- 岗位
- 状态（带徽章）
- 入职日期
- 联系电话
- 操作列（编辑/更多）
```

**表格交互**
- 行 Hover 高亮
- 选中行背景色
- 行点击打开详情 Drawer
- Checkbox/Button 不触发行点击

**分页（Pagination）**
- 显示当前范围和总数
- 上一页/下一页按钮
- 当前页码显示

#### 4. 详情抽屉（Detail Drawer）

**规格**
- 宽度：480px
- 位置：右侧
- 模态遮罩：rgba(0, 0, 0, 0.4)

**结构**
```jsx
- Header: 标题 + 关闭按钮
- Body: 详情内容（2列网格）
- Footer: 关闭 + 编辑按钮
```

**焦点恢复**
- 关闭后返回触发源

#### 5. 综合搜索对话框（Search Dialog）

**规格**
- 宽度：640px
- 圆角：20px
- 居中显示

**内容**
```jsx
- 关键词输入框（自动聚焦）
- 筛选字段（2列网格）
  - 部门选择
  - 状态选择
- 取消/应用按钮
```

### 状态处理

**选择状态**
- 全选/取消全选
- 单个记录选择
- 批量操作条件性显示

**Empty State**
- 无数据时显示空状态
- 明确引导文案

**Loading State**
- 可添加 Skeleton 占位

---

## 集成指南

### 1. 安装依赖

```bash
npm install react react-dom
# 或
yarn add react react-dom
```

### 2. 引入组件

```jsx
import HRWorkbench from './HRWorkbench';
import HREmployeeLedger from './HREmployeeLedger';
import './HRWorkbench.css';
import './HREmployeeLedger.css';
```

### 3. 使用组件

```jsx
function App() {
  return (
    <div>
      {/* 工作台 */}
      <HRWorkbench />

      {/* 人员台账 */}
      <HREmployeeLedger />
    </div>
  );
}
```

### 4. 路由集成

```jsx
import { BrowserRouter, Routes, Route } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/workbench" element={<HRWorkbench />} />
        <Route path="/employees" element={<HREmployeeLedger />} />
      </Routes>
    </BrowserRouter>
  );
}
```

---

## 定制化指南

### 替换图表库

工作台页面的图表占位符可以替换为实际图表库：

**使用 ECharts**

```jsx
import * as echarts from 'echarts';
import { useEffect, useRef } from 'react';

function ChartComponent({ data }) {
  const chartRef = useRef(null);

  useEffect(() => {
    const chart = echarts.init(chartRef.current);
    chart.setOption({
      // ECharts 配置
    });
    return () => chart.dispose();
  }, [data]);

  return <div ref={chartRef} style={{ height: '240px' }} />;
}
```

### 连接后端 API

**工作台数据获取**

```jsx
import { useState, useEffect } from 'react';

const HRWorkbench = () => {
  const [metrics, setMetrics] = useState([]);
  const [pendingItems, setPendingItems] = useState([]);

  useEffect(() => {
    // 获取指标数据
    fetch('/api/hr/metrics')
      .then(res => res.json())
      .then(data => setMetrics(data));

    // 获取待办事项
    fetch('/api/hr/pending')
      .then(res => res.json())
      .then(data => setPendingItems(data));
  }, []);

  // ... 组件其余部分
};
```

**台账数据获取**

```jsx
const HREmployeeLedger = () => {
  const [employees, setEmployees] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchEmployees = async (businessView, page, filters) => {
    setLoading(true);
    const response = await fetch('/api/hr/employees', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ businessView, page, filters }),
    });
    const data = await response.json();
    setEmployees(data.items);
    setLoading(false);
  };

  // ... 组件其余部分
};
```

### 添加 Application Shell

当前生成的页面内容区域可以嵌入到完整的应用壳层中：

```jsx
function AppShell({ children }) {
  return (
    <div className="app-shell">
      {/* Application Bar - 56px */}
      <header className="application-bar">
        <div className="app-identity">
          <img src="/logo.png" alt="Logo" width="32" height="32" />
          <span className="app-name">人力资源系统</span>
        </div>
        <div className="app-actions">
          {/* Global Actions */}
          {/* Settings */}
          {/* Account Menu */}
        </div>
      </header>

      {/* Secondary Module Row - 48px */}
      <nav className="secondary-navigation">
        <div className="module-switcher">
          {/* Module Switcher */}
        </div>
        <div className="secondary-tabs">
          {/* Current Module Tabs */}
        </div>
      </nav>

      {/* Content Canvas */}
      <main className="content-canvas">
        {children}
      </main>
    </div>
  );
}
```

### 无障碍增强

**添加键盘导航**

```jsx
const handleKeyDown = (e, action) => {
  if (e.key === 'Enter' || e.key === ' ') {
    e.preventDefault();
    action();
  }
};

<div
  role="button"
  tabIndex={0}
  onKeyDown={(e) => handleKeyDown(e, handleClick)}
  onClick={handleClick}
>
  ...
</div>
```

**添加 ARIA 标签**

```jsx
<button
  aria-label="批准申请"
  aria-describedby="action-desc"
>
  ✓
</button>
<div id="action-desc" className="sr-only">
  批准此项申请
</div>
```

---

## 最佳实践

### 1. 状态管理

建议使用 Context API 或状态管理库：

```jsx
import { createContext, useContext, useState } from 'react';

const HRContext = createContext();

export const HRProvider = ({ children }) => {
  const [employees, setEmployees] = useState([]);
  const [filters, setFilters] = useState({});

  return (
    <HRContext.Provider value={{ employees, setEmployees, filters, setFilters }}>
      {children}
    </HRContext.Provider>
  );
};

export const useHR = () => useContext(HRContext);
```

### 2. 错误处理

```jsx
const [error, setError] = useState(null);

try {
  const data = await fetchData();
  setEmployees(data);
} catch (err) {
  setError('数据加载失败，请稍后重试');
  console.error(err);
}

{error && (
  <div className="error-message" role="alert">
    {error}
  </div>
)}
```

### 3. 性能优化

```jsx
import { memo, useMemo, useCallback } from 'react';

// 使用 memo 避免不必要的重渲染
const EmployeeRow = memo(({ employee, onSelect }) => {
  // ...
});

// 使用 useMemo 缓存计算结果
const filteredEmployees = useMemo(() => {
  return employees.filter(emp => matchesFilters(emp, filters));
}, [employees, filters]);

// 使用 useCallback 缓存回调函数
const handleSelect = useCallback((id) => {
  setSelectedRecords(prev => [...prev, id]);
}, []);
```

---

## 浏览器兼容性

- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+

**Polyfills 需求**
- 无特殊要求，使用标准 CSS 和 React

---

## 许可证

MIT License

---

## 支持

如有问题或需要帮助，请联系开发团队。
