import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:group_flutter_pages_demo/features/home/home_page.dart';
import 'package:group_flutter_pages_demo/features/members/member_detail_page.dart';
import 'package:group_flutter_pages_demo/features/roadmap/roadmap_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/members/:id',
        name: 'memberDetail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return MemberDetailPage(memberId: id);
        },
      ),
      GoRoute(
        path: '/roadmap',
        name: 'roadmap',
        builder: (context, state) => const RoadmapPage(),
      ),
    ],
  );
});
