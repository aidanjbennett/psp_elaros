import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/screens/dashboard_shell.dart';
import 'package:psp_elaros/screens/metrics_screen.dart';
import 'package:psp_elaros/screens/goals_screen.dart';
import 'package:psp_elaros/screens/trends_screen.dart';
import 'package:psp_elaros/screens/settings/root_settings.dart';
import 'package:psp_elaros/screens/settings/submenus/colour_settings_submenu.dart';
import 'package:psp_elaros/screens/settings/submenus/data_settings_submenu.dart';
import 'package:psp_elaros/screens/settings/submenus/health_biometrics_settings_submenu.dart';
import 'package:psp_elaros/screens/settings/submenus/heart_rate_settings_submenu.dart';
import 'package:psp_elaros/screens/settings/submenus/motion_settings_submenu.dart';
import 'package:psp_elaros/screens/settings/submenus/notification_settings_submenu.dart';
import 'package:psp_elaros/screens/settings/submenus/personal_info_submenu.dart';
import 'package:psp_elaros/screens/settings/submenus/typography_settings_submenu.dart';

// Keys for navigating outside the shell (e.g., full-screen settings pages)
final _rootNavigatorKey = GlobalKey<NavigatorState>();
// Key for navigating inside the bottom navigation bar
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/dashboard',
  routes: [
    // ==========================================
    // 1. BOTTOM NAVIGATION SHELL
    // ==========================================
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardShell(navigationShell: navigationShell);
      },
      branches: [
        // Tab 1: Dashboard
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',
              builder: (context, state) => const MetricsScreen(),
            ),
          ],
        ),
        // Tab 2: Trends
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/trends',
              // Assuming this should eventually be a TrendsScreen()
              // rather than re-using MetricsScreen()
              builder: (context, state) => const TrendsScreen(),
            ),
          ],
        ),
        // Tab 3: Goals
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/goals',
              // I added 'const' here based on the duplicate code,
              // assuming your GoalsScreen has a const constructor
              builder: (context, state) => GoalsScreen,
            ),
          ],
        ),
      ],
    ),

    // ==========================================
    // 2. ROOT LEVEL ROUTES (Full Screen)
    // ==========================================
    GoRoute(
      path: '/settings',
      parentNavigatorKey: _rootNavigatorKey, // Forces settings to overlay the bottom nav
      builder: (context, state) => const RootSettings(),
      routes: [
        GoRoute(
          path: 'colour',
          builder: (context, state) => const ColourSettingsSubmenu(),
        ),
        GoRoute(
          path: 'motion',
          builder: (context, state) => const MotionSettingsSubmenu(),
        ),
        GoRoute(
          path: 'notification',
          builder: (context, state) => const NotificationSettingsSubmenu(),
        ),
        GoRoute(
          path: 'typography',
          builder: (context, state) => const TypographySettingsSubmenu(),
        ),
        GoRoute(
          path: 'personal_info',
          builder: (context, state) => const PersonalInfoSettingsSubmenu(),
        ),
        GoRoute(
          path: 'health_biometrics',
          builder: (context, state) => const HealthBiometricsSubmenu(),
        ),
        GoRoute(
          path: 'heart_rate',
          builder: (context, state) => const HRZonesSettingsSubmenu(),
        ),
        GoRoute(
          path: 'data',
          builder: (context, state) => const ExportDataSettingsSubmenu(),
        ),
      ],
    ),
  ],
);