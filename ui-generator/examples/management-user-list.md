# 示例：用户管理列表（MANAGEMENT）

## 页面信息

- **页面类型**: MANAGEMENT
- **页面模式**: LIST
- **业务场景**: 系统用户管理
- **参考截图**: `screenshots/page-types/management/user-list.png`

## 需求描述

创建一个系统用户管理页面，支持：
- 用户列表查看
- 角色筛选
- 状态筛选
- 批量启用/禁用
- 新增/编辑用户

## 五层模型

```
L1: MANAGEMENT (管理页面)
  └─ L2: LIST (列表模式)
      └─ L3: 无业务视图切换
      └─ L4: Data Control (数据控制)
          ├─ 搜索: 用户名、邮箱
          ├─ 筛选: 角色、状态、部门
          └─ 排序: 创建时间、最后登录
      └─ L5: Data Presentation (数据展示)
          └─ 表格视图
```

## 字段定义

| 字段 | 类型 | 说明 |
|------|------|------|
| 用户ID | String | 唯一标识 |
| 用户名 | String | 登录名 |
| 姓名 | String | 真实姓名 |
| 邮箱 | Email | 联系邮箱 |
| 角色 | Array | 用户角色列表 |
| 部门 | String | 所属部门 |
| 状态 | Enum | 启用/禁用 |
| 创建时间 | Date | 账户创建时间 |
| 最后登录 | Date | 最后登录时间 |

## 页面动作

### 页面级动作
- 新增用户
- 批量导入
- 导出列表

### 批量动作
- 批量启用
- 批量禁用
- 批量分配角色

### 记录级动作
- 查看详情
- 编辑
- 重置密码
- 启用/禁用
- 删除

## 生成要点

### 1. Query Toolbar 结构

```html
<div class="query-toolbar">
  <!-- 第一行：页面级动作 -->
  <div class="toolbar-row">
    <button class="primary-button">+ 新增用户</button>
    <button>批量导入</button>
    <button style="margin-left: auto;">导出</button>
  </div>
  
  <!-- 第二行：搜索和筛选 -->
  <div class="toolbar-row">
    <input type="text" class="search-input" placeholder="搜索用户名、邮箱...">
    <select class="filter-dropdown">
      <option>角色：全部</option>
      <option>管理员</option>
      <option>操作员</option>
      <option>查看者</option>
    </select>
    <select class="filter-dropdown">
      <option>状态：全部</option>
      <option>启用</option>
      <option>禁用</option>
    </select>
  </div>
</div>
```

### 2. 批量操作显示

选中记录时显示批量操作栏：

```html
<!-- 选中 3 条时显示 -->
<div class="batch-action-bar">
  <span>已选中 3 条</span>
  <button>批量启用</button>
  <button>批量禁用</button>
  <button>取消</button>
</div>
```

### 3. 状态标签

```html
<span class="status-badge status-active">启用</span>
<span class="status-badge status-inactive">禁用</span>
```

### 4. 角色标签

```html
<div class="role-tags">
  <span class="role-tag">管理员</span>
  <span class="role-tag">操作员</span>
</div>
```

## 关键样式

```css
/* 批量操作栏 */
.batch-action-bar {
  background: #e3f2fd;
  padding: 12px 16px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 16px;
}

/* 状态标签 */
.status-badge {
  padding: 4px 12px;
  border-radius: 12px;
  font-size: 12px;
  font-weight: 500;
}

.status-active {
  background: #e8f5e9;
  color: #2e7d32;
}

.status-inactive {
  background: #ffebee;
  color: #c62828;
}

/* 角色标签 */
.role-tag {
  display: inline-block;
  padding: 2px 8px;
  background: #f5f5f5;
  border-radius: 4px;
  font-size: 12px;
  margin-right: 4px;
}
```

## Empty State

当无数据时显示：

```html
<div class="empty-state">
  <div class="empty-icon">👤</div>
  <div class="empty-title">暂无用户</div>
  <div class="empty-description">点击"新增用户"创建第一个用户</div>
  <button class="primary-button">+ 新增用户</button>
</div>
```

## 权限控制

根据当前用户权限显示/隐藏操作：

```javascript
// 示例权限控制逻辑
const permissions = {
  canCreate: true,    // 可新增
  canEdit: true,      // 可编辑
  canDelete: false,   // 不可删除
  canExport: true     // 可导出
};

// 根据权限渲染按钮
if (permissions.canCreate) {
  renderButton('新增用户');
}
```

## 验收检查

- [ ] Query Toolbar 保持双层结构
- [ ] 批量操作在选中时正确显示
- [ ] 状态标签颜色符合规范
- [ ] 角色标签正确显示
- [ ] Empty State 友好提示
- [ ] 权限控制生效
- [ ] 表格可排序
- [ ] Pagination 正常工作
- [ ] Hover 状态正确
- [ ] 响应式布局适配

---

**参考**: MANAGEMENT 页面类型规范  
**校准**: project-calibration.md 中的列表页面实现
