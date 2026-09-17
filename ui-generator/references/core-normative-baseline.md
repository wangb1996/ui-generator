# Core Normative Baseline v1

> 这是第一版 Skill 的离线核心规则快照，用于 GitHub connector 不可用时维持主要生成能力。它不是新的 Normative Owner；若可访问 `design-md` 冻结基线，应以 `source-map.md` 指向的原始 Owner 文档为准，并继续执行 `conflicts-and-precedence.md`。

## 1. 生成模型

正式五层模型：

- L1 Page Type：WORKBENCH / MANAGEMENT / LEDGER / ANALYSIS / REPORT / DETAIL。
- L2 Page Mode：LIST / CARD / SPLIT / BOARD / CALENDAR。
- L3 Business View：稳定复合业务口径。
- L4 Data Control：Search / Filter / Sort / Pagination 等数据定位能力。
- L5 Data Presentation：DataTable / CardList / KanbanBoard / Calendar / Chart / Timeline 等呈现形态。

DETAIL 是 Page Type，不是 Page Mode。COMPOSITE 是特殊结构资产，不是 Page Mode。不要把 `pageLayout` 恢复为 L2。

## 2. Foundation Token

唯一 Owner：`01-设计Token.md`。

### Typography

- 默认字体：PingFang SC, PingFang TC, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif。
- Font size：10 / 12 / 14 / 16 / 20 / 24px。
- Line height：12 / 16 / 20 / 24 / 28 / 32px。
- Weight：400 / 500 / 600 / 700 / 800。

### Spacing

- space.0 = 0px
- space.1 = 4px
- space.2 = 8px
- space.3 = 12px
- space.4 = 16px
- space.5 = 24px

### Radius

- radius.0 = 0px
- radius.4 = 4px
- radius.8 = 8px
- radius.12 = 12px
- radius.16 = 16px
- radius.20 = 20px

### Color Primitive

- neutral bg.1 = #FFFFFF
- neutral bg.2 = #FAFAF9
- neutral bg.3 = #F5F4F1
- neutral bg.4 = #EAE9E5
- neutral bg.5 = #DDDBD5
- neutral bg.6 = #B5A86D
- neutral fg.1 = #757169
- neutral fg.2 = #6E6C64
- neutral fg.3 = #4D4B45
- neutral fg.4 = #1F1E1A
- primary = #0071E3
- info = #0071E3
- success = #0D8F50
- warning = #E68A00
- danger = #D93025

其它文档出现旧 ID、旧 resolved value 时不能覆盖本节。

## 3. Shell

### Standard Shell

- Top User Bar：52px。
- Application Primary Navigation：56px。
- Application Secondary Navigation：48px。
- 总导航高度：156px。

### Basic Shell

- Primary Navigation：56px。
- Secondary Navigation：48px。
- 不渲染 Top User Bar，也不留 52px 占位。

### 当前项目 Shell 选择校准

本小节是 Project Calibration，不新增 Normative Owner：

- 当目标明确为当前 SupervisionPlatform 普通桌面业务应用、且用户未指定其它 Shell 时，默认选 Basic Shell。
- 当前项目将 Basic 的 56px Primary 具体实现为 Application Bar，将 48px Secondary 具体实现为 Secondary Module Row；账户/应用动作并入 Application Bar 右侧。
- 因此不得额外再造黑色/深色的品牌、环境、角色、Top User 横条，也不得为其保留 52px 空白。
- 多模块应用的 48px Secondary Row 必须先有 Module Switcher，再显示当前模块 Tabs；模块组不得直接扁平化为 Tabs。
- 有二级导航设置能力时，编辑入口位于 Secondary Row 右侧。
- Application Bar 右侧按应用配置保留 Global Actions / Settings / Account / Application Switcher；其展开结构读取 `navigation-action-panels.md`。不得只画 icon 不实现 Panel/Drawer/Dropdown/Route。
- 如果业务上下文明示 Standard / Pro / Max，则回到对应 Shell Owner，不使用本默认选择。

### 核心几何

- Primary Application Logo：32 × 32px。
- Primary Title：16 / 24px，bold。
- Secondary Business Tab：32px 高，16px icon + visible label，icon/label gap 4px，inline padding 12px，tab group gap 8px，active indicator 2px bottom line。
- Content Canvas：Standard padding/gap 12px；Compact 8px。
- Shell 不承载 Search、Filter、Business View、记录动作。Application Bar 右侧只承载应用全局能力和账户/应用壳层动作。

## 4. Page Mode Switch 第一版裁决

当前 v2 文档存在明显版本漂移。第一版统一执行：

- LIST / CARD / BOARD / CALENDAR：Page Mode Switch 放在与当前数据展示最接近的 Data Control / Surface Toolbar 右侧。
- SPLIT：Page Mode Switch 放在左侧 Locator 的 Search-Control Row 右侧。
- Page Header 不承载 Page Mode Switch。
- SPLIT Right View Mode 只改变右侧 Data Presentation，不改变根 pageMode。
- 同一页面最多一组 Page Mode Switch；只有一种 Page Mode 时不渲染、不占位。

