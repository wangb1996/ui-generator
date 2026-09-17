#!/usr/bin/env node
/**
 * 从 design-md 仓库提取规范内容并生成核心基线
 */

const fs = require('fs');
const path = require('path');

function extractNormative(sourceDir, outputFile) {
  console.log('开始提取规范内容...');

  const sections = [];

  // 读取关键文件
  const files = [
    'GENERATIVE-SPEC.md',
    '00-应用UI框架总纲.md',
    '01-设计Token.md',
    '02-应用外层框架/应用外层框架.md',
    '03-页面布局/01-列表布局/列表布局.md',
    '03-页面布局/02-卡片布局/卡片布局.md',
    '03-页面布局/03-分栏布局/分栏布局.md',
    '05-页面类型/01-工作台/工作台.md',
    '05-页面类型/02-台账/台账.md',
    '05-页面类型/03-管理页面/管理页面.md',
    '06-基础通用规范/01-视口适配/视口适配.md'
  ];

  sections.push('# Core Normative Baseline\n');
  sections.push(`> 自动生成于: ${new Date().toISOString()}\n`);
  sections.push('> 来源: design-md 仓库\n\n');

  for (const file of files) {
    const filePath = path.join(sourceDir, file);
    if (fs.existsSync(filePath)) {
      const content = fs.readFileSync(filePath, 'utf-8');
      const title = path.basename(file, '.md');
      sections.push(`## ${title}\n\n`);
      sections.push(extractKeyContent(content));
      sections.push('\n---\n\n');
    } else {
      console.warn(`文件不存在: ${filePath}`);
    }
  }

  // 写入输出文件
  const outputDir = path.dirname(outputFile);
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  fs.writeFileSync(outputFile, sections.join(''));
  console.log(`✓ 规范基线已保存到: ${outputFile}`);
}

function extractKeyContent(markdown) {
  // 简单提取：移除过多的空行，保留核心内容
  return markdown
    .split('\n')
    .filter(line => line.trim() !== '' || line === '')
    .join('\n')
    .replace(/\n{3,}/g, '\n\n');
}

// 命令行参数
const [,, sourceDir, outputFile] = process.argv;

if (!sourceDir || !outputFile) {
  console.error('用法: node extract-normative.js <sourceDir> <outputFile>');
  process.exit(1);
}

if (!fs.existsSync(sourceDir)) {
  console.error(`错误: 源目录不存在: ${sourceDir}`);
  process.exit(1);
}

extractNormative(sourceDir, outputFile);
