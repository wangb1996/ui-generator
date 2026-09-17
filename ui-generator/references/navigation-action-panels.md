# Application Navigation Action Panels

> Project Calibration only. This file freezes the current SupervisionPlatform application-navigation action and overlay structure so generated applications do not lose the right-side functions or replace them with generic admin icons. Normative component geometry still comes from design-md Owners.

## Baseline and owners

Repository: `songluo-ctyl/SupervisionPlatform`

Observed main commit: `de8952a336ed0ae7633f06210402af92abc040d0` (2026-09-16).

Primary project evidence:

- `apps/web/src/widgets/navigation/ui/TopNavigation.jsx`
- `apps/web/src/widgets/navigation/ui/TopNavigationSecondaryNav.jsx`
- `apps/web/src/widgets/navigation/ui/TopNavigationPrimaryBar.jsx`
- `apps/web/src/features/application-global-actions/model/applicationGlobalActionModel.js`
- `apps/web/src/features/application-global-actions/ui/ApplicationGlobalActionPopover.jsx`
- `apps/web/src/features/application-global-actions/ui/ApplicationGlobalActionPanel.jsx`
- `apps/web/src/features/application-global-actions/ui/ApplicationGlobalActionPopover.module.css`
- `apps/web/src/features/application-global-actions/ui/ApplicationGlobalActionPanel.module.css`
- `apps/web/src/widgets/navigation/ui/ApplicationSettingsDrawer.jsx`

Do not copy these implementations into generated output. Reproduce the interaction and structure contracts through the applicable design-md components.

## 1. Application Bar right-side composition

For the current Basic business-application shell, treat the 56px Application Bar as one product-owned navigation surface:

- left: Application Identity (32x32 logo/icon + visible application name);
- right: configured Application Global Actions;
- then application Settings when the app exposes a settings module and no global action already owns settings;
- then trailing account/application actions supplied by the Basic shell.

Do not replace the right side with arbitrary `?`, bell, user, kebab, or settings icons just because they are common in admin products. Every trigger must map to a configured capability and a known overlay/route contract.

If the business input does not define a capability and the current project configuration does not provide it, omit it or register a Spec Gap. Do not invent a generic help panel.

## 2. Application Global Actions

The current shared definition recognizes these action semantics:

| action | label | display contract |
| --- | --- | --- |
| `messages` | 消息 | anchored panel |
| `todo` | 待办 | anchored panel |
| `dashboard` | 总览 | anchored panel |
| `riskWarning` | 风险预警 | anchored panel |
| `config` | 设置 | right-side drawer |
| `versionUpdate` | 更新管理 | anchored panel with special version content |

Render only actions actually configured for the current application. Do not assume all six belong to every app.

### Trigger behavior

- Use one compact navigation action per capability.
- Keep an accessible label even when the visual trigger collapses to icon-only.
- When width allows, the current shell can reveal text labels for global actions; do not make label visibility a different information architecture.
- `panel` action: toggle its anchored panel. Clicking the same active action closes it; switching to another action replaces the active panel.
- `drawer` action: open the application settings drawer.
- `route` action, if a configured app provides one: close transient panel state and navigate.
- Mark Expanded / Active explicitly; do not use color alone.

## 3. Shared anchored global-action panel

Use the same structural family for Dashboard / Risk Warning / Messages / Todo and similar current panel actions.

### Overlay geometry

- Overlay type: Popover anchored to the Application Bar action cluster.
- Placement: bottom, aligned to the right/end of the action cluster.
- Gap from trigger surface: about 10px in the current project.
- Working width: up to about 720px, constrained to viewport minus roughly 32px.
- Outer content padding: 0; panel body owns its spacing.
- Outer radius: 20px.
- Do not turn this into a full-screen modal, page route, or tiny tooltip menu.

### Panel body

- panel padding: 16px;
- Header: left heading block + right status chip;
- heading: optional eyebrow, title, optional application-scoped description;
- Metric row: normally 4 compact metrics in one row, gap about 8px;
- Main content: two-column grid, roughly `1.2fr / 0.8fr`, gap about 12px;
- left section: primary queue/list with section title and current-period meta;
- right stack: distribution/summary section + recent items section;
- use product surfaces and dividers, not decorative dashboard gradients.

