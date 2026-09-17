# SupervisionPlatform Project Calibration v1

> 目的：让生成结果更像当前 SupervisionPlatform。以下事实来自项目仓库当前规范展示应用与组件中心的真实实现审计，但不是 Normative 规则。与 design-md 冲突时按 `conflicts-and-precedence.md` 处理。

## 基线

仓库：`songluo-ctyl/SupervisionPlatform`

观察 main：`de8952a336ed0ae7633f06210402af92abc040d0`（2026-09-16）。

已重点审计：规范展示应用 WORKBENCH / LEDGER、页面样式、组件中心 Production Catalog。

## 产品语言

- 页面整体密度偏紧凑，常用基础间距集中在 4 / 8 / 12 / 16 / 24px。
- Surface 以浅中性色 Canvas + 白色内容面为主，不用大面积装饰阴影。
- 高层结构优先清晰分区和单一 Scroll Owner；列表/看板/日历的局部溢出由自身 Surface 处理。
- 主要交互控件尺寸集中在 32px 工作栏高度，Icon 通常 16px 左右。
- 普通交互倾向中性 Hover；业务明确的快捷操作等局部能力可以有轻量 Accent Hover。
- 当前项目广泛复用 Foundation + Application Atomic + Application Module 三层组件，而不是页面自己画控件。

## Application Shell / Navigation 已落地校准

以下事实来自当前 `TopNavigation`、`TopNavigationSecondaryNav`、`ApplicationModuleSwitcher`、`SecondaryNavigationSettings` 以及对应测试。它们是当前 SupervisionPlatform 的项目校准事实。

### Basic Business Application Shell

当前桌面 Basic 业务应用在满足 `Basic + application shell + 非 mobile` 时：

- 不渲染独立 `TopNavigationPrimaryBar` 品牌/用户顶栏；账户与应用动作以 actions-only 形态合并到 Application Bar 右侧。
- Application Bar 高 56px；Secondary Module Row 高 48px；两行合计 104px。
- Application Bar 左侧为当前应用身份：32×32 Logo/Icon + 应用名称。
- 右侧依次承载当前应用可用的 global actions、应用设置、以及账户/应用动作。
- 不生成额外的“平台名 / 环境 / 当前角色”深色横条；如果这些信息没有被业务上下文明确要求，就不应为了“像后台系统”而新增。
- 当前项目 Basic Shell 已显式移除 legacy content top offset；内容不应再为不存在的品牌顶栏留空。


### Application Bar Right Actions / Expanded Panels

当前 Application Bar 右侧由产品壳层统一装配，不是页面自由发挥区。详细离线合同见 `navigation-action-panels.md`。

- 右侧先渲染当前应用实际配置的 Application Global Actions；当前共享语义包括消息、待办、总览、风险预警、设置、更新管理等，但不是每个应用都必须全量显示。
- `panel` 类型动作使用锚定 Application Bar 的 Popover；当前工作宽度上限约 720px、视口两侧保留约 16px，外层 radius 20，面板主体自己负责 16px padding。
- 通用 Global Action Panel 结构为 Header/Status → 4 Metrics → 主内容双列（主队列 + 右侧分布/最近事项）；Version Update 使用专门的版本/版本档位结构，不强套通用队列。
- `config` / application settings 走右侧系统设置 Drawer；不要缩成 dropdown。
- Basic trailing actions 复用账号/应用动作：Application Switcher（有能力时）与 Account Menu。Application Switcher 当前为约 440px Popover；Account Menu 当前为约 200px Dropdown，首部显示用户身份，随后是条件性平台入口、主题/用户设置和分隔后的退出登录。
- Application Switcher 与 Account Menu 互斥；Global Action Panel 只允许一个 active；关闭 Overlay 后恢复到来源 Trigger。
- 不因“常见后台”自行添加问号、铃铛、更多、用户等图标。若生成某个右侧入口，必须存在 capability 与点击后的真实 contract。

如果任务明确是 Standard / Pro / Max 或平台导航场景，则按对应 Shell Owner 和目标上下文处理；本节只规定当前业务应用默认校准。

### Module Group → Module Switcher → Tabs

