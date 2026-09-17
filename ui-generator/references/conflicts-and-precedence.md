# Conflicts and Precedence

## 总原则

同一事实只能有一个 Normative Owner。优先级：

1. `GENERATIVE-SPEC.md` 的生成期最高合同。
2. 对应事实的唯一 Normative Owner。
3. 更具体且不冲突的 Page Type / Page Mode 约束。
4. Project Calibration。

Foundation Token 的最终值只由 `01-设计Token.md` 决定。其它文档中的历史 Token ID、旧 resolved value 或实现变量都不能覆盖它。

## 第一版已知冲突 A：Page Mode Switch 位置

当前 v2 分支存在结构冲突：

- `GENERATIVE-SPEC.md`、README、LEDGER、MANAGEMENT、ANALYSIS、REPORT 以及当前 SupervisionPlatform LEDGER 实现共同指向：普通 LIST/CARD/BOARD/CALENDAR 的 Page Mode Switch 位于 Data Control / Surface Toolbar 右侧；SPLIT 位于左侧 Locator 的搜索/控制行右侧。
- `页面生成前置询问.md`、`application-page-header.md`、`application-query-toolbar.md` 的部分段落仍保留“Page Mode 固定由 Context Area / Header 持有”的旧合同。

第一版生成裁决：

- 普通模式：Page Mode Switch 放在与当前数据展示最接近的控制区右侧。
- SPLIT：Page Mode Switch 放左侧 Locator Search-Control Row 右侧。
- SPLIT 右侧 View Mode 保持独立，只改变 Data Presentation。
- Page Header 不放 Page Mode Switch。

同时将该情况标记为 `Normative Drift`，后续应回写 design-md 统一 Owner。

## 第一版已知冲突 B：Foundation Token 值 / 历史 ID

`01-设计Token.md` 当前正式值包括：

- `color.neutral.fg.4 = #1F1E1A`
- `color.neutral.fg.3 = #4D4B45`
- `color.neutral.fg.2 = #6E6C64`
- `color.neutral.bg.5 = #DDDBD5`
- `color.neutral.bg.3 = #F5F4F1`
- `color.primary = #0071E3`
- `color.warning = #E68A00`

Shell、PageHeader、QueryToolbar 等部分 v2 文档仍出现不同的 resolved value 或 `color.blue.2 / color.orange.1` 等历史 ID。

第一版生成裁决：

- Foundation Token ID 与 resolved value 始终读取 `01-设计Token.md`。
- Owner-local geometry 可以使用自身文档最终值。
- 历史颜色 ID 不作为新生成依赖。

## 第一版已知 drift C：WORKBENCH Pending Type Switch

当前项目规范展示应用实际使用共享 Tabs 表达 Pending 分类；v2 WORKBENCH 文档仍存在 Toggle Group 的明确描述。

生成裁决：

- 若严格按当前 Normative：遵循 WORKBENCH Owner。
- 若用户明确要求“尽可能还原当前项目”：仍不得静默覆盖 Normative；说明 drift，并优先等待规范回写。
- 在没有回写前，项目 Tabs 只能作为视觉校准证据，不能自动升级为正式规则。

## 项目校准不得覆盖的内容

- Page Type / Page Mode 枚举；
- Foundation Token；
- 权限边界；
- A11y 要求；
- 正式组件 Owner 的几何；
- Spec Gap 处理规则。

## 第一版已知 drift D：Page Mode 旧合同分布范围

旧的“Page Mode 固定由 Context Area / Header 持有”并不只存在于 PageHeader / QueryToolbar：当前冻结基线中的 LIST / CARD / SPLIT / BOARD / CALENDAR、Viewport、Acceptance 等文档也有残留。

由于 `GENERATIVE-SPEC.md` 是生成期最高合同，README、LEDGER / MANAGEMENT / ANALYSIS / REPORT Page Type 以及当前 SupervisionPlatform 已落地实现共同指向新的位置规则，第一版把这些旧段落统一视为同一批 `Normative Drift`，不逐文件随机服从。

## 第一版已知 drift E：组件几何与验收总表不一致

`06-基础通用规范/04-验收与治理/验收与治理.md` 中仍存在旧的组件校准条目，例如 SearchField radius 16px、Input/Selection Focus 不使用外围 Ring；但当前 SearchField / Button 等具体 Component Owner 已明确更新：

- SearchField radius = 12px；
- SearchField Focus = Primary Border + white Surface + 3px low-intensity Primary Ring；
- Button Focus-visible = Primary Focus Border + 3px Ring。

第一版裁决：组件 anatomy / geometry / state 由具体 Component Owner 决定；Acceptance 总表不能覆盖更具体的 Component Owner。后续应回写治理文档消除旧条目。

## 第一版校准裁决 F：Shell Variant 默认选择

Standard Shell 与 Basic Shell 都是正式可用结构，因此“选哪一种”本身不是 Normative 冲突。当前 SupervisionPlatform 的普通桌面业务应用已落地为 Basic application navigation：不渲染独立品牌/用户顶栏，账户与应用动作合并进 Application Bar。

第一版生成裁决：

- 用户要求当前 SupervisionPlatform / 规范展示应用风格，且没有明确指定 Standard / Pro / Max 时，Project Calibration 默认选择 Basic Shell。
- 不能因为 Standard Shell 也存在，就随意添加一条深色平台/环境/角色 Top Bar。
- 一旦用户或目标页面上下文明确要求 Standard / Pro / Max，立即按对应 Shell Owner 处理；Project Calibration 不覆盖该明确上下文。

## 第一版校准裁决 G：Business View 与 Page/View Mode 的控件形态

当前规范展示应用与组件中心对 LEDGER 已有稳定实现：Business View 使用 line Tabs；Page/View Mode 由 Query Action Group 中的 Dropdown 输出；Presentation Settings 独立。

第一版生成裁决：

- 对当前 SupervisionPlatform 风格的 LEDGER，Business View 不用 segmented/pill；Page Mode / View Mode 不用平铺 segmented buttons。
- SPLIT 根 Page Mode、右侧 Data Presentation、Presentation Settings 继续保持三个独立作用域。
- 若未来 design-md 对某个具体语义明确登记其它控件形态，以新的具体 Normative Owner 为准，并更新本校准裁决。
