# Application Structure Intake

> 应用结构前置询问规范 - 用于收集多模块业务应用的导航结构信息

## 目的

在生成多模块业务应用之前，必须先明确应用的导航结构，以确保生成的应用符合 SupervisionPlatform 的 Basic Business Application Shell 规范。

## 何时触发

当用户请求满足以下任一条件时，必须执行应用结构前置询问：

- ✅ 用户要求"生成一个应用"
- ✅ 用户要求"创建XX系统"
- ✅ 用户提到多个业务模块或页面类型
- ✅ 用户要求生成完整的业务应用框架
- ✅ 上下文中缺少应用名称、模块列表或模块 Tabs

**不触发的情况：**

- ❌ 用户只要求生成单个页面
- ❌ 用户已经明确提供了完整的应用结构
- ❌ 用户要求改造或审查现有页面

## 必需信息

### 1. 应用名称 (applicationName)

**定义：** 整个业务应用的中文名称，显示在 Application Bar 左侧的应用身份区域。

**示例：**
- ✅ "人力资源系统"
- ✅ "资产管理平台"
- ✅ "监管执法系统"
- ❌ "HR" (过于简略)
- ❌ "一个系统" (不明确)

**规则：**
- 长度建议 4-8 个中文字符
- 应该清晰表达业务领域
- 避免使用缩写或英文（除非是通用术语）

### 2. 模块列表 (modules)

**定义：** 应用包含的顶层业务模块，每个模块对应 Module Switcher 中的一个入口。

**结构：**
```typescript
interface Module {
  name: string;        // 模块名称（必需）
  icon?: string;       // 图标标识（可选）
  tabs: string[];      // 该模块的二级导航 Tabs（必需，至少1个）
}
```

**示例：**
```javascript
modules: [
  {
    name: "工作台",
    icon: "dashboard",
    tabs: ["首页", "数据看板"]
  },
  {
    name: "人员管理",
    icon: "users",
    tabs: ["员工台账", "部门架构", "岗位管理"]
  }
]
```

**规则：**
- 至少包含 1 个模块
- 单模块应用可以省略 Module Switcher，但仍需定义模块结构
- 模块名称应该是业务领域的自然分组（如"人员管理"、"财务管理"）
- 每个模块必须至少有 1 个 Tab

### 3. 模块 Tabs (tabs)

**定义：** 每个模块下的二级导航 Tabs，显示在 Secondary Module Row 的 Secondary Navigation 区域。

**规则：**
- 每个模块至少 1 个 Tab
- Tab 名称应该对应具体的页面或功能
- 使用左侧 icon + label + active underline 的 line 风格
- 不要与其他模块的 Tabs 混用

**常见 Tab 类型映射到 Page Type：**

| Tab 名称示例 | 推荐 Page Type |
|------------|---------------|
| 首页、工作台、数据看板 | WORKBENCH |
| XX台账、XX记录、XX档案 | LEDGER |
| XX管理、XX配置、XX设置 | MANAGEMENT |
| 数据分析、趋势分析 | ANALYSIS |
| 统计报表、月度报表 | REPORT |
| XX详情、详细信息 | DETAIL (通常不作为独立 Tab) |

## 询问模板

### 模板 1: 完整询问

当用户完全未提供应用结构时：

```
为了生成符合 SupervisionPlatform 风格的应用，我需要了解应用的导航结构：

1. **应用名称**是什么？
   （例如：人力资源系统、资产管理平台）

2. **应用包含哪些业务模块**？
   （这些模块会出现在模块切换器中）

3. **每个模块下有哪些页面/功能**？
   （这些会成为二级导航 Tabs）

示例结构：
- 应用名称：人力资源系统
- 模块1：工作台
  - Tabs: 首页、数据看板
- 模块2：人员管理
  - Tabs: 员工台账、部门架构、岗位管理
- 模块3：考勤管理
  - Tabs: 考勤记录、排班管理、请假审批
```

### 模板 2: 部分询问

当用户已提供部分信息时，只询问缺失的部分：

```
我注意到您提到了 [已提供的模块]，为了完整生成应用，我还需要确认：

1. 应用的完整名称是？
2. 除了 [已提到的模块]，还有其他模块吗？
3. [某模块] 下具体有哪些页面/功能？
```

### 模板 3: 确认询问

