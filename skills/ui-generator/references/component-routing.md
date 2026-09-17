# Component Routing

只加载当前页面真正使用的 Owner。以下是第一版高频路由。

## Foundation

| 能力 | Owner |
| --- | --- |
| Button | `components/01-foundation/foundation-button/foundation-button.md` |
| Card | `components/01-foundation/foundation-card/foundation-card.md` |
| Tabs | `components/01-foundation/foundation-tabs/foundation-tabs.md` |
| Input | `components/01-foundation/foundation-input/foundation-input.md` |
| Select | `components/01-foundation/foundation-select/foundation-select.md` |
| Checkbox | `components/01-foundation/foundation-checkbox/foundation-checkbox.md` |
| Table | `components/01-foundation/foundation-table/foundation-table.md` |
| Dialog | `components/01-foundation/foundation-dialog/foundation-dialog.md` |
| Drawer | `components/01-foundation/foundation-drawer/foundation-drawer.md` |
| Dropdown Menu | `components/01-foundation/foundation-dropdown-menu/foundation-dropdown-menu.md` |
| Popover | `components/01-foundation/foundation-popover/foundation-popover.md` |
| Tooltip | `components/01-foundation/foundation-tooltip/foundation-tooltip.md` |
| Empty | `components/01-foundation/foundation-empty/foundation-empty.md` |
| Skeleton | `components/01-foundation/foundation-skeleton/foundation-skeleton.md` |
| Spinner | `components/01-foundation/foundation-spinner/foundation-spinner.md` |
| Pagination | `components/01-foundation/foundation-pagination/foundation-pagination.md` |
| Chart | `components/01-foundation/foundation-chart/foundation-chart.md` |

## Application Atomic

| 能力 | Owner |
| --- | --- |
| SearchField | `components/02-application-atomic/search-field/search-field.md` |
| ApplicationFilterMenu | `components/02-application-atomic/application-filter-menu/application-filter-menu.md` |
| SystemButton | `components/02-application-atomic/system-button-application/system-button-application.md` |
| List Selection Checkbox | `components/02-application-atomic/list-selection-checkbox/list-selection-checkbox.md` |
| List Pagination | `components/02-application-atomic/list-table-pagination/list-table-pagination.md` |
| Back Button | `components/02-application-atomic/application-back-button/application-back-button.md` |

## Application Module

| 能力 | Owner |
| --- | --- |
| Page Context/Header | `components/03-application-module/application-page-header/application-page-header.md` |
| Query Toolbar | `components/03-application-module/application-query-toolbar/application-query-toolbar.md` |
| Record List | `components/03-application-module/application-record-list/application-record-list.md` |
| Detail Drawer | `components/03-application-module/application-detail-drawer/application-detail-drawer.md` |
| Detail Body | `components/03-application-module/application-record-detail-body/application-record-detail-body.md` |
| Form Dialog | `components/03-application-module/application-form-dialog/application-form-dialog.md` |
| Split Sidebar | `components/03-application-module/application-split-list-sidebar/application-split-list-sidebar.md` |
| Page Layout Container | `components/03-application-module/application-page-layout-container/application-page-layout-container.md` |
| Metric Strip | `components/03-application-module/application-metric-strip/application-metric-strip.md` |
| Trend Metric | `components/03-application-module/application-metric-trend/application-metric-trend.md` |
| Chart Metric | `components/03-application-module/application-metric-chart/application-metric-chart.md` |
| Primary/Secondary Metric | `components/03-application-module/application-metric-primary-secondary/application-metric-primary-secondary.md` |
| Status Metric | `components/03-application-module/application-metric-status/application-metric-status.md` |
| Batch Action Bar | `components/03-application-module/list-batch-action-bar/list-batch-action-bar.md` |
| Primary Navigation | `components/03-application-module/application-primary-navigation/application-primary-navigation.md` |
| Secondary Navigation | `components/03-application-module/application-secondary-navigation/application-secondary-navigation.md` |
| Module Switcher | `components/03-application-module/application-module-switcher/application-module-switcher.md` |
| Application Bar Right Actions / Overlays | Primary/Secondary Navigation Owners + Foundation Popover / Dropdown Menu / Drawer；项目展开结构读取 `navigation-action-panels.md` |

## 当前项目装配映射（Project Calibration）

以下用于选择“已有哪个组件”，不改变上方 Normative Owner：

| 当前项目语义 | 优先复用 / 对齐 | 禁止的自由替代 |
| --- | --- | --- |
| 多模块业务应用的模块切换 | Module Switcher | 把模块组平铺成 Secondary Tabs |
| 当前模块的页签 | Secondary Navigation + line-style active underline | 用卡片导航或另一套 pill 导航 |
| 二级导航自定义 | Secondary Navigation Settings + Drawer + Switch / reorder | 直接省略编辑入口 |
| LEDGER Business View | Foundation Tabs `line` 语义 | segmented / pill / boxed toggle |
| Page Mode / View Mode | Query Toolbar + Dropdown Menu 语义 | 平铺“列表/卡片/分栏” segmented buttons |
| Presentation Settings | Query Toolbar / Settings Dropdown | 与 Page Mode 合并成一组 |
| Application Global Action | Application Bar action + anchored Popover panel | 无行为 icon / 通用 tooltip menu / 页面内卡片 |
| Application Settings | Application Bar settings + system-settings Drawer | 小型 dropdown / 重复页面设置区 |
| Application Switcher | trailing shell action + app-grid Popover | 与 Account Menu 合并 |
| Account | trailing avatar/account action + Dropdown Menu | 伪造用户资料 / 复用 Global Action Panel |
| LIST Result Surface | ApplicationRecordList / ListTableShell；Surface 由 tableContainer 承担 | 裸表贴 Canvas / 额外重边框大阴影 |

## 高频已确认几何

从当前 Normative Owner 读取，不从项目 CSS 猜：

- Button：24 / 28 / 32 / 36px；默认 32px；radius 12px；默认水平 padding 12px；Icon/Label gap 4px。
- Tabs default：32px 高、2px padding、4px gap、list radius 12px、trigger radius 8px。
- Tabs line：0 padding、16px gap、2px active indicator。
- SearchField：32px 高、radius 12px、16px search icon、24px clear hit box、1px border、3px focus ring、160ms transition。

若页面需要更多组件几何，必须读取对应 Owner。
