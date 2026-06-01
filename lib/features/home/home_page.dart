import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_flutter_pages_demo/data/team_data.dart';
import 'package:group_flutter_pages_demo/data/repositories/team_repository.dart';
import 'package:group_flutter_pages_demo/features/home/widgets/hero_section.dart';
import 'package:group_flutter_pages_demo/features/home/widgets/members_section.dart';
import 'package:group_flutter_pages_demo/features/home/widgets/features_section.dart';
import 'package:group_flutter_pages_demo/features/home/widgets/release_timeline.dart';
import 'package:group_flutter_pages_demo/features/home/widgets/site_footer.dart';
import 'package:group_flutter_pages_demo/core/theme/app_theme.dart';
import 'package:group_flutter_pages_demo/core/theme/app_colors.dart';

final teamDataProvider = FutureProvider<TeamPageData>((ref) async {
  // 模拟异步加载，为未来接入后端 API 预留
  await Future<void>.delayed(const Duration(milliseconds: 500));
  return TeamPageData(
    projectTitle: TeamData.projectTitle,
    projectSlogan: TeamData.projectSlogan,
    members: TeamData.members,
    features: TeamData.features,
    releaseNotes: TeamData.releaseNotes,
  );
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final teamData = ref.watch(teamDataProvider);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: const Text('团队技术展示门户'),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withAlpha(20),
                      AppColors.gradientEnd.withAlpha(10),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Theme.of(context).brightness == Brightness.dark
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
                onPressed: () {
                  ref.read(themeModeProvider.notifier).state =
                      Theme.of(context).brightness == Brightness.dark
                          ? ThemeMode.light
                          : ThemeMode.dark;
                },
                tooltip: '切换主题',
              ),
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    applicationName: '团队技术展示门户',
                    applicationVersion: '2.0.0',
                    applicationIcon: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.gradientEnd],
                        ),
                      ),
                      child: const Icon(Icons.groups, color: Colors.white),
                    ),
                    children: [
                      const Text('《Flutter实战·第二版》课后实践项目'),
                      const Text('单人小组 Git 分支协作与 Flutter Web 部署'),
                    ],
                  );
                },
                tooltip: '关于',
              ),
            ],
          ),
          teamData.when(
            data: (data) => SliverList(
              delegate: SliverChildListDelegate([
                HeroSection(
                  title: data.projectTitle,
                  slogan: data.projectSlogan,
                ),
                const SizedBox(height: 40),
                MembersSection(members: data.members),
                const SizedBox(height: 40),
                FeaturesSection(features: data.features),
                const SizedBox(height: 40),
                ReleaseTimeline(releaseNotes: data.releaseNotes),
                const SizedBox(height: 40),
                const AppFooter(),
              ]),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => SliverFillRemaining(
              child: Center(child: Text('加载失败: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
