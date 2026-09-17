---
name: ui-generator
description: 基于 Sunluo 的 design-md v2 规范与 SupervisionPlatform 项目校准事实生成、改造、审查 PC 端业务应用 UI。用于用户要求创建业务应用、工作台、管理页、台账、分析页、报表、详情页、HTML 原型、页面结构、页面变体，或要求“按现有平台风格”“尽量保持项目样式/交互”“按规范生成 UI”时。优先复用既有 Page Type、Page Mode、组件、状态与交互合同；禁止在 Skill 内嵌入项目实现代码或用常见后台经验补规范缺口。
---

# UI生成skill

## 目标

生成看起来像 SupervisionPlatform 新增业务模块、而不是另一套 AI 后台模板的页面。

保持两条边界：

- 设计规则由 `design-md` Normative Markdown 决定。
- 项目校准事实只用于提高还原度，不覆盖明确的 Normative 规则。

不要复制或运行 SupervisionPlatform 的 JSX、CSS、测试、组件源码。不要把项目源码当生成模板。生成实现代码属于输出，不属于本 Skill 的知识事实源。

## 资源与优先级

先阅读 `references/source-map.md`、`references/conflicts-and-precedence.md` 和 `references/core-normative-baseline.md`。生成当前 SupervisionPlatform 应用壳层时还必须阅读 `references/navigation-action-panels.md`。

生成所需资料按以下优先级裁决：

1. 用户当前明确要求与业务事实，但不得违反不可兼容的正式规范。
2. `design-md` 的 `GENERATIVE-SPEC.md`。
3. 当前事实的 Normative Owner 文档：Foundation Token、Shell、Page Type、Page Mode、Component、Common Contract。
4. `references/project-calibration.md` 中已确认的 SupervisionPlatform 项目事实。
5. `references/component-routing.md` 与 `references/page-type-routing.md` 的路由提示。
6. 仍无法确定时登记 Spec Gap，不猜。

Project Calibration 只能补充：空间比例、密度、已落地组件组合、Hover/Focus/Disabled、当前项目交互习惯、视觉节奏等未与 Normative 冲突的事实。

## 当前 SupervisionPlatform 生成硬约束

当用户要求“当前平台风格”“规范展示应用风格”或目标明确是 SupervisionPlatform 现行业务应用，且没有明确指定 Standard / Pro / Max 等其它 Shell 时，先执行以下项目校准合同；这些规则只负责选择和装配已存在的 Shell / Component 能力，不创造新的 Normative Owner。

### Application Shell

- 默认采用当前项目的 Basic Business Application Shell：Application Bar 56px + Secondary Module Row 48px。
- 不额外生成独立的黑色/深色品牌顶栏、环境条、角色条或 52px Top User Bar，也不为它们保留占位。
- Application Bar 左侧放应用身份（Logo + 应用名），右侧承载应用级动作、设置与账户/应用动作。不要另造一条“监管平台 / 演示环境 / 当前角色”栏。
- Application Bar 右侧不是可选装饰区：先读取 `references/navigation-action-panels.md`，按当前应用真实配置保留 Global Actions / Settings / Application Switcher / Account 等能力，并实现各自点击后的 Popover / Dropdown / Drawer 结构；禁止生成只有图标没有行为的假入口。
- 不用通用后台习惯臆造 `?`、铃铛、用户、更多等右侧图标；每个 Trigger 必须映射到项目已有能力或用户明确需求。没有 Owner/配置时省略或登记 Spec Gap。
- 如果业务上下文明示 Standard / Pro / Max 或平台级导航，按对应 Shell Owner 执行，不强行套 Basic。

### 导航层级

- 多模块应用必须保留 Module Switcher；模块组不能被扁平化成 Secondary Tabs。
- Module Switcher 负责切换当前业务模块/页面类型组；Secondary Tabs 只展示当前选中模块自己的 tabs。
- 当前模块存在可编辑的二级导航项时，保留右侧 Secondary Navigation Settings 入口；当前项目语义是打开右侧 Drawer，支持显示/隐藏与拖拽排序，且不能隐藏最后一个可见项。
- Secondary Tabs 使用“左侧图标 + 标签 + active underline”的当前项目语言，不用独立的大块导航卡。

### 控件语义映射

