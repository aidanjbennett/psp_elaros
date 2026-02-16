import 'package:flutter/material.dart';
import 'package:health/health.dart';

class HeartRateWidget extends StatefulWidget {
  const HeartRateWidget({super.key});

  @override
  State<HeartRateWidget> createState() => _HeartRateWidgetState();
}

class _HeartRateWidgetState extends State<HeartRateWidget> {
  final Health _health = Health();
  int? _heartRate;
  bool _loading = true;
  bool _authorized = false;

  @override
  void initState() {
    super.initState();
    _initHealth();
  }

  Future<void> _initHealth() async {
    final types = [HealthDataType.HEART_RATE];
    final permissions = [HealthDataAccess.READ];

    // Check existing permissions first
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
      print("❌ Health Connect heart rate permission not granted");
      setState(() => _loading = false);
      return;
    }

    await _fetchHeartRate();
  }

  Future<void> _fetchHeartRate() async {
    final now = DateTime.now();
    final tenMinutesAgo = now.subtract(const Duration(minutes: 10));

    try {
      // Get heart rate data from the last 10 minutes
      final data = await _health.getHealthDataFromTypes(
        startTime: tenMinutesAgo,
        endTime: now,
        types: [HealthDataType.HEART_RATE],
      );

      // Remove duplicates manually
      final uniqueData = data.toSet().toList();

      // Take the last/latest entry
      final latest = uniqueData.isNotEmpty ? uniqueData.last : null;

      setState(() {
        _heartRate = latest != null ? (latest.value as num).toInt() : null;
        _loading = false;
      });

      print("Latest heart rate: $_heartRate bpm");
    } catch (e) {
      print("Error fetching heart rate: $e");
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
          "Health Connect heart rate permission not granted",
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return Center(
      child: Text(
        _heartRate != null
            ? 'Heart rate: $_heartRate bpm'
            : 'No heart rate data',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