当前规范展示应用把 Page Type 注册为 `moduleGroups`：工作台、管理页面、台账页面、分析页面、报表页面、详情页面。

- 有多个 module group 时，左侧显示 `ApplicationModuleSwitcher`，而不是把 module groups 全部平铺为一行 Tabs。
- Module Switcher 选择一个当前模块；Secondary Tabs 只显示该模块自己的 tabs。
- 规范展示应用中例如 WORKBENCH 的 tabs 是“工作台 / 缺省状态 / 单条数据状态”；LEDGER 的 tabs 是“台账结构 / 资产档案 / 权属证照 / 运营情况 / 资产盘活 / 维护计划 / 清查管理 / 分析视图”。这些 tabs 属于各自 module group，不能与其它 Page Type 并列混用。
- 当前 Module Switcher trigger 工作宽度最小约 168px，占 Secondary Module Row 左侧；展开后的应用面板约 168px 宽，从应用壳层底部延伸到视口底部。
- Secondary Tab 使用左侧 icon + visible label；Active 使用应用 Accent 文本与底部 underline。

### Secondary Navigation Settings

当前项目在存在 secondary navigation items 时，在 Secondary Module Row 右侧保留二级导航编辑入口。

- Trigger 是独立 icon-only ghost action，语义为“自定义二级导航”。
- 当前实现打开右侧 Drawer，而不是在 Tab 行内直接进入编辑态。
- Drawer 支持拖拽排序和显示/隐藏开关。
- 最后一个可见导航项不能被隐藏。
- 如果用户要求还原当前平台，不能因为只实现了 Tabs 点击，就省略该编辑能力。

## WORKBENCH 已落地校准

### 页面节奏

当前规范展示应用：

- 根布局按内容向下排列，Region gap 约 12px。
- Header、Metrics、Work Region、Analysis 使用统一内容节奏。
- Metrics 当前样例为 4 列；每项约 12px padding、16px radius、默认无额外外框。
- Work Region 当前样例为“待办较宽 + 快捷操作较窄”，比例约 1.4 : 0.8，右侧保证约 300px 最小工作宽度。
- Pending / Quick Actions 使用白色 Surface、16px radius，当前实现不叠加装饰性外边框。
- Analysis 当前样例使用 2 列网格，卡片约 12px padding、16px radius、最低约 220px。

### Empty

当前项目 Empty：

- Region 内原位呈现，不删除 WORKBENCH 骨架。
- 当前样例最小高度约 160px。
- 使用淡中性背景 + 虚线边界。
- 项目示例插画约 144×96px。
- Title 与 Description 保持简短，Description 宽度受控。

### Quick Actions

当前项目样例：

- 默认两列网格。
- 单个入口最小高度约 68px、12px padding、12px radius、1px border。
- Icon box 约 32×32px、8px radius、16px icon。
- Hover：保留 border，使用轻量 Accent border/background，并有约 1px 上浮反馈；transition 约 160ms。
- Focus-visible：当前项目存在明确 Accent outline。
- Disabled：保持结构位置，不上浮、不触发 Hover，文字/图标弱化。
- single-record 样例中单入口可占满区域并居中，图标放大到更明显的 48px box。

这些细节只有在不与当前 Component / WORKBENCH Normative 冲突时使用。

### Analysis

当前项目真实使用环形图、横向条形图、雷达图、折线图；每张图拥有自己的 Tooltip 和可访问名称。图表局部口径切换只影响当前图，单位、轴、图例和数据同步变化。

## LEDGER 已落地校准

### 页面骨架

当前项目 LEDGER 以完整高度工作区组织，典型顺序：

- ApplicationPageHeader；
- 可选 Metric Strip；
- 主内容工作区。

当前内容 Region 左右边距约 12px，主工作区自己承担剩余高度。

Header 当前真实组合：业务标题 + 更新时间/Refresh + Primary Action + 导出。当前实现没有把 Page Mode Switch 放 Header。

### QueryToolbar

当前项目真实组合包括：

- Business View：全部资产 / 运营资产 / 保障资产；当前实现使用 `Tabs` 的 `line` 变体，即文本 + active underline，不使用 pill / segmented / boxed Toggle；
- Result Summary；
- Search 入口；
- 可按需添加的 Custom Filter；
- Applied Filter Feedback；
- 右侧 Page Mode / View Mode / Presentation Settings；
- 条件性的 Batch Action。

