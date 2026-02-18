import 'dart:io';
import 'package:flutter/foundation.dart';
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

  // FIX: SDNN is iOS/HealthKit only. Android Health Connect only supports RMSSD.
  // Use the correct type per platform.
  HealthDataType get _hrvType => Platform.isIOS
      ? HealthDataType.HEART_RATE_VARIABILITY_SDNN
      : HealthDataType.HEART_RATE_VARIABILITY_RMSSD;

  String get _hrvLabel => Platform.isIOS ? 'HRV (SDNN)' : 'HRV (RMSSD)';

  @override
  void initState() {
    super.initState();
    _initHealth();
  }

  Future<void> _initHealth() async {
    final types = [_hrvType];
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
      if (kDebugMode) {
        print("Health Connect HRV permission not granted");
      }
      setState(() => _loading = false);
      return;
    }

    await _fetchHRV();
  }

  Future<void> _fetchHRV() async {
    final now = DateTime.now();
    // Widened to 24 hours — RMSSD is only recorded during sleep by most
    // wearables, so 3 hours from now will miss last night's data entirely
    final start = now.subtract(const Duration(hours: 24));

    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: start,
        endTime: now,
        types: [_hrvType],
      );

      final uniqueData = _health.removeDuplicates(data);

      uniqueData.sort((a, b) => a.dateFrom.compareTo(b.dateFrom));

      final latest = uniqueData.isNotEmpty ? uniqueData.last : null;

      setState(() {
        _hrv = latest != null
            ? (latest.value as NumericHealthValue).numericValue.toDouble()
            : null;
        _loading = false;
      });

      if (kDebugMode) {
        print("Latest $_hrvLabel: $_hrv ms");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching HRV: $e");
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
          "Health Connect HRV permission not granted",
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return Center(
      child: Text(
        _hrv != null
            ? '$_hrvLabel: ${_hrv!.toStringAsFixed(1)} ms'
            : 'No HRV data',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
