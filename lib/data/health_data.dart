import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

class HealthData {
  final Health _health = Health();

  HealthDataType get _hrvType => Platform.isIOS
      ? HealthDataType.HEART_RATE_VARIABILITY_SDNN
      : HealthDataType.HEART_RATE_VARIABILITY_RMSSD;

  // ----------------------------
  // STEPS
  // ----------------------------

  Future<int> getSteps() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    return await _health.getTotalStepsInInterval(midnight, now) ?? 0;
  }

  Future<int> getDailyAverageSteps() => getSteps();

  Future<int> getWeeklyAverageSteps() async {
    final now = DateTime.now();
    final weekAgo = now.subtract(const Duration(days: 7));
    final total = await _health.getTotalStepsInInterval(weekAgo, now) ?? 0;
    return (total / 7).round();
  }

  Future<int> getMonthlyAverageSteps() async {
    final now = DateTime.now();
    final monthAgo = now.subtract(const Duration(days: 30));
    final total = await _health.getTotalStepsInInterval(monthAgo, now) ?? 0;
    return (total / 30).round();
  }

  // ----------------------------
  // HEART RATE
  // ----------------------------

  Future<int> getDailyAverageHeartRate() async {
    final now = DateTime.now();
    return _averageHeartRateInRange(
      DateTime(now.year, now.month, now.day),
      now,
    );
  }

  Future<int> getWeeklyAverageHeartRate() {
    final now = DateTime.now();
    return _averageHeartRateInRange(now.subtract(const Duration(days: 7)), now);
  }

  Future<int> getMonthlyAverageHeartRate() {
    final now = DateTime.now();
    return _averageHeartRateInRange(
      now.subtract(const Duration(days: 30)),
      now,
    );
  }

  Future<int> _averageHeartRateInRange(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: start,
        endTime: end,
        types: [HealthDataType.HEART_RATE],
      );

      final unique = _health.removeDuplicates(data);

      if (unique.isEmpty) return 0;

      final values = unique.map(
        (p) => (p.value as NumericHealthValue).numericValue.toDouble(),
      );
      return (values.reduce((a, b) => a + b) / values.length).round();
    } catch (e) {
      if (kDebugMode) print("Error fetching heart rate: $e");
      return 0;
    }
  }

  Future<String> getDailyHrv() {
    final now = DateTime.now();
    return _latestHrvInRange(DateTime(now.year, now.month, now.day), now);
  }

  Future<String> getWeeklyHrv() {
    final now = DateTime.now();
    return _latestHrvInRange(now.subtract(const Duration(days: 7)), now);
  }

  Future<String> getMonthlyHrv() {
    final now = DateTime.now();
    return _latestHrvInRange(now.subtract(const Duration(days: 30)), now);
  }

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
}
