import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class DashboardShell extends StatelessWidget {
  // 1. Accept the shell from the router
  final StatefulNavigationShell navigationShell;

  const DashboardShell({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,

      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,

        onDestinationSelected: (int index) => _onBranch(index),

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
              icon: Icon(Icons.stacked_line_chart),
              label: 'Trends'
          ),
          NavigationDestination(
            icon: Icon(Icons.track_changes),
            label: 'Goals',
          ),
        ],
      ),
    );
  }

  void _onBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
