import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

class HealthRepository {
  final Health _health = Health();

  // SDNN is iOS/HealthKit only. Android Health Connect only supports RMSSD.
  // Use the correct type per platform.
  HealthDataType get _hrvType => Platform.isIOS
      ? HealthDataType.HEART_RATE_VARIABILITY_SDNN
      : HealthDataType.HEART_RATE_VARIABILITY_RMSSD;

  static const _baseTypes = [
    // Steeps
    HealthDataType.STEPS,
    // Heart Rate
    HealthDataType.HEART_RATE,
    // Sleep
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
  ];

  // Full list including the platform-specific HRV type
  List<HealthDataType> get _types => [..._baseTypes, _hrvType];

  Future<bool> requestPermissions() async {
    return await _health.requestAuthorization(
      _types,
      permissions: _types.map((_) => HealthDataAccess.READ).toList(),
    );
  }

  Future<List<HealthDataPoint>> fetchRecent({
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: from,
        endTime: to,
        types: _types,
      );
      return _health.removeDuplicates(data);
    } catch (e) {
      // Log or handle gracefully — background tasks must not throw unhandled
      if (kDebugMode) {
        print('HealthRepository fetch error: $e');
      }
      return [];
    }
  }
}