- LEDGER 的 `businessView` 使用 line Tabs；不要用 segmented / pill / boxed Toggle 代替。
- 普通 LIST / CARD / BOARD / CALENDAR 的 `pageMode` 使用当前项目 Query Action Group 中的 View Mode Dropdown；不要把所有模式平铺成 segmented buttons。
- SPLIT 的 `pageMode` 仍使用同一类 Dropdown，但放在左侧 Locator Search-Control Row。
- SPLIT 右侧 `dataPresentation` 是独立 View Mode Dropdown；不得与根 `pageMode` 合并。
- Presentation Settings 是独立 Settings Dropdown；不得与 Business View / Page Mode / Data Presentation 合并成一组。
- Enterprise Query Toolbar 保持双层节奏：Tabs/右侧动作一层，Summary/Search/Filters/Body Actions 一层；两层之间保持项目 `application-space-3` 级别的 block gap，不把 active underline 直接贴到搜索控件。
- LIST 结果使用项目 Record List 的 `tableContainer` Surface：16px radius、Surface 背景、12px 级 padding/gap；Toolbar、Table、Pagination 属于同一结果 Surface。不要让裸表格直接贴 Canvas，也不要额外发明重边框/大阴影卡片。
- 只有对应 Normative Owner 明确要求 segmented/toggle 时才使用该形态。

## 标准工作流

### 1. 判断任务类型

将请求归入以下一种或多种：

- 新建整个业务应用；
- 新建单个业务页面；
- 根据 PRD/文字需求生成页面；
- 按现有项目风格重做/改造页面；
- 根据截图还原并规范化页面；
- 审查现有 UI 是否符合规范；
- 生成 HTML / React / Vue / 原型说明。

若用户只要求方案或审查，不提前生成实现。

### 2. 收集已有上下文

优先复用用户已经提供的页面目的、字段、角色、权限、页面模式、业务视图、搜索筛选、动作、状态和输出格式；不要重复询问。

若关键业务信息仍缺失，按 `design-md` 的 Page Generation Intake 询问。只询问会 materially 改变结构、权限、数据口径或关键交互的问题。

默认输出格式为独立 HTML，除非用户明确指定其它格式。

### 3. 确定五层模型

使用：

- L1 `pageType`
- L2 `pageMode`
- L3 `businessView`
- L4 `dataControl`
- L5 `dataPresentation`

Page Type 固定集合：WORKBENCH / MANAGEMENT / LEDGER / ANALYSIS / REPORT / DETAIL。

Page Mode 固定集合：LIST / CARD / SPLIT / BOARD / CALENDAR。

DETAIL 不是 Page Mode。COMPOSITE 是特殊结构资产，不是 Page Mode。不要恢复 `pageLayout` 作为 L2。

### 4. 读取正确的 Normative Owner

按 `references/page-type-routing.md` 读取当前 Page Type。

按实际 Page Mode 读取对应布局文档。WORKBENCH 或综合分析/报表确实需要多 Region 时，可读取 COMPOSITE 特殊结构资产。

按 `references/component-routing.md` 只读取真正需要的组件 Owner，不为简单页面加载全部组件。

优先使用 `references/core-normative-baseline.md` 完成高频生成；如果环境提供 GitHub connector，遇到低频组件、精确 Owner 细节或基线摘要无法唯一回答的问题时，再按 `references/source-map.md` 中固定的仓库、分支与路径读取原始 Markdown。不要读取 SupervisionPlatform 源码来补设计规则。

### 5. 做冲突与 Spec Gap 检查

在生成前执行 `references/conflicts-and-precedence.md`。

遇到以下情况不要自由设计：

- 两份 Normative 文档对同一事实互相冲突；
- 关键尺寸、状态、Icon、交互没有 Owner；
- 用户要求未登记的新 Page Mode / 新组件行为；
- 只有项目代码实现、规范没有记录；
- 必须依赖第三方 UI 框架默认样式才能完成。

已登记的基线冲突按冲突表裁决，同时在生成说明里记录 drift；不要把冲突悄悄藏进页面代码。

### 6. 应用项目校准层

在 Normative 结构已经确定后，再读取 `references/project-calibration.md`。

优先复用：

- 项目已有的 Shell 节奏；
- QueryToolbar / PageHeader / Tabs / Search / Button / Drawer 等组合；
- 已验证的 WORKBENCH、LEDGER 页面骨架；
- 已验证的 Empty、Single Record、Selection、Drawer、View Mode、Settings 状态；
- 已落地的 Hover / Focus / Disabled / Motion 细节。

如果项目校准事实与 Normative 明确冲突，以 Normative 为准，并标记“项目实现待回写规范或规范待校准”。

### 7. 先形成页面合同，再生成实现

生成代码前先在内部确认：

- 页面任务与成功标准；
- Shell Variant，以及是否属于当前项目 Basic Business Application Shell；
- 应用导航层级：Application Bar → Module Switcher / 当前模块 → 当前模块 Tabs → Secondary Navigation Settings；
- Application Bar 右侧动作合同：每个 Trigger 的 capability、可见条件、Overlay 类型（Popover / Dropdown / Drawer / Route）、展开结构、互斥关系、关闭方式和焦点恢复；
- Page Type / Page Mode 或特殊结构资产；
- 角色与权限；
- 页面结构与 Scroll Owner；
- Business View / Data Control / Data Presentation，以及各自应使用的控件形态；
- 页面级 / 批量 / 记录级动作；
- 默认、Hover、Focus、Selected、Disabled、Loading、Empty、Error、No Permission、Success 等状态；
- Overlay 与来源恢复；
- 关键组件 Owner；
- 响应式与 200% zoom 行为。

