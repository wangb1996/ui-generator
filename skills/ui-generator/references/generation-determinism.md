# 生成确定性提升指南

## 目标

通过明确的规则、参考和验证，提高 UI 生成结果的确定性和准确性，减少歧义和随机性。

## 确定性来源

### 1. 明确的输入规范

#### 必需输入
```json
{
  "pageType": "LEDGER",           // 必需：明确的页面类型
  "pageMode": "LIST",             // 必需：明确的布局模式
  "businessView": ["全部", "在售"], // 可选：业务视图列表
  "fields": [...],                // 必需：字段定义
  "actions": [...],               // 必需：动作列表
  "permissions": {...}            // 可选：权限配置
}
```

#### 避免模糊输入
❌ 模糊：「生成一个漂亮的页面」  
✅ 明确：「生成一个 LEDGER 类型的页面，LIST 模式，包含资产列表和筛选功能」

### 2. 参考截图约束

```javascript
// 生成时绑定参考截图
generate({
  type: 'LEDGER',
  reference: 'screenshots/page-types/ledger/overview.png',
  constraints: {
    matchColors: true,      // 颜色必须匹配
    matchLayout: true,      // 布局必须匹配
    matchSpacing: true      // 间距必须匹配
  }
});
```

### 3. 规范文档锁定

每次生成前明确使用的规范版本：

```markdown
## 使用的规范

- design-md: agent/design-md-v2-self-contained @ d5d9bfa
- SupervisionPlatform: main @ de8952a
- 生成时间: 2026-09-17
```

### 4. 组件库复用

优先使用已验证的组件，而不是重新创建：

```javascript
const components = {
  'QueryToolbar': 'components/QueryToolbar.verified',
  'RecordList': 'components/RecordList.verified',
  'Pagination': 'components/Pagination.verified'
};
```

## 确定性检查点

### 生成前检查

- [ ] 页面类型在固定集合中（WORKBENCH/MANAGEMENT/LEDGER/ANALYSIS/REPORT/DETAIL）
- [ ] 页面模式在固定集合中（LIST/CARD/SPLIT/BOARD/CALENDAR）
- [ ] 有明确的字段定义
- [ ] 有明确的动作列表
- [ ] 有参考截图或示例
- [ ] 规范文档版本明确

### 生成中检查

- [ ] 每个组件都有 Normative Owner
- [ ] 颜色来自 Design Token
- [ ] 间距使用系统变量
- [ ] 字体使用系统定义
- [ ] 圆角使用系统值
- [ ] 没有「魔法数字」

### 生成后检查

- [ ] 与参考截图视觉相似度 > 90%
- [ ] 所有必需字段已展示
- [ ] 所有必需动作已实现
- [ ] 响应式断点正确
- [ ] 所有状态可达
- [ ] 验收检查通过

## 减少随机性的策略

### 1. 固定化选择逻辑

❌ 随机：
```javascript
const buttonStyle = Math.random() > 0.5 ? 'primary' : 'secondary';
```

✅ 确定：
```javascript
const buttonStyle = action.type === 'submit' ? 'primary' : 'secondary';
```

### 2. 明确优先级规则

```javascript
// 颜色选择优先级
function selectColor(context) {
  // 1. 用户明确指定
  if (context.userSpecified) return context.userSpecified;
  
  // 2. 参考截图提取
  if (context.referenceColor) return context.referenceColor;
  
  // 3. Design Token
  if (context.tokenExists) return getToken(context.semantic);
  
  // 4. 项目校准
  if (context.projectCalibration) return context.projectCalibration;
  
  // 5. 默认值（最后手段）
  return DEFAULT_COLOR;
}
```

### 3. 锁定组件模板

为每种场景准备确定的模板：

```javascript
const templates = {
  'LEDGER-LIST': {
    structure: [...],
    components: [...],
    verified: true
  },
  'MANAGEMENT-LIST': {
    structure: [...],
    components: [...],
    verified: true
  }
};
```

### 4. 版本化生成规则

```javascript
const generationRules = {
  version: '1.0.0',
  rules: {
    'business-view-tabs': 'line',      // 锁定为 line 样式
    'page-mode-control': 'dropdown',   // 锁定为 dropdown
    'surface-radius': '16px',          // 锁定圆角
    'query-toolbar-rows': 2            // 锁定双层
  }
};
```

## 验证确定性

### 测试方法

**多次生成一致性测试**

