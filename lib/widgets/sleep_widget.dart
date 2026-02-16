import 'package:flutter/material.dart';
import 'package:health/health.dart';

class SleepWidget extends StatefulWidget {
  const SleepWidget({super.key});

  @override
  State<SleepWidget> createState() => _SleepWidgetState();
}

class _SleepWidgetState extends State<SleepWidget> {
  final Health _health = Health();
  Duration? _sleepDuration;
  bool _loading = true;
  bool _authorized = false;

  @override
  void initState() {
    super.initState();
    _initHealth();
  }

  Future<void> _initHealth() async {
    final types = [HealthDataType.SLEEP_ASLEEP];
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
      print("❌ Sleep permission not granted");
      setState(() => _loading = false);
      return;
    }

    await _fetchSleep();
  }

  Future<void> _fetchSleep() async {
    final now = DateTime.now();

    // Look at last 24 hours
    final yesterday = now.subtract(const Duration(hours: 24));

    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: yesterday,
        endTime: now,
        types: [HealthDataType.SLEEP_ASLEEP],
      );

      final uniqueData = data.toSet().toList();

      Duration totalSleep = Duration.zero;

      for (var d in uniqueData) {
        final start = d.dateFrom;
        final end = d.dateTo;
        totalSleep += end.difference(start);
      }

      setState(() {
        _sleepDuration = totalSleep;
        _loading = false;
      });

      print("Total sleep: $_sleepDuration");
    } catch (e) {
      print("Error fetching sleep: $e");
      setState(() => _loading = false);
    }
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    return "${hours}h ${minutes}m";
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_authorized) {
      return const Center(
        child: Text(
          "Sleep permission not granted",
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return Center(
      child: Text(
        _sleepDuration != null && _sleepDuration != Duration.zero
            ? "Sleep: ${_formatDuration(_sleepDuration!)}"
            : "No sleep data",
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
