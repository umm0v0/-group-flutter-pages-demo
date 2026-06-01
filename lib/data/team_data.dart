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
  static String get projectTitle => '20241060163 温道庚 · Flutter 小组展示页';

  static String get projectSlogan =>
      '单人小组的 Git 分支协作与 Flutter Web 部署实战';

  // ────────────────────────────────────────────
  // 组员 B 负责：修改成员列表
  // ────────────────────────────────────────────
  static List<TeamMember> get members => const [
        TeamMember(
          id: 'wendao',
          name: '温道庚',
          role: '组长 & 全栈开发',
          task: '项目架构、代码审查、CI/CD 部署',
          bio: 'Flutter / Dart 开发者，专注于跨平台应用开发与团队协作实践。'
              '负责本项目从架构设计到部署上线的全流程。'
              '熟练使用 Git 分支管理、PR 审核流程与 GitHub Pages 持续交付。',
          skills: ['Flutter', 'Dart', 'Git', 'GitHub Actions', 'CI/CD', 'Riverpod'],
          avatarUrl: '',
          githubUrl: 'https://github.com/umm0v0',
        ),
      ];

  // ────────────────────────────────────────────
  // 组员 C 负责：修改项目功能列表
  // ────────────────────────────────────────────
  static List<ProjectFeature> get features => [
        const ProjectFeature(
          icon: Icons.web,
          title: 'Flutter Web 单页应用',
          description: '基于 Material Design 3 的响应式页面',
          color: Color(0xFF6366F1),
        ),
        const ProjectFeature(
          icon: Icons.account_tree,
          title: 'Git Pull Request 协作',
          description: '分支管理与代码审查流程',
          color: Color(0xFF06B6D4),
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