```javascript
// 同样输入生成 10 次
const results = [];
for (let i = 0; i < 10; i++) {
  results.push(generate(sameInput));
}

// 计算一致性
const consistency = calculateSimilarity(results);
console.log('一致性:', consistency);  // 应该 > 95%
```

**跨时间一致性测试**

```javascript
// 今天生成
const result1 = generate(input);

// 一周后生成
const result2 = generate(input);

// 应该完全相同（除了时间戳）
assert(deepEqual(result1, result2));
```

## 歧义消解规则

### 场景 1: 多个 Owner 冲突

```javascript
// 当 Shell 文档和 Page Type 文档对同一事项有不同说明
function resolveConflict(shell, pageType) {
  // 规则：Page Type 更具体，优先级更高
  return pageType.spec || shell.spec;
}
```

### 场景 2: 项目实现与规范不符

```javascript
// 当项目实现与 Normative 规范冲突
function resolveImplementationConflict(normative, projectImpl) {
  // 规则：Normative 优先，但标记项目偏差
  return {
    use: normative,
    drift: describeDeviation(normative, projectImpl)
  };
}
```

### 场景 3: 缺失规范

```javascript
// 当某个细节没有规范定义
function handleMissingSpec(context) {
  // 规则：登记 Spec Gap，使用项目校准或保守默认
  logSpecGap(context);
  return context.projectCalibration || CONSERVATIVE_DEFAULT;
}
```

## 提高准确性的最佳实践

### 1. 使用类型化输入

```typescript
interface PageGenerationInput {
  pageType: PageType;              // 枚举，不是 string
  pageMode: PageMode;              // 枚举，不是 string
  fields: FieldDefinition[];       // 结构化，不是 any[]
  actions: ActionDefinition[];     // 结构化，不是 any[]
  reference?: ReferenceImage;      // 明确类型
}
```

### 2. 预验证输入

```javascript
function validateInput(input) {
  // 检查必需字段
  assert(input.pageType, 'pageType is required');
  assert(PAGE_TYPES.includes(input.pageType), 'invalid pageType');
  
  // 检查组合有效性
  if (input.pageType === 'DETAIL') {
    assert(!input.pageMode, 'DETAIL does not have pageMode');
  }
  
  // 检查字段完整性
  input.fields.forEach(field => {
    assert(field.name, 'field name required');
    assert(field.type, 'field type required');
  });
}
```

### 3. 生成报告

每次生成后输出详细报告：

```javascript
const report = {
  input: {...},
  decisions: [
    {
      decision: 'Use line tabs for business view',
      reason: 'LEDGER type requires line tabs per normative spec',
      source: 'GENERATIVE-SPEC.md#ledger-business-view'
    },
    {
      decision: 'Surface radius 16px',
      reason: 'Project calibration standard',
      source: 'project-calibration.md#surface-geometry'
    }
  ],
  warnings: [
    {
      type: 'spec-gap',
      description: 'Icon for "export" action not specified',
      fallback: 'Used common export icon from project'
    }
  ],
  output: {...}
};
```

### 4. 增量验证

生成过程中逐步验证：

```javascript
function generateWithValidation(input) {
  // 1. 生成结构
  const structure = generateStructure(input);
  assert(validateStructure(structure), 'Invalid structure');
  
  // 2. 应用样式
  const styled = applyStyles(structure);
  assert(validateStyles(styled), 'Invalid styles');
  
  // 3. 添加交互
  const interactive = addInteractions(styled);
  assert(validateInteractions(interactive), 'Invalid interactions');
  
  // 4. 最终验证
  assert(validateComplete(interactive), 'Final validation failed');
  
  return interactive;
}
```

## 持续改进

### 收集反馈

```javascript
// 收集用户对生成结果的反馈
const feedback = {
  generationId: 'gen-12345',
  rating: 4.5,
  issues: [
    'Color slightly off',
    'Spacing too tight'
  ],
  corrections: [
    { from: '#2196f3', to: '#1976d2' },
    { from: '12px', to: '16px' }
  ]
};

// 用于改进生成规则
updateGenerationRules(feedback);
```

### 版本演进

```javascript
// v1.0.0 -> v1.1.0
const improvements = {
  added: [
    'Reference screenshot matching',
    'Visual calibration checks'
  ],
  fixed: [
    'Color token usage',
    'Spacing consistency'
  ],
  consistency: {
    before: '85%',
    after: '95%'
  }
};
```

---

**目标**: 生成确定性 > 95%，准确性 > 90%  
**方法**: 明确输入 + 参考约束 + 规则锁定 + 增量验证  
**最后更新**: 2026-09-17
