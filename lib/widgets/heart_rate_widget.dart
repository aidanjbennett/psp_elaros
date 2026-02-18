import 'package:flutter/foundation.dart';
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
      if (kDebugMode) {
        print("Health Connect heart rate permission not granted");
      }
      setState(() => _loading = false);
      return;
    }

    await _fetchHeartRate();
  }

  Future<void> _fetchHeartRate() async {
    final now = DateTime.now();
    // FIX 2: Widened from 10 minutes to 3 hours to account for
    // wearable/Health Connect sync delays (often 15–30+ mins)
    final start = now.subtract(const Duration(hours: 3));

    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: start,
        endTime: now,
        types: [HealthDataType.HEART_RATE],
      );

      // FIX 3: Replaced .toSet().toList() with the built-in deduplication
      // method — HealthDataPoint doesn't implement == so Set was ineffective
      final uniqueData = _health.removeDuplicates(data);

      // FIX 4: Sort ascending so .last is genuinely the most recent reading
      uniqueData.sort((a, b) => a.dateFrom.compareTo(b.dateFrom));

      final latest = uniqueData.isNotEmpty ? uniqueData.last : null;

      setState(() {
        // FIX 1: Cast to NumericHealthValue first before reading the numeric
        // value — HealthDataPoint.value is a HealthValue object, not a raw num
        _heartRate = latest != null
            ? (latest.value as NumericHealthValue).numericValue.toInt()
            : null;
        _loading = false;
      });

      if (kDebugMode) {
        print("Latest heart rate: $_heartRate bpm");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching heart rate: $e");
      }
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
