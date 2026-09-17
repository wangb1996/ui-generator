# Acceptance Gate

## 1. 同产品一致性

- 去掉业务文案后，页面是否明显属于 SupervisionPlatform 同一产品？
- Shell、Canvas、Surface、Control 密度是否连续？
- 是否出现另一套 Button / Tabs / Search / Card / Drawer 视觉？

## 2. Shell / Navigation 回归门禁

当目标是当前 SupervisionPlatform 普通桌面业务应用：

- 默认 Basic Shell 不得出现独立黑色/深色的平台名、环境、角色或 Top User Bar，也不得保留 52px 空白占位。
- Application Bar 应保持约 56px，Secondary Module Row 应保持约 48px；只有确实没有 Module Row 时才省略该行。
- 多模块 / 多 module group 应存在 Module Switcher；若直接把所有模块平铺成 Tabs，验收失败。
- Secondary Tabs 只属于当前选中模块，不能混入其它 module group / Page Type。
- 当前模块有 secondary navigation items 时，应保留右侧自定义/编辑入口；缺失视为功能回归。
- Application Bar 当前应用已配置的 Global Actions / Settings / Account / Application Switcher 不得无故消失；右侧出现空白而配置存在时验收失败。
- 每个 Application Bar 右侧 Trigger 必须能映射到 `navigation-action-panels.md` 的 Popover / Dropdown / Drawer / Route 合同；只有图标没有行为时验收失败。
- 不得用一个通用菜单替代 Global Action Panel、Settings Drawer、Application Switcher、Account Menu 四种不同语义。
- Global Action Panel 同时最多一个 active；Application Switcher 与 Account Menu 互斥；关闭后应恢复来源焦点。
- 不为“看起来更像后台”虚构环境标签、平台状态条、角色条或第三套导航。

## 3. 架构

- Page Type 正确。
- Page Mode 只使用 LIST / CARD / SPLIT / BOARD / CALENDAR。
- DETAIL 没有被当 Page Mode。
- COMPOSITE 没有被当 Page Mode。
- Business View、Data Control、Data Presentation 作用域清楚。

## 4. Page Mode / SPLIT

按第一版冲突裁决：

- 普通 Mode 的 Page Mode Switch 在 Data Control / Surface Toolbar 右侧。
- SPLIT 的 Page Mode Switch 在左侧 Locator Search-Control Row 右侧。
- SPLIT Right View Mode 只改变右侧 Data Presentation。
- Presentation Settings 只改变当前呈现细节。
- 三者可访问名称、位置和状态都能区分。
- 当前项目 LEDGER Business View 必须使用 line Tabs；若生成 pill / segmented / boxed Toggle，验收失败。
- 当前项目 Page Mode / View Mode 必须使用 Dropdown 语义；若把“列表 / 卡片 / 分栏”等直接平铺成 segmented buttons，验收失败。
- SPLIT 右侧 Data Presentation Dropdown 与根 Page Mode Dropdown 必须独立；Settings 也必须是独立入口。
- Enterprise Query Toolbar 的 Tabs/Header Row 与 Search/Filter Body Row 必须是两个层级，并保留 `application-space-3` 级别的垂直 gap；active underline 贴住 Search/Filter 视为布局回归。

## 5. LIST Result Surface

当当前项目使用共享 ApplicationRecordList / ListTableShell：

- Toolbar / Batch Bar / Table / Pagination 必须处于同一个结果 Surface。
- 结果 Surface 使用当前项目 `tableContainer` 语言：Surface 背景、radius 16、约 12px padding、约 12px 子区域 gap。
- 外层 Card 可保持透明；不要误加厚边框或大阴影。
- Table 不得直接贴 Canvas 或 Surface 四边；Pagination 不得跑到 Surface 外。
- 若截图看起来“表格和背景卡片边距消失”，按本节判定失败。

## 6. Component Owner

- Button、Tabs、Search、Input、Select、Card、Table、Drawer 等基础视觉没有页面私有重设计。
- 组件几何来自对应 Normative Owner。
- Foundation Token 最终值只来自 `01-设计Token.md`。

## 7. 交互

每个可点击控件至少满足：有真实行为、明确 Disabled、或明确 Read-only。

检查：

- Hover / Active / Focus-visible；
- Selected / Expanded；
- Loading / Empty / Error / No Permission；
- Submit / Cancel / Close / Back；
- Drawer/Dialog/Popover/Dropdown 关闭后的焦点与来源恢复；
- Application Bar right-action overlays 的 Expanded / Active / mutual exclusion 状态；
- Search/Filter 切换不导致输入焦点、IME、局部滚动被无意义销毁。

## 8. 权限

- 页面级、批量、对象级能力分别校验。
- 无权限不能只靠灰色表达。
- 切 Page Mode / View Mode 不得绕过 Permission Scope。
- 直接 URL / 深链恢复不能让无权对象重新出现。

## 9. 响应式与 A11y

- 1920×1080 是参考视口。
- 1024×576 核心任务仍可完成。
- 浏览器 200% zoom 可访问。
- 不使用整页 scale / CSS zoom 保结构。
- Icon-only 有 accessible name。
- Selected / Error / Permission 不只靠颜色。
- 正文与关键数值不为塞进一屏而缩到不可读。

## 10. Spec Gap

若任一关键视觉或交互只能靠“感觉”“常见后台做法”“第三方默认值”决定，则本次验收不通过，登记 Spec Gap。
