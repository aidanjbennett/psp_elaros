import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/style/app_style.dart';
import 'package:psp_elaros/models/metrics_view_model.dart';

class MetricsScreen extends StatelessWidget {
  const MetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MetricsViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("BetterTrack"),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: model.isLoading ? null : () => model.loadMetrics(),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => context.push('/settings'),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status Overview",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // HRV Status Card
                _buildHrvCard(model),

                const SizedBox(height: 16),

                // Other Metrics Container
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: [
                      _buildMetricTile(
                        icon: Icons.bed,
                        color: Colors.purple,
                        label: "Sleep",
                        status: "All good",
                      ),
                      const Divider(height: 1, indent: 16, endIndent: 16),
                      _buildMetricTile(
                        icon: Icons.location_searching,
                        color: Colors.orange,
                        label: "Goals",
                        status: "On track",
                      ),
                      const Divider(height: 1, indent: 16, endIndent: 16),
                      _buildMetricTile(
                        icon: Icons.directions_walk,
                        color: Colors.lightBlue,
                        label: "Steps",
                        status: "On track",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHrvCard(MetricsViewModel model) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.pinkAccent,
                child: Icon(Icons.monitor_heart, color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Text(
                "Heart Rate",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              const Text(
                "Status",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 18,
                backgroundColor: model.isLoading
                    ? Colors.grey[300]
                    : (model.isHrvHealthy ? Colors.green : Colors.redAccent),
                child: Icon(
                  model.isLoading
                      ? Icons.hourglass_empty
                      : (model.isHrvHealthy
                            ? Icons.check
                            : Icons.priority_high),
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Text(
                "HRV:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 12),
              if (model.isLoading)
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              else
                Text(
                  model.hrv,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              const SizedBox(width: 12),
              if (!model.isLoading)
                Text(
                  model.isHrvHealthy ? 'Healthy' : 'Low',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: model.isHrvHealthy ? Colors.green : Colors.red,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            model.isLoading ? "Syncing data..." : "Updated just now",
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile({
    required IconData icon,
    required Color color,
    required String label,
    required String status,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            status,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 14,
            backgroundColor: Colors.green,
            child: Icon(Icons.check, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
      onTap: () {
        // Navigate to detail view
      },
    );
  }
}
