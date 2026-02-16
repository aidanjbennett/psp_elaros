import 'package:flutter/material.dart';
import 'package:health/health.dart';

class HRVWidget extends StatefulWidget {
  const HRVWidget({super.key});

  @override
  State<HRVWidget> createState() => _HRVWidgetState();
}

class _HRVWidgetState extends State<HRVWidget> {
  final Health _health = Health();
  double? _hrv;
  bool _loading = true;
  bool _authorized = false;

  @override
  void initState() {
    super.initState();
    _initHealth();
  }

  Future<void> _initHealth() async {
    final types = [HealthDataType.HEART_RATE_VARIABILITY_SDNN];
    final permissions = [HealthDataAccess.READ];

    bool? hasPerms = await _health.hasPermissions(
      types,
      permissions: permissions,
    );

    if (hasPerms != true) {
      _authorized = await _health.requestAuthorization(
        types,
        permissions: permissions,
      );
    } else {
      _authorized = true;
    }

    if (!_authorized) {
      print("❌ Health Connect HRV permission not granted");
      setState(() => _loading = false);
      return;
    }

    await _fetchHRV();
  }

  Future<void> _fetchHRV() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    try {
      // Get HRV data for today
      final data = await _health.getHealthDataFromTypes(
        startTime: today,
        endTime: now,
        types: [HealthDataType.HEART_RATE_VARIABILITY_SDNN],
      );

      // Remove duplicates
      final uniqueData = data.toSet().toList();

      // Take the latest HRV value
      final latest = uniqueData.isNotEmpty ? uniqueData.last : null;

      setState(() {
        _hrv = latest != null ? (latest.value as num).toDouble() : null;
        _loading = false;
      });

      print("Latest HRV: $_hrv ms");
    } catch (e) {
      print("Error fetching HRV: $e");
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_authorized) {
      return const Center(
        child: Text(
          "Health Connect HRV permission not granted",
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return Center(
      child: Text(
        _hrv != null
            ? 'HRV (SDNN): ${_hrv!.toStringAsFixed(1)} ms'
            : 'No HRV data',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