具体证据与冲突范围见 `conflicts-and-precedence.md`。

### 当前项目控件形态校准

以下只规定当前 SupervisionPlatform 的已落地控件映射，不改变五层模型：

- LEDGER `businessView`：line Tabs。
- 普通 `pageMode`：Query Toolbar 右侧的 View Mode Dropdown。
- SPLIT `pageMode`：左侧 Search-Control Row 的同类 Dropdown。
- SPLIT 右侧 `dataPresentation`：独立 View Mode Dropdown。
- Presentation Settings：独立 Settings Dropdown。
- Business View、Page Mode、Data Presentation、Settings 不合并为一个 segmented control。

## 5. LIST

用途：高密度查询、核对、排序、分页、批量处理。

标准组成：Context → optional Metrics → List Surface → Query/Data Control → optional Batch Action → DataTable/Structured List → optional Pagination。

核心规则：

- Query 主顺序：Result Summary → Search → Sort / Common Filters / More。
- 当前项目 enterprise Query Toolbar 为双行：Tabs/Actions Header Row + Query Body Row；两行之间保持 `application-space-3` 级别 gap。
- 当前项目 ApplicationRecordList 的 Toolbar / Table / Pagination 统一置于 `tableContainer` Result Surface；Surface 使用 radius 16、约 12px padding/gap、Surface 背景。外层 Card 本身可透明无边框。
- DataTable 存在列配置能力时显示“列设置”；没有能力不显示占位。
- Table 自己承担横向滚动，Canvas 不横向滚动。
- Checkbox 只在真实支持 Selection 时出现。
- Batch Action 只在 selection > 0 时出现。
- Pagination 出现时必须真实分页。
- 行级 Button / Checkbox / More 不得误触发行详情。
- 详情返回恢复兼容的 Business View / Query / Pagination / Scroll / 来源状态。

## 6. CARD

用途：对象摘要、状态概览、视觉识别、对象级快捷操作。

核心规则：

- Card radius = 16px。
- 推荐 Card min-width = 220px。
- Standard grid gap 12px，Compact 8px。
- Standard card padding 16px，Compact 12px。
- 空间不足时减少列数，不缩小卡片到不可读。
- 有真实配置时显示“卡片设置”，否则不显示。
- Card 整体点击与内部 Button / More / Checkbox 作用域分离。

## 7. SPLIT

用途：左侧稳定定位，右侧持续查看/处理。

第一版标准结构：

- Context / Page Actions 保持页面上下文。
- Left Sidebar：可选 Title/Header、Directory Search、Page Mode Switch（多模式时）、Locator/Directory、Directory Settings。
- Right Content：可选 Business View/Query、View Mode、Presentation Settings、Data Display / Work Surface。

核心几何：

- Standard / Condensed Sidebar：360px。
- Compact Sidebar：300px。
- Right Content 必须允许自身收缩，不能被表格/图表撑开整页。
- 正式支持宽度内优先保持左右结构；低于正式最低宽度才允许安全单列兜底。

状态边界：

- Locator Search 只过滤左侧目录。
- Page Mode Switch 改 pageMode。
- Right View Mode 改右侧 dataPresentation，pageMode 仍是 SPLIT。
- Presentation Settings 只改当前 Presentation 的显示细节。
- 无 Tabs / View Mode / Settings 时对应行、Divider、gap 都不留占位。
- activeRecord 可以为空；对象失效时清空并显示明确引导。

常见结构变体：category-list / locator-presentation / master-detail / master-summary / master-chart / master-timeline / workspace。

## 8. BOARD

用途：按稳定状态、阶段、责任域或流程节点组织横向泳道。

核心规则：

- `kanban`：状态/阶段泳道。
- `responsibility-board`：责任域/团队泳道。
- Lane min-width = 220px；不为塞入视口继续压窄，Board Surface 横向滚动。
- 标准 gap 12px，Compact 8px。
- 拖拽跨泳道只有在真实支持状态迁移时启用，不能绕过权限、确认、必填字段。
- 有真实配置时显示“看板设置”。
- 泳道是内容组织，不等于 Filter。

## 9. CALENDAR

用途：以时间作为主要定位维度的日程、排班、预约、巡检、会议、任务。

核心规则：

- Month / Week / Day 等是 Calendar Presentation 状态，不是 Page Mode 或默认 Business View。
- 有真实设置能力时显示“日历设置”；否则不显示。
- Previous / Today / Next / Current Range 与粒度切换属于日历内部控制。
- 点击 Event 打开 Detail Overlay 不改变 pageMode。
- 事件拖动/改期只在业务真实支持时启用。
- Calendar Surface 自己承担必要局部滚动。

## 10. COMPOSITE

COMPOSITE 是特殊结构资产，常用于 WORKBENCH / ANALYSIS / REPORT。

结构变体：

- dashboard：Data Control / Metrics / Charts。
- task-hub：Pending / Tasks / Quick Actions。
- hybrid：Metrics / Analysis / Pending / Actions。
- navigation：Primary / Recent / Secondary Entrances。

