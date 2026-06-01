# 团队技术展示门户 — Flutter Web 项目

《Flutter实战·第二版》课后实践项目 · 单人小组 Git 分支协作与 Flutter Web 部署实战

## 项目结构

```
lib/
├── main.dart                     # 入口
├── app.dart                      # MaterialApp.router
├── core/
│   ├── theme/                    # 亮/暗主题、色板、字体体系
│   ├── router/                   # GoRouter 路由配置
│   └── constants/                # 应用常量
├── models/                       # 数据模型（TeamMember、ProjectFeature、ReleaseNote）
├── data/
│   ├── team_data.dart            # ★ 4 块独立数据，组员各自修改
│   └── repositories/             # Repository 模式（抽象接口 + 本地实现）
├── features/
│   ├── home/                     # 首页（Hero、成员、功能、发布说明、页脚）
│   ├── members/                  # 成员详情页
│   └── roadmap/                  # 项目路线图
└── shared/widgets/               # 共享组件（响应式容器、毛玻璃卡片、技能标签）
```

## 技术栈

| 层 | 技术 |
|---|------|
| 框架 | Flutter 3.41 + Dart 3.11 |
| 状态管理 | flutter_riverpod |
| 路由 | go_router |
| 主题 | Material Design 3 亮/暗切换 |
| HTTP | dio（后端预留） |
| 架构 | Clean Architecture + Repository 模式 |

## 页面

| 路由 | 页面 | 说明 |
|------|------|------|
| `/` | 首页 | Hero 波浪动画 + 成员卡片 + 功能网格 + 发布说明时间线 |
| `/members/:id` | 成员详情 | 大头像、技能标签、任务分工 |
| `/roadmap` | 项目路线图 | 版本迭代时间线 |

## 模拟多人 Git 协作流程

```
main (骨架数据)
  ├── feature/member-a-title-slogan      (组员A: 修改标题口号)
  ├── feature/member-b-members           (组员B: 补充成员信息)
  ├── feature/member-c-features          (组员C: 完善功能列表)
  └── feature/member-d-release-notes     (组员D: 完善发布说明)
```

4 个分支通过 `git commit --author` 伪造不同作者，`git merge --no-ff` 保留完整分支历史。

## 本地运行

```bash
flutter pub get
flutter run -d chrome
```

## 构建 Web

```bash
flutter build web --base-href /-group-flutter-pages-demo/
```

## GitHub Pages

站点地址: https://umm0v0.github.io/-group-flutter-pages-demo/

需要在仓库 Settings → Pages 中启用:
- Source: Deploy from a branch
- Branch: gh-pages → / (root) → Save