The exact business labels/data come from the application. The structure is reusable; the demo fixture values are not normative data.

### Version Update special panel

`versionUpdate` reuses the same anchored Popover family but its body is specialized:

- version/edition toolbar with current selection and actions;
- edition/tier comparison area, currently three cards;
- update status/feedback and release information;
- preserve the same product typography, spacing and overlay boundary as other application-global panels.

Do not force the generic queue/distribution body onto Version Update.

## 4. Application Settings Drawer

When Settings is configured as a drawer:

- overlay type: right-side `ApplicationDetailDrawer` family;
- variant: system settings;
- title: system/application settings context, not a generic dialog title;
- no redundant modal overlay in the current project shell;
- tabs/groups derive from the current application settings module;
- content may reuse Application Record List or other registered settings components;
- outside pointer interaction closes the drawer unless the interaction is inside the drawer or its trigger;
- closing returns focus to the original Settings trigger.

Do not implement settings as a small dropdown if the current application contract is drawer-based.

## 5. Trailing application/account actions

The Basic shell reuses the account/actions-only part of the primary navigation inside the Application Bar rather than restoring a separate Top User Bar.

### Application Switcher

Render only when the shell/configuration exposes it.

- trigger: compact application-switch action;
- overlay type: Popover;
- current project working width: about 440px;
- content: compact application grid/card surface;
- current project shows up to 5 visible application entries in this panel;
- grid language: 3 compact columns at wide desktop, current item visibly selected;
- opening Application Switcher closes Account Menu; opening Account Menu closes Application Switcher.

### Account Menu

- trigger: avatar/account action;
- overlay type: Dropdown Menu, aligned to the end of the Application Bar;
- current desktop working width: about 200px;
- first group: current-user identity with larger avatar (about 40px), name, role and phone/context;
- optional platform-navigation entries appear only when platform navigation is active;
- utility actions include theme mode and user settings where applicable;
- final separated destructive action: logout;
- this menu is not the same overlay as Application Global Actions.

If the generated app has no authenticated-user context, do not fabricate a named person or phone number. Keep the shell slot generic or mark the missing account context.

## 6. Mutual exclusion and focus recovery

Treat overlay behavior as part of generation, not a visual afterthought:

- only one application-global panel is active at a time;
- Application Switcher and Account Menu are mutually exclusive;
- closing an anchored panel returns focus to its trigger;
- Settings Drawer returns focus to Settings after close;
- route/module changes close stale local overlays unless the target contract explicitly preserves one;
- outside click closes transient Popover/Dropdown/Drawer according to its owner contract;
- Escape closes the active transient overlay where the Foundation owner supports it;
- do not leave an icon in an expanded visual state after its panel is gone.

## 7. Generation decision table

| Requested/current capability | Trigger surface | Expanded result |
| --- | --- | --- |
| app message/todo/dashboard/risk action | Application Bar global action | anchored global-action Popover |
| version/update management | Application Bar global action | anchored specialized version Popover |
| app settings | Application Bar settings/global action | right-side Settings Drawer |
| application switch | trailing shell action | application-grid Popover |
| account | trailing shell avatar/account action | account Dropdown Menu |
| secondary navigation edit | Secondary Module Row right action | Secondary Navigation Settings Drawer |

Do not merge these overlay types simply to reduce implementation work.

## 8. Failure patterns

Reject the generated result when any of these occur:

- right-side Application Bar functions disappear while the application configuration says they exist;
- triggers render but do nothing;
- every right-side trigger opens the same generic menu;
- Account Menu content is used as an application-global panel or vice versa;
- Settings opens a tiny popover instead of the registered drawer contract;
- global action panel is rendered inside page content rather than anchored to the Application Bar;
- application switch/account state can remain open simultaneously;
- closing an overlay loses keyboard focus with no source recovery;
- generic admin icons or panels are invented without a mapped project capability.
