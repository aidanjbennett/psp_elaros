
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/screens/dashboard_shell.dart';
import 'package:psp_elaros/screens/metrics_screen.dart';
import 'package:psp_elaros/screens/goals_screen.dart';
import 'package:psp_elaros/screens/settings/root_settings.dart';
import 'package:psp_elaros/screens/settings/submenus/colour_settings_submenu.dart';
import 'package:psp_elaros/screens/settings/submenus/motion_settings_submenu.dart';
import 'package:psp_elaros/screens/settings/submenus/notification_settings_submenu.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
    initialLocation: '/metrics',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardShell(navigationShell: navigationShell);
        },
          branches: [
            // Metrics branch
            StatefulShellBranch(
                routes: [
                  GoRoute(
                      path: '/metrics',
                    builder: (context, state) => const MetricsScreen(),
                  )
                ]
            ),
            // Goals branch
            StatefulShellBranch(
                routes: [
                  GoRoute(
                      path: '/goals',
                    builder: (context, state) => const GoalsScreen(),
                  )
                ]
            ),
          ]
      ),
      GoRoute(
          path: '/settings',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const RootSettings(),
          routes: [
            GoRoute(
              path: 'colour',
              builder: (context, state) => const ColourSettingsSubmenu(),
            ),
            // Sub-menu: /settings/security
            GoRoute(
              path: 'motion',
              builder: (context, state) => const MotionSettingsSubmenu(),
            ),
            GoRoute(
              path: 'notification',
              builder: (context, state) => const NotificationSettingsSubmenu(),
            ),
          ]
      ),
    ]
);