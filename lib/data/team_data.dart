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
