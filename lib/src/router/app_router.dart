import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:namaadhu_app/src/features/home/screens/home_screen.dart';
import 'package:namaadhu_app/src/features/select_island/providers/selected_island_provider.dart';
import 'package:namaadhu_app/src/features/select_island/screens/select_island_screen.dart';
import 'package:namaadhu_app/src/features/settings/views/notifications/notification_settings_screen.dart';
import 'package:namaadhu_app/src/router/scaffold_with_bottom_nav_bar.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  selectIsland,
  search,
  home,
  settings,
}

final goRouterProvider = Provider((ref) {
  final selectedIsland = ref.watch(selectedIslandProvider);

  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/select_island',
        name: AppRoute.selectIsland.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SelectIslandScreen(),
        ),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) =>
            ScaffoldWithBottomNavBar(child: child),
        routes: [
          GoRoute(
            path: '/home',
            parentNavigatorKey: _shellNavigatorKey,
            name: AppRoute.home.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const HomeScreen(),
            ),
            redirect: (context, state) {
              if (selectedIsland.id == -1) {
                return '/select_island';
              }
              return null;
            },
          ),
          GoRoute(
            path: '/settings',
            name: AppRoute.settings.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const NotificationSettingsScreen(),
            ),
          ),
        ],
      ),
    ],
  );
});
