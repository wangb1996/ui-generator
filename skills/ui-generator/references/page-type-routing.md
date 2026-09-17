# Page Type Routing

## WORKBENCH

Owner：`05-页面类型/01-工作台/工作台.md`

默认优先特殊结构资产 COMPOSITE / hybrid；若正式 LIST/CARD/SPLIT/BOARD/CALENDAR 已能完整表达任务，则优先正式 Page Mode。

典型 Region：Context/Meta、Core Metrics、Pending Work、Quick Actions、Analysis。

已验证状态维度：default / empty / single-record。它们不是 Page Mode 或结构变体。

## MANAGEMENT

Owner：`05-页面类型/03-管理页面/管理页面.md`

默认优先 LIST。可按真实工作方式开放 CARD / SPLIT / BOARD / CALENDAR。

核心区别：用户需要对对象执行受控改变，必须区分 Page Action、Batch Action、Record Action 与权限。

## LEDGER

Owner：`05-页面类型/02-台账/台账.md`

默认 LIST + DataTable。只有对象确实需要摘要、左右定位、泳道或时间组织时开放其它 Page Mode。

已登记 16 个 Page Mode 内部 layoutVariant。DETAIL 通过 Drawer / Independent Route / SPLIT Detail Presentation 穿透，不是 Page Mode。

## ANALYSIS

Owner：`05-页面类型/04-分析页面/分析页面.md`

用于趋势、对比、构成、洞察、异常、多维分析。可使用 CARD / SPLIT / LIST / BOARD，复杂多 Region 可使用 COMPOSITE dashboard/hybrid。

Global Analysis Scope 与 Chart Local Control 必须分离。

## REPORT

Owner：`05-页面类型/05-报表页面/报表页面.md`

强调稳定口径、可核对、可复现、打印/导出。默认优先 LIST，也可 CARD；复杂摘要+图表+表格可使用 COMPOSITE。

固定 Report Definition 不伪装成用户可编辑 Filter。

## DETAIL

Owner：`05-页面类型/06-详情页面/详情页面.md`

用于单对象完整信息。正式承载：ApplicationDetailDrawer 或 Independent Detail。两者默认复用同一业务详情 Body。

DETAIL 是 Page Type，不是 Page Mode。
