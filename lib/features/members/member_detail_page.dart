import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_flutter_pages_demo/data/team_data.dart';
import 'package:group_flutter_pages_demo/shared/widgets/skill_chip.dart';
import 'package:group_flutter_pages_demo/shared/widgets/responsive_wrapper.dart';
import 'package:group_flutter_pages_demo/core/theme/app_colors.dart';

class MemberDetailPage extends ConsumerWidget {
  const MemberDetailPage({required this.memberId, super.key});

  final String memberId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = TeamData.members.cast().firstWhere(
          (m) => m.id == memberId,
          orElse: () => null,
        );

    if (member == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('成员详情')),
        body: const Center(child: Text('未找到该成员')),
      );
    }

    final theme = Theme.of(context);
    final initials = member.name.characters.first;

    return Scaffold(
      appBar: AppBar(title: Text(member.name)),
      body: SingleChildScrollView(
        child: ResponsiveWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.gradientEnd],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withAlpha(60),
                      blurRadius: 24,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                member.name,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  member.role,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (member.bio.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    member.bio,
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 20),
              if (member.skills.isNotEmpty) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '技能',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: member.skills.map((s) => SkillChip(s)).toList(),
                ),
              ],
              const SizedBox(height: 32),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '分工任务',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        member.task,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              if (member.githubUrl.isNotEmpty) ...[
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: () {
                    // 在 web 中通过 url_launcher 打开，此处留作后端扩展点
                  },
                  icon: const Icon(Icons.code),
                  label: const Text('GitHub 主页'),
                ),
              ],
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
