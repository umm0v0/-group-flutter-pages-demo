import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:group_flutter_pages_demo/data/team_data.dart";
import "package:group_flutter_pages_demo/models/experiment_task.dart";
import "package:group_flutter_pages_demo/shared/widgets/section_header.dart";
import "package:group_flutter_pages_demo/core/theme/app_colors.dart";

class TasksPage extends ConsumerWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("实验任务"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              icon: Icons.checklist,
              title: "实验任务分工",
              subtitle: "6个任务项，3名成员各司其职",
            ),
            const SizedBox(height: 20),
            ...TeamData.tasks.map((task) => _buildTaskCard(context, task)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context, ExperimentTask task) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withAlpha(80),
        ),
      ),
      child: Row(
        children: [
          _buildStatusIcon(task.status),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  task.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(180),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(20),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "负责人：${task.assignee}",
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIcon(TaskStatus status) {
    switch (status) {
      case TaskStatus.completed:
        return Container(
          width: 42, height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withAlpha(25),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.check_circle, color: Color(0xFF10B981), size: 22),
        );
      case TaskStatus.inProgress:
        return Container(
          width: 42, height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFF59E0B).withAlpha(25),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.sync, color: Color(0xFFF59E0B), size: 22),
        );
      case TaskStatus.pending:
        return Container(
          width: 42, height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFEF4444).withAlpha(25),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.radio_button_unchecked, color: Color(0xFFEF4444), size: 22),
        );
    }
  }
}
