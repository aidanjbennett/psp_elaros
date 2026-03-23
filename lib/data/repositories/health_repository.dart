import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'package:psp_elaros/data/models/heart_rate_data_model.dart';
import 'package:psp_elaros/data/models/heart_rate_variability_rate_model.dart';
import 'package:psp_elaros/data/models/sleep_model.dart';

class HeartMetrics {
  final List<HeartRate> heartRates;
  final List<HeartRateVariabilityRate> hrvRates;
  final double? averageHeartRate;
  final double? averageHrv;

  HeartMetrics({
    required this.heartRates,
    required this.hrvRates,
    required this.averageHeartRate,
    required this.averageHrv,
  });
}

class HealthRepository {
  final Health _health = Health();

  HealthDataType get _hrvType => Platform.isIOS
      ? HealthDataType.HEART_RATE_VARIABILITY_SDNN
      : HealthDataType.HEART_RATE_VARIABILITY_RMSSD;

  static const _baseTypes = [
    HealthDataType.STEPS,
    HealthDataType.HEART_RATE,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
    HealthDataType.SLEEP_AWAKE,
  ];

  static const _sleepTypes = [
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
    HealthDataType.SLEEP_AWAKE,
  ];

  List<HealthDataType> get _types => [..._baseTypes, _hrvType];

  Future<bool> requestPermissions() async {
    return await _health.requestAuthorization(
      _types,
      permissions: _types.map((_) => HealthDataAccess.READ).toList(),
    );
  }

  Future<int> getSteps() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    final stepsOrNull = await _health.getTotalStepsInInterval(midnight, now);
    final steps = stepsOrNull ?? 0;

    if (kDebugMode) print("Steps today: $steps");

    return steps;
  }

  Future<List<HeartRate>> getHeartRateList() async {
    final now = DateTime.now();
    final start = now.subtract(const Duration(hours: 2));

    if (kDebugMode) print("Fetching heart rate from $start to $now");

    try {
      List<HealthDataPoint> data = await _health.getHealthDataFromTypes(
        startTime: start,
        endTime: now,
        types: [HealthDataType.HEART_RATE],
      );

      final uniqueData = _health.removeDuplicates(data);

      if (kDebugMode) {
        print("Heart rate data points: ${uniqueData.length}");
        for (final point in uniqueData) {
          print("  ${point.dateFrom} | value: ${point.value}");
        }
      }

      return uniqueData
          .map((point) => HeartRate.fromHealthPoint(point))
          .toList();
    } catch (e) {
      if (kDebugMode) print("Error fetching heart rate: $e");
      return [];
    }
  }

  Future<List<HeartRateVariabilityRate>> getHeartRateVariabilityRate() async {
    final now = DateTime.now();
    final start = now.subtract(const Duration(hours: 24));

    if (kDebugMode) print("Fetching HRV from $start to $now");

    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: start,
        endTime: now,
        types: [_hrvType],
      );

      final uniqueData = _health.removeDuplicates(data);

      if (kDebugMode) {
        print("HRV data points: ${uniqueData.length}");
        for (final point in uniqueData) {
          print("  ${point.dateFrom} | value: ${point.value}");
        }
      }

      return uniqueData.map((point) {
        return HeartRateVariabilityRate.fromHealthData(point);
      }).toList();
    } catch (e) {
      if (kDebugMode) print("Error fetching HRV: $e");
      return [];
    }
  }

  Future<Sleep> getLastNightSleep() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day - 1, 20, 0);
    final end = DateTime(now.year, now.month, now.day, 10, 0);

    if (kDebugMode) {
      print("Fetching sleep from $start to $end");
      print("Sleep types: $_sleepTypes");
    }

    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: start,
        endTime: end,
        types: _sleepTypes,
      );

      final uniqueData = _health.removeDuplicates(data);

      if (kDebugMode) print("Unique sleep data points: ${uniqueData.length}");

      Duration totalSleep = Duration.zero;

      for (final point in uniqueData) {
        if (point.type == HealthDataType.SLEEP_AWAKE) continue;

        final duration = point.dateTo.difference(point.dateFrom);
        totalSleep += duration;
      }

      if (kDebugMode) print("Total sleep: ${totalSleep.inMinutes} minutes");

      return Sleep(totalDuration: totalSleep, dateChecked: now);
    } catch (e) {
      if (kDebugMode) print("Error fetching sleep data: $e");
      return Sleep(totalDuration: Duration.zero, dateChecked: now);
    }
  }

  Future<HeartMetrics> getHeartMetrics() async {
    final heartRates = await getHeartRateList();
    final hrvRates = await getHeartRateVariabilityRate();

    double? avgHeartRate;
    double? avgHrv;

    if (heartRates.isNotEmpty) {
      final sum = heartRates.map((e) => e.value).reduce((a, b) => a + b);
      avgHeartRate = sum / heartRates.length;
    }

    if (hrvRates.isNotEmpty) {
      final sum = hrvRates.map((e) => e.value).reduce((a, b) => a + b);
      avgHrv = sum / hrvRates.length;
    }

    if (kDebugMode) {
      print("Heart metrics:");
      print("  HR count: ${heartRates.length}");
      print("  HR avg: $avgHeartRate");
      print("  HRV count: ${hrvRates.length}");
      print("  HRV avg: $avgHrv");
    }

    return HeartMetrics(
      heartRates: heartRates,
      hrvRates: hrvRates,
      averageHeartRate: avgHeartRate,
      averageHrv: avgHrv,
    );
  }
}
