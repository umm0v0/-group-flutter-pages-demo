import 'package:flutter/material.dart';
import 'package:group_flutter_pages_demo/models/team_member.dart';
import 'package:group_flutter_pages_demo/models/project_feature.dart';
import 'package:group_flutter_pages_demo/models/release_note.dart';

/// 4 块独立数据，分布给 4 名组员各自修改。
/// 组员只需要修改自己负责的方法，互不冲突。

class TeamData {
  TeamData._();

  // ────────────────────────────────────────────
  // 组员 A 负责：修改标题和口号
  // ────────────────────────────────────────────
  static String get projectTitle => '小组 Flutter Web 展示页';

  static String get projectSlogan =>
      '用 Git 协作完成一次真实的小组项目发布';

  // ────────────────────────────────────────────
  // 组员 B 负责：修改成员列表
  // ────────────────────────────────────────────
  static List<TeamMember> get members => const [
        TeamMember(
          id: 'leader',
          name: '组长',
          role: '组长',
          task: '创建仓库、维护 main 分支、审核 PR、发布 GitHub Pages',
          bio: '',
          skills: [],
          avatarUrl: '',
          githubUrl: '',
        ),
        TeamMember(
          id: 'member-a',
          name: '组员 A',
          role: '组员 A',
          task: '修改首页标题和项目口号',
          bio: '',
          skills: [],
          avatarUrl: '',
          githubUrl: '',
        ),
      ];

  // ────────────────────────────────────────────
  // 组员 C 负责：修改项目功能列表
  // ────────────────────────────────────────────
  static List<ProjectFeature> get features => [
        const ProjectFeature(
          icon: Icons.web,
          title: 'Flutter Web 应用',
          description: '基于 Material Design 3 的响应式单页应用，支持亮色/暗色主题切换',
          color: Color(0xFF6366F1),
        ),
        const ProjectFeature(
          icon: Icons.account_tree,
          title: 'Git 分支协作',
          description: '多分支并行开发，Pull Request 代码审查，模拟真实团队工作流',
          color: Color(0xFF06B6D4),
        ),
        const ProjectFeature(
          icon: Icons.merge_type,
          title: 'PR 审核合并',
          description: 'GitHub Pull Request 创建、代码审查、冲突解决与合并策略实践',
          color: Color(0xFF8B5CF6),
        ),
        const ProjectFeature(
          icon: Icons.rocket_launch,
          title: 'GitHub Pages 部署',
          description: 'Flutter Web 构建产物自动发布到 GitHub Pages，实现静态站点托管',
          color: Color(0xFFF59E0B),
        ),
        const ProjectFeature(
          icon: Icons.architecture,
          title: 'Clean Architecture',
          description: '分层架构设计 — 模型层、数据层、展示层分离，Repository 模式解耦数据源',
          color: Color(0xFF10B981),
        ),
        const ProjectFeature(
          icon: Icons.animation,
          title: '动画与交互',
          description: '自定义波浪裁剪、打字机动画、悬停浮起效果、渐入动画与时间线组件',
          color: Color(0xFFEF4444),
        ),
      ];

  // ────────────────────────────────────────────
  // 组员 D 负责：修改发布说明
  // ────────────────────────────────────────────
  static List<ReleaseNote> get releaseNotes => [
        const ReleaseNote(
          version: 'v1.0.0',
          date: '2026-06-01',
          title: '初始版本',
          description: '项目初始化，待组员完善各部分内容',
          type: ReleaseNoteType.release,
        ),
      ];
}
