import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

class HrvService {
  final Health _health = Health();

  HealthDataType get _hrvType => Platform.isIOS
      ? HealthDataType.HEART_RATE_VARIABILITY_SDNN
      : HealthDataType.HEART_RATE_VARIABILITY_RMSSD;

  Future<String> _latestHrvInRange(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: start,
        endTime: end,
        types: [_hrvType],
      );

      final unique = _health.removeDuplicates(data);

      if (unique.isEmpty) return '-- ms';

      unique.sort((a, b) => b.dateFrom.compareTo(a.dateFrom));

      final value = (unique.first.value as NumericHealthValue).numericValue
          .round();

      return '$value ms';
    } catch (e) {
      if (kDebugMode) print("Error fetching HRV: $e");
      return '-- ms';
    }
  }

  Future<String> getDailyHrv() {
    final now = DateTime.now();
    return _latestHrvInRange(DateTime(now.year, now.month, now.day), now);
  }
}