核心规则：

- Region gap Standard 12px / Compact 8px。
- Surface padding Standard 16px / Compact 12px。
- 常见分析/工作 Region 可双栏；任务/入口卡按不低于约 220px 的可读宽度重排。
- 每个 Region 必须有业务目的，不为了“丰富”堆 Surface。
- 只能有一个 Canvas 主纵向 Scroll Owner。

## 11. Page Type

### WORKBENCH

用途：当前状态、优先事项、快捷动作、关键分析。

默认优先 COMPOSITE / hybrid，典型 Region：Context/Meta → Core Metrics → Pending Work + Quick Actions → Analysis。

- Metrics 推荐 4–6 个，最多强化 1–2 个并放最左。
- Pending 首页约 4 条，最右固定 Row Action；Empty / single-record 不改变骨架。
- Quick Actions 只承载真实高频入口和明确权限。
- Analysis 每行 1 / 2 / 3 列，同行等高；图表 Local Type 只影响当前图。
- default / empty / single-record 是状态维度，不是 Page Mode。

### MANAGEMENT

用途：数据管理、业务办理、配置、状态变更、批量处理。

默认 LIST，可按真实工作方式开放 CARD / SPLIT / BOARD / CALENDAR。

必须区分 Page Action / Batch Action / Record Action；用户需要对对象执行受控改变。

### LEDGER

用途：持续查询、核对、穿透、追溯、异常识别。

默认 LIST + DataTable。已登记 16 个结构变体：4 LIST、2 CARD、7 SPLIT、2 BOARD、1 CALENDAR。

DETAIL 通过 Drawer / Route / SPLIT Detail Presentation 穿透，不是 Page Mode。

### ANALYSIS

用途：趋势、对比、构成、异常、多维分析和经营判断。

可使用 CARD / SPLIT / LIST / BOARD；复杂多 Region 可使用 COMPOSITE dashboard/hybrid。

Global Analysis Scope 与 Chart Local Control 分离。

### REPORT

用途：正式汇总、固定口径查询、核对、打印、导出、报送。

默认 LIST，也可 CARD；复杂“摘要 + 图表 + 表格”可使用 COMPOSITE。

固定 Report Definition 与用户可编辑 Filter 必须区分，结果应可复现。

### DETAIL

用途：单对象完整信息、状态、关联信息、对象级操作、办理记录。

正式承载为 ApplicationDetailDrawer 或 Independent Detail；两者默认复用同一业务详情 Body。DETAIL 不是 Page Mode。

## 12. 高频组件几何

### Button

- xs / sm / default / lg = 24 / 28 / 32 / 36px。
- 默认高度 32px。
- Radius 12px。
- 默认水平 padding 12px。
- Icon / label gap 4px。
- Focus-visible：Primary Focus + 3px Ring。
- Active 可以有 1px 向下反馈，但不改变控件尺寸。

### Tabs

Default：32px 高，2px list padding，4px gap，list radius 12px，trigger radius 8px。

Line：0 padding，16px item gap，2px active indicator，无 active surface。

### SearchField

- Height 32px。
- Radius 12px。
- Search icon 16px。
- Clear hit box 24px。
- Border 1px。
- Focus：Primary Border + white Surface + 3px low-intensity Primary Ring。
- Transition 160ms。

### Overlay

- Dialog / Popover / Bubble：20px radius。
- full-height side Drawer：0px radius。
- 具体宽度和滚动由对应 Owner 持有。

## 13. Viewport / Responsive

基线：1920×1080；最低支持 1024×576；必须验收 Browser zoom 200%。

档位：

- Standard：width >= 1440 且 height > 720。
- Condensed：1181–1439 且 height > 720。
- Compact：width <= 1180 或 height <= 720。

固定适配顺序：压缩非内容间距 → 减少并列列数 → Toolbar 重排/低频能力收纳 → 辅助信息显式降级 → 局部正交滚动 → Canvas 纵向滚动。

禁止整页 transform scale / CSS zoom；Compact 不继续缩小 12px Meta / 14px Body / 16px Title。

## 14. 状态、权限与 A11y

生成页面按适用场景覆盖：default / hover / focus-visible / selected / open-active / disabled / loading / empty / error / no-permission / success / unsaved。

- Empty / No Permission / Error 必须区分。
- Content / Field / Page Action / Record Action / Batch / Export Permission 可分别判断。
- Icon-only 必须有 accessible name 和可见 focus。
- Selected / Error / Permission 不只靠颜色表达。
- Overlay 关闭后恢复合理焦点和来源状态。
- Reduced Motion 不能破坏结果、导航、关闭和焦点恢复。

## 15. Spec Gap

以下任一情况必须登记 Spec Gap，而不是依靠“常见后台经验”补齐：

- 关键尺寸、状态、Icon 或交互没有 Owner；
- 两个 Normative Owner 对同一事实冲突且无已登记裁决；
- 新能力需要未登记 Page Mode 或组件行为；
- 必须依赖外部框架默认样式才能成立；
- 业务权限、动作或数据口径不足以确定页面。