用户只要求页面成品时，不必把整个内部合同逐条展示，但必须据此生成。

### 8. 生成

生成结果遵循以下复用顺序：

1. 已有项目结构的校准事实；
2. 已有项目组件对应的正式 Normative Owner；
3. 已登记 Page Type / Page Mode；
4. 已登记组件组合；
5. 仅在规范允许范围内组合现有能力；
6. Spec Gap。

禁止为了“更漂亮”重新设计已有控件。禁止把业务变化误当成需要新 UI 风格。

### 9. 验收

完成后执行 `references/acceptance-gate.md`。

至少检查：

- 是否像同一产品；
- 当前项目 Basic 目标是否误加了独立 Top User / 品牌 / 环境 / 角色顶栏；
- 多模块应用是否保留 Module Switcher，且没有把模块组扁平化成 Tabs；
- 可编辑二级导航是否保留右侧 Settings / Edit 入口；
- Application Bar 配置的右侧 Global Actions / Settings / Account / Application Switcher 是否完整，且点击后展开正确的项目面板结构；
- 是否存在只有图标没有真实展开/路由行为的一级导航右侧入口；
- 五层模型是否正确；
- LEDGER Business View 是否使用 line Tabs；Page Mode / View Mode 是否按当前项目使用 Dropdown；
- Enterprise Query Toolbar 的 Tabs 行与 Search/Filter 行是否保持独立层级和稳定 block gap；
- LIST 的 Toolbar / Table / Pagination 是否被同一 Record List Surface 包含，并保留 Surface padding/radius；
- Page Mode / SPLIT View Mode / Presentation Settings 是否没有混用；
- 组件 Geometry 是否来自 Owner；
- 权限、空态、加载、错误、禁用是否可区分；
- 可交互控件是否有真实反馈；
- 1024×576 与 200% zoom 是否可完成核心任务；
- 是否引入了未登记的第二套按钮、搜索、Tabs、Card、Drawer 风格。

## 整个应用生成

当用户要求“生成一个应用”而不是单页时：

1. 先建立应用任务、主要角色和业务模块清单。
2. 先确定 Shell Variant；当前 SupervisionPlatform 风格的普通桌面业务应用默认走项目校准 Basic Shell，除非上下文明确要求其它 Shell。
3. 建立导航树：Application Bar → Module Groups / Module Switcher → 当前模块 Tabs → 可选 Secondary Navigation Settings；同时建立 Application Bar Right Actions Map，逐项确定 Trigger → Panel/Drawer/Dropdown/Route。
4. 为每个业务入口确定 Page Type；不要把不同 Module Group / Page Type 直接扁平化成同一行 Tabs。
5. 每个业务 Tab 只代表当前模块内的业务页面入口，不把 Page Mode 当二级导航。
6. 为每个页面分别执行 Intake、规范读取、校准与验收。
7. 跨页面保持同一 Shell、Token、组件和权限语言。

## 页面改造与截图还原

当用户提供现有页面或截图：

- 保留业务信息与任务，不机械保留错误结构。
- 先识别它对应的 Page Type / Page Mode。
- 将现有元素映射到正式 Component Owner。
- 对与规范一致的项目细节尽量保留。
- 对违反规范的旧实现按 Normative 修正，并说明关键变化。
- 截图只作为视觉校准证据，不从单张截图推断未展示的权限、交互或精确数值。
- 用户对截图的红线/批注属于明确纠错证据：被标为“多余/错误”的结构不得继续当 Visual Golden Sample；应回查 Normative 与 Project Calibration 后修正生成规则。

## 输出要求

默认成品应可直接用于视觉与交互验证，而不是只交付抽象描述。

当输出 HTML / React / Vue：

- 可以生成实现代码，但不得从项目仓库复制代码；
- 实现必须从 Normative Markdown 的 Token、Geometry、State、Interaction 转译；
- 不使用第三方框架的默认视觉补缺；
- 用户未指定技术栈时，默认独立 HTML；
- Mock 数据必须标识为本次验证数据，不升级为规范事实。

当用户要求审查：输出“符合 / 偏差 / Spec Gap / 建议处理”，并给出对应 Owner 路径。

## 视觉参考

读取 `references/visual-reference-index.md`。

第一版没有伪造或占位截图。若用户提供真实项目截图，优先把它作为本次 Visual Golden Sample 使用；截图与 Normative 冲突时 Normative 优先。
