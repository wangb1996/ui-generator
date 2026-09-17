# Source Map

## 目的

本 Skill 的知识来自两个事实域：

- `design-md`：正式生成规范。
- `SupervisionPlatform`：项目校准事实，只用于提高同产品还原度。

## design-md 基线

仓库：`wangb1996/design-md`

第一版冻结分支：`agent/design-md-v2-self-contained`

第一版观察 commit：`d5d9bfaee91a2e4a4affbffba908b3a09915b687`（2026-09-17）。

生成期最高合同：`GENERATIVE-SPEC.md`。

核心读取路径：

| 域 | 路径 |
| --- | --- |
| 最高生成合同 | `GENERATIVE-SPEC.md` |
| 架构 / 五层模型 | `00-应用UI框架总纲.md` |
| Foundation Token | `01-设计Token.md` |
| Shell | `02-应用外层框架/应用外层框架.md` |
| LIST | `03-页面布局/01-列表布局/列表布局.md` |
| CARD | `03-页面布局/02-卡片布局/卡片布局.md` |
| SPLIT | `03-页面布局/03-分栏布局/分栏布局.md` |
| BOARD | `03-页面布局/04-看板布局/看板布局.md` |
| CALENDAR | `03-页面布局/05-日历布局/日历布局.md` |
| Independent Detail | `03-页面布局/06-独立详情布局/独立详情布局.md` |
| COMPOSITE | `03-页面布局/07-复合布局/复合布局.md` |
| Embedded | `04-集成模式/Embedded.md` |
| WORKBENCH | `05-页面类型/01-工作台/工作台.md` |
| LEDGER | `05-页面类型/02-台账/台账.md` |
| MANAGEMENT | `05-页面类型/03-管理页面/管理页面.md` |
| ANALYSIS | `05-页面类型/04-分析页面/分析页面.md` |
| REPORT | `05-页面类型/05-报表页面/报表页面.md` |
| DETAIL | `05-页面类型/06-详情页面/详情页面.md` |
| Viewport | `06-基础通用规范/01-视口适配/视口适配.md` |
| Intake | `06-基础通用规范/02-页面生成前置询问/页面生成前置询问.md` |
| System State | `06-基础通用规范/03-系统状态页面/系统状态页面.md` |
| Acceptance / Governance | `06-基础通用规范/04-验收与治理/验收与治理.md` |
| Icon / Asset | `06-基础通用规范/05-图标与视觉资产/图标与视觉资产.md` |
| Component Index | `components/README.md` |

GitHub connector 可用时，按以上路径直接读取当前冻结分支文件。除非用户明确要求升级 Skill 基线，不自动切到其它分支。

## SupervisionPlatform 校准基线

仓库：`songluo-ctyl/SupervisionPlatform`

第一版观察 `main`：`de8952a336ed0ae7633f06210402af92abc040d0`（2026-09-16）。

仅用于制作/更新校准事实的主要来源：

- 规范展示应用：`apps/web/src/features/standards-showcase/`、`apps/web/src/pages/standards-showcase/ui/StandardsShowcaseView.jsx`、`StandardsShowcaseView.css`；
- 规范展示导航注册：`apps/web/src/data/standards-showcase/standardsShowcaseNavigation.js`；
- 应用壳层：`apps/web/src/widgets/navigation/ui/TopNavigation.jsx`、`TopNavigationSecondaryNav.jsx`、`TopNavigationPrimaryBar.jsx`；
- Application Bar 右侧动作：`apps/web/src/features/application-global-actions/model/applicationGlobalActionModel.js`、`ui/ApplicationGlobalActionPopover.jsx`、`ui/ApplicationGlobalActionPanel.jsx` 及其 module.css；
- Application Settings：`apps/web/src/widgets/navigation/ui/ApplicationSettingsDrawer.jsx`；
- 模块切换：`apps/web/src/widgets/navigation/ui/ApplicationModuleSwitcher.jsx` 及 `.module.css`；
- 二级导航编辑：`apps/web/src/widgets/navigation/ui/SecondaryNavigationSettings.jsx` 及其 model；
- 壳层回归测试：`basicApplicationNavigationVariant.test.mjs`、`topNavigationModuleSwitcher.test.mjs`；
- LEDGER 当前实现：`apps/web/src/features/standards-showcase/ui/RealEstateAssetLedger.jsx`、`RealEstateAssetLedgerLayouts.jsx`、`model/standardsShowcaseIntegration.test.mjs`；
- Application 共享控件：`apps/web/src/shared/ui/application/ApplicationPagePrimitives.jsx` 及 `.module.css`；
- Record List / Result Surface：`apps/web/src/shared/ui/application/ApplicationRecordList.jsx`、`.module.css`、`apps/web/src/shared/ui/ListTableShell.jsx`；
- 组件中心：`apps/web/src/features/ui-component-center/data/foundationComponentCatalog.js`、`productionComponentCatalog.js`；
- 当前导航 CSS：`apps/web/styles/02-navigation.css`，基础高度变量位于 `apps/web/styles/00-base.css`。

本次补充校准时还核对了 2026-09-16 的两次近期变更：`c5906e2b...`（一级导航右侧适配优化）与 `6a41ad8c...`（二级导航编辑调整）。冻结观察 commit 仍为 `de8952a...`。

普通页面生成时不要读取这些源码。要更新 Skill、做规范校准，或离线基线无法解释用户指出的项目回归时才读取。

## Skill 内置离线基线

`references/core-normative-baseline.md` 是第一版基于上述冻结分支整理的核心离线摘要，覆盖五层模型、Foundation Token、Shell、五类 Page Mode、COMPOSITE、六类 Page Type、高频组件、Viewport、状态与 A11y。`references/navigation-action-panels.md` 单独冻结当前项目 Application Bar 右侧功能及展开面板的离线结构合同。

它用于 connector 不可用或不需要低频细节时快速生成，不改变 Owner 关系。需要低频组件、图标 deterministic geometry、特殊 Overlay 细节或摘要无法唯一回答的事实时，读取本文件列出的原始 Owner。