当用户提供的结构需要确认或澄清时：

```
根据您的描述，我理解的应用结构是：

应用名称：[推断的名称]
模块结构：
- [模块1]: [Tab1, Tab2, ...]
- [模块2]: [Tab1, Tab2, ...]

这样理解对吗？如果需要调整，请告诉我。
```

## 验证规则

收集到信息后，必须验证以下规则：

### 1. 应用名称验证
```javascript
function validateApplicationName(name) {
  if (!name || name.trim().length === 0) {
    return "应用名称不能为空";
  }
  if (name.length < 2 || name.length > 20) {
    return "应用名称长度应在 2-20 个字符之间";
  }
  return null; // 验证通过
}
```

### 2. 模块结构验证
```javascript
function validateModules(modules) {
  if (!Array.isArray(modules) || modules.length === 0) {
    return "至少需要一个业务模块";
  }
  
  for (const module of modules) {
    if (!module.name) {
      return `模块缺少名称`;
    }
    if (!Array.isArray(module.tabs) || module.tabs.length === 0) {
      return `模块"${module.name}"至少需要一个 Tab`;
    }
  }
  
  return null; // 验证通过
}
```

### 3. 导航层级验证

- ✅ 多模块（>1）必须生成 Module Switcher
- ✅ 单模块可以省略 Module Switcher，直接显示该模块的 Tabs
- ✅ 每个模块的 Tabs 只在该模块被选中时显示
- ❌ 不能将所有模块的 Tabs 扁平化到一级导航

## 数据结构规范

### 完整的应用结构数据格式

```typescript
interface ApplicationStructure {
  applicationName: string;           // 应用名称
  modules: Module[];                 // 模块列表
  globalActions?: GlobalAction[];    // 可选：应用全局动作
  settings?: ApplicationSettings;    // 可选：应用设置
}

interface Module {
  name: string;                      // 模块名称
  icon?: string;                     // 图标标识
  tabs: Tab[];                       // 二级导航 Tabs
  description?: string;              // 模块描述
}

interface Tab {
  name: string;                      // Tab 名称
  pageType?: PageType;               // 推荐的页面类型
  pageMode?: PageMode;               // 推荐的页面模式
  route?: string;                    // 路由路径
}

type PageType = 'WORKBENCH' | 'MANAGEMENT' | 'LEDGER' | 
                'ANALYSIS' | 'REPORT' | 'DETAIL';

type PageMode = 'LIST' | 'CARD' | 'SPLIT' | 'BOARD' | 'CALENDAR';

interface GlobalAction {
  type: 'messages' | 'todo' | 'dashboard' | 'riskWarning' | 
        'config' | 'versionUpdate';
  label: string;
  enabled: boolean;
}

interface ApplicationSettings {
  hasSettings: boolean;              // 是否有应用设置
  hasApplicationSwitcher: boolean;   // 是否有应用切换器
  hasAccountMenu: boolean;           // 是否有账户菜单
}
```

### 示例数据

```javascript
{
  applicationName: "人力资源系统",
  modules: [
    {
      name: "工作台",
      icon: "dashboard",
      tabs: [
        { name: "首页", pageType: "WORKBENCH" },
        { name: "数据看板", pageType: "WORKBENCH" }
      ]
    },
    {
      name: "人员管理",
      icon: "users",
      tabs: [
        { name: "员工台账", pageType: "LEDGER", pageMode: "LIST" },
        { name: "部门架构", pageType: "MANAGEMENT", pageMode: "SPLIT" },
        { name: "岗位管理", pageType: "MANAGEMENT", pageMode: "LIST" }
      ]
    },
    {
      name: "考勤管理",
      icon: "calendar",
      tabs: [
        { name: "考勤记录", pageType: "LEDGER", pageMode: "CALENDAR" },
        { name: "排班管理", pageType: "MANAGEMENT", pageMode: "BOARD" },
        { name: "请假审批", pageType: "MANAGEMENT", pageMode: "LIST" }
      ]
    }
  ],
  globalActions: [
    { type: "messages", label: "消息", enabled: true },
    { type: "todo", label: "待办", enabled: true }
  ],
  settings: {
    hasSettings: true,
    hasApplicationSwitcher: false,
    hasAccountMenu: true
  }
}
```

## 生成流程

