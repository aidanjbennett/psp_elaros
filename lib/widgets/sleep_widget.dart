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

  // FIX 1: Request all sleep stage types, not just SLEEP_ASLEEP.
  // Health Connect splits sleep into multiple sub-types — querying only
  // SLEEP_ASLEEP misses LIGHT, DEEP, and REM stages entirely.
  // Note: SLEEP_IN_BED is iOS/HealthKit only — it does not exist in Android
  // Health Connect and has been intentionally excluded.
  static const _sleepTypes = [
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
  ];

  @override
  void initState() {
    super.initState();
    _initHealth();
  }

  Future<void> _initHealth() async {
    final permissions = List.filled(_sleepTypes.length, HealthDataAccess.READ);

    bool? hasPerms = await _health.hasPermissions(
      _sleepTypes,
      permissions: permissions,
    );

    if (hasPerms != true) {
      _authorized = await _health.requestAuthorization(
        _sleepTypes,
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
    final yesterday = now.subtract(const Duration(hours: 24));

    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: yesterday,
        endTime: now,
        types: _sleepTypes,
      );

      // FIX 2: Use removeDuplicates() instead of toSet().toList() —
      // HealthDataPoint doesn't implement == so Set dedup was ineffective
      final uniqueData = _health.removeDuplicates(data);

      final sleepData = uniqueData;

      Duration totalSleep = Duration.zero;
      for (var d in sleepData) {
        totalSleep += d.dateTo.difference(d.dateFrom);
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
