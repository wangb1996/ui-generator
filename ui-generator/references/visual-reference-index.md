# Visual Reference Index

## 第一版状态

第一版不打包伪造截图、占位截图或未经验证的网络截图。

原因：Visual Golden Sample 必须来自真实 SupervisionPlatform 页面，且要能确认对应状态、视口、Page Type / Page Mode 与版本。当前制作环境没有可可靠执行并截图该应用的浏览器运行上下文。

## 运行时使用规则

当用户在对话中提供真实项目截图时：

1. 标注它对应的 Page Type / Page Mode / 状态。
2. 只用它校准空间比例、密度、排布、Surface、控件位置和当前可见状态。
3. 不从截图猜未显示的交互、权限、数据口径或精确尺寸。
4. Normative 文档明确给出值时，以 Normative 为准。
5. 若截图显示项目实现与规范冲突，记录为 Project Drift。
6. 用户对截图的红线、批注、圈选属于纠错证据。被明确标成“多余/错误/缺失/形态不对”的区域只能作为 Negative Regression Sample，不能升级为 Golden Sample。
7. 对 Negative Regression Sample，应回查 Normative Owner 与 Project Calibration，提炼成可验收的正向规则，而不是照着错误截图继续微调样式。

## 后续建议补入 Skill 的 Golden Samples

优先：

- 当前 SupervisionPlatform Basic Business Application Shell（56px Application Bar + 48px Module Row，无独立 Top User Bar）；
- Standard Shell（仅用于明确要求 Standard 的场景）；
- WORKBENCH default / empty / single-record；
- LEDGER LIST；
- LEDGER SPLIT category-list；
- LEDGER SPLIT locator-presentation；
- LEDGER BOARD；
- LEDGER CALENDAR；
- Detail Drawer；
- 1024px Compact 页面。

每张截图应同时记录：来源页面、commit/版本、视口、Page Type、Page Mode、状态、主要校准点和禁止推断项。