收集完应用结构信息后，按以下顺序生成：

### 1. 生成 Application Shell
```
- Application Bar (56px)
  - 左侧：Logo + 应用名称
  - 右侧：Global Actions + Settings + Account Menu
  
- Secondary Module Row (48px)
  - 左侧：Module Switcher（多模块时）
  - 中间：Secondary Tabs（当前模块的 Tabs）
  - 右侧：Secondary Navigation Settings（如果支持编辑）
```

### 2. 生成每个 Tab 的页面内容
```
for each module in modules:
  for each tab in module.tabs:
    - 确定 Page Type（根据 Tab 名称推断或询问）
    - 确定 Page Mode（根据业务需求）
    - 读取对应的 Normative Owner
    - 生成页面实现
```

### 3. 生成导航配置
```javascript
// 导航配置示例
const navigationConfig = {
  currentModule: 0,           // 当前选中的模块索引
  currentTab: 0,              // 当前选中的 Tab 索引
  moduleGroups: modules,      // 模块组
  onModuleChange: (index) => {
    // 切换模块，显示对应的 Tabs
  },
  onTabChange: (index) => {
    // 切换 Tab，加载对应页面
  }
};
```

## 常见场景

### 场景 1: 用户明确提供完整结构

**用户输入：**
```
生成人力资源系统，包含工作台（首页、数据看板）、
人员管理（员工台账、部门架构）、考勤管理（考勤记录、排班管理）
```

**处理：**
- ✅ 直接解析结构
- ✅ 确认应用名称："人力资源系统"
- ✅ 开始生成

### 场景 2: 用户只提供应用名称

**用户输入：**
```
生成一个资产管理平台
```

**处理：**
- ❌ 结构不完整
- ✅ 询问模块列表和 Tabs
- ✅ 等待用户补充

### 场景 3: 用户提供模块但没有 Tabs

**用户输入：**
```
生成监管系统，包含工作台、案件管理、执法管理三个模块
```

**处理：**
- ✅ 应用名称明确
- ✅ 模块列表明确
- ❌ 缺少每个模块的 Tabs
- ✅ 询问每个模块的具体页面

### 场景 4: 用户只要求生成单个页面

**用户输入：**
```
生成一个员工台账页面
```

**处理：**
- ❌ 不触发应用结构询问
- ✅ 直接按单页生成流程处理
- ✅ 如果需要嵌入 Shell，可以询问是否需要完整应用框架

## 最佳实践

### 1. 渐进式询问

不要一次性抛出所有问题，根据用户的回答逐步询问：

```
步骤1: 确认应用名称
步骤2: 询问有哪些模块
步骤3: 逐个询问每个模块的 Tabs
步骤4: 确认整体结构
```

### 2. 智能推断

根据常见业务场景，提供合理的默认建议：

```
用户说："生成人力资源系统"

智能推断：
- 可能包含：工作台、人员管理、考勤管理、薪资管理、绩效管理
- 向用户确认："我建议包含以下模块，您看是否合适？"
```

### 3. 提供示例

在询问时提供具体示例，降低用户理解成本：

```
❌ "请告诉我应用结构"
✅ "应用包含哪些模块？例如：工作台、人员管理、考勤管理"
```

### 4. 验证合理性

收集到信息后，检查是否符合实际业务逻辑：

```
- 工作台模块通常包含：首页、数据看板、待办事项
- 管理类模块通常包含：XX台账、XX设置、XX审批
- 避免：一个模块下有 20 个 Tabs（过多，应该拆分）
```

## Spec Gap 登记

如果遇到以下情况，需要登记 Spec Gap：

- 用户要求的模块/Tab 结构超出 Basic Shell 的支持范围
- 用户要求特殊的导航层级（如三级、四级导航）
- 用户要求的交互模式与 SupervisionPlatform 项目校准冲突
- 无法确定某个 Tab 应该对应哪个 Page Type

登记格式：
```
Spec Gap: [问题描述]
用户需求: [具体需求]
当前约束: [规范限制]
建议方案: [替代方案]
```

## 参考

- `core-normative-baseline.md` - Shell 基础规范
- `project-calibration.md` - 当前项目校准事实
- `navigation-action-panels.md` - Application Bar 右侧动作
- `page-type-routing.md` - Page Type 路由表
