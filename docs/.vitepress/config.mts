import { defineConfig } from 'vitepress'

// TODO: 修改为你的项目信息
export default defineConfig({
  title: "{{PROJECT_NAME}}",
  description: "{{PROJECT_DESCRIPTION}}",
  themeConfig: {
    nav: [
      { text: '首页', link: '/' },
      { text: '快速开始', link: '/guide/getting-started' }
    ],

    sidebar: [
      {
        text: '指南',
        items: [
          { text: '快速开始', link: '/guide/getting-started' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/{{GITHUB_USERNAME}}/{{REPO_NAME}}' }
    ],

    footer: {
      message: 'Released under the MIT License.',
      copyright: 'Copyright © 2026 {{AUTHOR_NAME}}'
    }
  }
})
