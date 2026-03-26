import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/services/hrv_service.dart';
import 'package:psp_elaros/style/app_style.dart';

class MetricsScreen extends StatefulWidget {
  const MetricsScreen({super.key});

  @override
  State<MetricsScreen> createState() => _MetricsScreenState();
}

class _MetricsScreenState extends State<MetricsScreen> {
  final HrvService _hrvService = HrvService();

  String _hrv = '-- ms';
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadMetrics();
  }

  Future<void> _loadMetrics() async {
    final hrv = await _hrvService.getDailyHrv();
    if (!mounted) return;
    setState(() {
      _hrv = hrv;
      _loading = false;
    });
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
              context.push('/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Status Overview",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Container(
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
                      const Text(
                        "Heart Rate",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const Spacer(),
                      const Text("Status", style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        "HRV:",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 5),
                      _loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              _hrv,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                      const SizedBox(width: 10),
                      const Text(
                        'text demo',
                        style: TextStyle(fontSize: 18, color: Colors.red),
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
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.purple,
                        child: Icon(Icons.bed, color: Colors.white),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Sleep",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'All good',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 12),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.green,
                        child: Icon(Icons.check, color: Colors.white, size: 24),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.location_searching, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        "Goals",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'On track',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 12),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.green,
                        child: Icon(Icons.check, color: Colors.white, size: 24),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.directions_walk, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        "Steps",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'On track',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 12),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.green,
                        child: Icon(Icons.check, color: Colors.white, size: 24),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
