#!/usr/bin/env node
/**
 * 从 SupervisionPlatform 仓库提取项目校准事实
 */

const fs = require('fs');
const path = require('path');

function extractCalibration(sourceDir, outputFile) {
  console.log('开始提取项目校准事实...');

  const sections = [];

  sections.push('# Project Calibration\n\n');
  sections.push(`> 自动生成于: ${new Date().toISOString()}\n`);
  sections.push('> 来源: SupervisionPlatform 项目\n\n');

  // 定义要分析的关键文件路径
  const keyFiles = [
    'apps/web/src/widgets/navigation/ui/TopNavigation.jsx',
    'apps/web/src/widgets/navigation/ui/TopNavigationSecondaryNav.jsx',
    'apps/web/src/features/application-global-actions/ui/ApplicationGlobalActionPopover.jsx',
    'apps/web/src/widgets/navigation/ui/ApplicationSettingsDrawer.jsx',
    'apps/web/src/shared/ui/application/ApplicationPagePrimitives.jsx',
    'apps/web/styles/02-navigation.css',
    'apps/web/styles/00-base.css'
  ];

  sections.push('## Shell 结构校准\n\n');
  sections.push('从项目实现中提取的壳层结构事实：\n\n');

  for (const file of keyFiles) {
    const filePath = path.join(sourceDir, file);
    if (fs.existsSync(filePath)) {
      const content = fs.readFileSync(filePath, 'utf-8');
      const analysis = analyzeFile(file, content);
      if (analysis) {
        sections.push(`### ${path.basename(file)}\n\n`);
        sections.push(analysis);
        sections.push('\n\n');
      }
    }
  }

  // 写入输出文件
  const outputDir = path.dirname(outputFile);
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  fs.writeFileSync(outputFile, sections.join(''));
  console.log(`✓ 项目校准事实已保存到: ${outputFile}`);
}

function analyzeFile(filename, content) {
  // 根据文件类型提取不同的信息
  if (filename.endsWith('.css')) {
    return extractCSSVariables(content);
  } else if (filename.endsWith('.jsx') || filename.endsWith('.js')) {
    return extractComponentStructure(content);
  }
  return null;
}

function extractCSSVariables(css) {
  const variables = [];
  const varRegex = /--[\w-]+:\s*[^;]+;/g;
  const matches = css.match(varRegex);

  if (matches) {
    variables.push('CSS 变量：\n\n```css\n');
    matches.slice(0, 20).forEach(v => variables.push(v + '\n'));
    variables.push('```\n');
  }

  return variables.join('');
}

function extractComponentStructure(jsx) {
  // 简单的结构分析
  const lines = jsx.split('\n');
  const imports = lines.filter(l => l.trim().startsWith('import')).slice(0, 10);

  if (imports.length > 0) {
    return '主要依赖：\n\n```javascript\n' + imports.join('\n') + '\n```\n';
  }

  return '';
}

// 命令行参数
const [,, sourceDir, outputFile] = process.argv;

if (!sourceDir || !outputFile) {
  console.error('用法: node extract-calibration.js <sourceDir> <outputFile>');
  process.exit(1);
}

if (!fs.existsSync(sourceDir)) {
  console.error(`错误: 源目录不存在: ${sourceDir}`);
  process.exit(1);
}

extractCalibration(sourceDir, outputFile);
