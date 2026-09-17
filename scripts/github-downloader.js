#!/usr/bin/env node
/**
 * GitHub API 备选方案
 * 当 git clone 失败时使用此脚本直接从 GitHub API 下载文件
 */

const https = require('https');
const fs = require('fs');
const path = require('path');

class GitHubDownloader {
  constructor(owner, repo, branch) {
    this.owner = owner;
    this.repo = repo;
    this.branch = branch;
    this.baseUrl = `https://api.github.com/repos/${owner}/${repo}`;
  }

  async getContents(filePath) {
    const url = `${this.baseUrl}/contents/${filePath}?ref=${this.branch}`;
    return this.request(url);
  }

  async downloadFile(filePath, outputPath) {
    console.log(`下载: ${filePath}`);

    const data = await this.getContents(filePath);

    if (data.type === 'file') {
      const content = Buffer.from(data.content, 'base64').toString('utf-8');
      const fullPath = path.join(outputPath, filePath);

      // 确保目录存在
      const dir = path.dirname(fullPath);
      if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
      }

      fs.writeFileSync(fullPath, content);
      console.log(`  ✓ 已保存: ${fullPath}`);
      return true;
    } else if (data.type === 'dir') {
      // 递归下载目录
      const promises = data.map(item => {
        if (item.type === 'file') {
          return this.downloadFile(item.path, outputPath);
        }
        return Promise.resolve();
      });
      await Promise.all(promises);
      return true;
    }

    return false;
  }

  request(url) {
    return new Promise((resolve, reject) => {
      const options = {
        headers: {
          'User-Agent': 'UI-Generator-Plugin',
          'Accept': 'application/vnd.github.v3+json'
        }
      };

      https.get(url, options, (res) => {
        let data = '';

        res.on('data', (chunk) => {
          data += chunk;
        });

        res.on('end', () => {
          if (res.statusCode === 200) {
            resolve(JSON.parse(data));
          } else {
            reject(new Error(`HTTP ${res.statusCode}: ${data}`));
          }
        });
      }).on('error', (err) => {
        reject(err);
      });
    });
  }
}

// 主函数
async function main() {
  const args = process.argv.slice(2);

  if (args.length < 5) {
    console.error('用法: node github-downloader.js <owner> <repo> <branch> <filePath> <outputDir>');
    console.error('示例: node github-downloader.js wangb1996 design-md agent/design-md-v2-self-contained GENERATIVE-SPEC.md ./output');
    process.exit(1);
  }

  const [owner, repo, branch, filePath, outputDir] = args;

  console.log(`从 GitHub 下载文件...`);
  console.log(`仓库: ${owner}/${repo}`);
  console.log(`分支: ${branch}`);
  console.log(`文件: ${filePath}`);
  console.log('');

  const downloader = new GitHubDownloader(owner, repo, branch);

  try {
    await downloader.downloadFile(filePath, outputDir);
    console.log('\n✅ 下载完成');
  } catch (error) {
    console.error('\n❌ 下载失败:', error.message);
    process.exit(1);
  }
}

if (require.main === module) {
  main();
}

module.exports = GitHubDownloader;