Search 当前由输入入口打开综合查询 Dialog；Dialog 最大宽度约 640px，支持关键词 + 筛选，Enter 可 Apply。

项目当前 Custom Filter 最多同时选择 4 个扩展维度。


#### Enterprise Toolbar vertical rhythm

当前 Production Catalog 的 enterprise Query Toolbar 是双行结构：

- 第一行：左侧 Business View / Tabs，右侧 Query Action Group 与可选 trailing action；
- 第二行：Result Summary → divider → Search → Custom Filter → Sort / Filters / Advanced Filter；最右侧可独立放 body actions；
- 两行之间由 Toolbar 容器保持 `application-space-3` 级别的 block gap（当前 token 对应约 12px）。

因此不要让 line Tabs 的 active underline 紧贴下一行 Search/Filter；Tabs 与 Query Body 必须保持两个独立工作层级。


### LIST Result Surface / Record List boundary

当前共享 `ApplicationRecordList` 的外层 Card 本身保持透明、无装饰边框；真正的结果 Surface 由 `tableContainer` 承担：

- Surface background；
- radius 16px；
- 当前约 12px padding；
- 子区域之间约 12px gap；
- Toolbar / Batch Bar / Table Scroll / Pagination 均属于同一个 `tableContainer`。

Table 内部再使用自己的 12px 顶部圆角与 Header/Row divider。不要把 Table 直接铺到 Canvas 边缘，也不要为了补“卡片感”增加不属于当前项目的厚边框或大阴影。

分页属于结果 Surface 内部，不应悬浮到 Surface 外或贴 Canvas。

### Page Mode

当前真实实现：

- Page Mode 由共享 `ApplicationQueryActionGroup` 输出，其中 View Mode 使用 `ApplicationViewModeMenu` 的 Dropdown + 单选菜单；不要平铺成“列表 / 卡片 / 分栏” segmented buttons。
- LIST/CARD/BOARD/CALENDAR：Page Mode Dropdown 进入 QueryToolbar / 当前 Surface 的右侧动作区。
- SPLIT：同一 Page Mode Dropdown 作为 `splitSidebarSearchAction` 传入左侧搜索/控制区。
- Presentation Settings 使用独立 Settings Dropdown；它不属于 Page Mode 菜单。
- 切 Page Mode 时关闭详情 Drawer、清当前活动对象，并回到目标 Mode 的首个已登记结构变体。

这是第一版解决 Page Mode 文档冲突时的重要项目证据。

### SPLIT / category-list

当前真实内容视图集合：列表 / 看板 / 卡片 / 日历 / 图表。

- 左侧负责分类定位和 Page Mode；Page Mode 仍是 Dropdown。
- 右侧内容视图使用独立 Dropdown / FilterMenu，不复用根 Page Mode 状态。
- 右侧另有跟随当前 Data Presentation 的 Settings Dropdown。
- Page Mode 与 Right View Mode 不共享状态。
- 当前分类统计在右侧按当前结果计算。

### CARD

当前项目卡片网格使用自适应列，单卡最小工作宽度约 220px；标准 gap 约 8px，compact 更紧。

### Detail

当前项目 LEDGER 通过共享 Asset Detail Drawer 穿透记录，并支持前一条 / 后一条对象导航。搜索、业务视图、筛选等导致活动对象失效时会清空当前对象，避免详情与结果集脱节。

### 状态保留习惯

- Refresh 不应清掉当前查询上下文。
- Business View / Filter / Query 变化时通常清除失效 Active Record。
- Page Mode 和 Data Presentation 是不同状态。
- 列设置与不同 Presentation 的密度设置分别保存。
- 导出针对当前查询结果，而不是无条件全量数据。

## Component Center 校准

当前 Production Catalog 明确三层协作：Foundation、Application Atomic、Application Module。模块组件具有稳定产品结构合同，但不等于 Page Mode。

生成时优先复用已有应用模块：PageHeader、QueryToolbar、RecordList、DetailDrawer、MetricStrip、SplitSidebar、FormDialog、Navigation 等，而不是页面临时组合第二套视觉。
