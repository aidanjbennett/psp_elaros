import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/data/local/db_instance.dart';
import 'package:psp_elaros/services/hrv_service.dart';
import 'package:psp_elaros/style/app_style.dart';
import 'package:psp_elaros/models/trend_enums.dart';
import 'package:psp_elaros/services/trends_selection.dart';

import '../data/local/database.dart' as db_model;

class MetricsScreen extends StatefulWidget {
  const MetricsScreen({super.key});

  @override
  State<MetricsScreen> createState() => _MetricsScreenState();
}

class _MetricsScreenState extends State<MetricsScreen> {
  final HrvService _hrvService = HrvService();

  String _hrv = '-- ms';
  bool _loading = true;
  bool _goodHrvStatus = false;

  void _openTrends(MetricType metric) {
    TrendsSelection.selectedMetric.value = metric;
    StatefulNavigationShell.of(context).goBranch(1);
  }

  void _openGoals() {
    StatefulNavigationShell.of(context).goBranch(2);
  }

  Widget _buildTappableDashboardRow({
    required BuildContext context,
    required IconData icon,
    required Color avatarColor,
    required String title,
    required String statusText,
    required Color statusColor,
    required IconData statusIcon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: avatarColor,
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Text(
                statusText,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                radius: 18,
                backgroundColor: statusColor,
                child: Icon(statusIcon, color: Colors.white, size: 24),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopCard(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _openTrends(MetricType.heartRate),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.pinkAccent,
                    child: Icon(Icons.monitor_heart, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Heart Rate",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Status",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.deepOrangeAccent,
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.chevron_right),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    "HRV:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 5),
                  StreamBuilder<List<db_model.HrvData>>(
                    stream: (database.select(database.hrv)
                      ..where(
                            (tbl) => tbl.timestamp.isBiggerOrEqualValue(
                          DateTime.now().subtract(const Duration(days: 1)),
                        ),
                      ))
                        .watch(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        );
                      }

                      final data = snapshot.data!;

                      if (data.isEmpty) {
                        return const Text(
                          '-- ms',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }

                      final avg = data
                          .map((e) => e.hrv)
                          .reduce((a, b) => a + b) ~/
                          data.length;

                      return Text(
                        '$avg ms',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    _goodHrvStatus ? 'Good HRV' : 'Bad HRV',
                    style: TextStyle(
                      fontSize: 18,
                      color: _goodHrvStatus ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "Update on the user here",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLowerCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          _buildTappableDashboardRow(
            context: context,
            icon: Icons.bed,
            avatarColor: Colors.purple,
            title: "Sleep",
            statusText: "All good",
            statusColor: Colors.green,
            statusIcon: Icons.check,
            onTap: () => _openTrends(MetricType.sleep),
          ),
          const Divider(thickness: 2),
          _buildTappableDashboardRow(
            context: context,
            icon: Icons.location_searching,
            avatarColor: Colors.yellow,
            title: "Goals",
            statusText: "On track",
            statusColor: Colors.green,
            statusIcon: Icons.check,
            onTap: () {
              context.go('/goals');
            },
          ),
          const Divider(thickness: 2),
          _buildTappableDashboardRow(
            context: context,
            icon: Icons.directions_walk,
            avatarColor: Colors.lightBlue,
            title: "Steps",
            statusText: "On track",
            statusColor: Colors.green,
            statusIcon: Icons.check,
            onTap: () => _openTrends(MetricType.steps),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.go('/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Status Overview", style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 16),
            _buildTopCard(context),
            const SizedBox(height: 10),
            _buildLowerCard(context),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}