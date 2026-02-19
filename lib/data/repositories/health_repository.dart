import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'package:psp_elaros/data/models/heart_rate_data_model.dart';
import 'package:psp_elaros/data/models/heart_rate_variability_rate_model.dart';
import 'package:psp_elaros/data/models/sleep_model.dart';

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

  static const _sleepTypes = [
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
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

    return steps;
  }

  Future<List<HeartRate>> getHeartRateList() async {
    final now = DateTime.now();
    final start = now.subtract(
      const Duration(minutes: 16),
    ); // Slight overlap for safety

    try {
      List<HealthDataPoint> data = await _health.getHealthDataFromTypes(
        startTime: start,
        endTime: now,
        types: [HealthDataType.HEART_RATE],
      );

      final uniqueData = _health.removeDuplicates(data);

      return uniqueData
          .map((point) => HeartRate.fromHealthPoint(point))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching heart rate: $e");
      }
      return [];
    }
  }

  Future<List<HeartRateVariabilityRate>> getHeartRateVariabilityRate() async {
    final now = DateTime.now();
    final start = now.subtract(const Duration(minutes: 20));

    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: start,
        endTime: now,
        types: [_hrvType],
      );

      // Filter duplicates to keep the data clean
      final uniqueData = _health.removeDuplicates(data);

      if (kDebugMode) {
        print(uniqueData);
      }
      // Map the raw HealthDataPoint objects to our custom Model
      return uniqueData.map((point) {
        return HeartRateVariabilityRate.fromHealthData(point);
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching HRV: $e");
      }
      return [];
    }
  }

  Future<Sleep> getLastNightSleep() async {
    final now = DateTime.now();
    // Query from 8pm two days ago to 10am today to reliably capture last night
    final start = DateTime(now.year, now.month, now.day - 1, 20, 0);
    final end = DateTime(now.year, now.month, now.day, 10, 0);

    try {
      final data = await _health.getHealthDataFromTypes(
        startTime: start,
        endTime: end,
        types: _sleepTypes,
      );
      final uniqueData = _health.removeDuplicates(data);

      double light = 0;
      double deep = 0;
      double rem = 0;
      double asleep = 0; // fallback for platforms without stage detail
      Duration totalSleep = Duration.zero;

      for (var point in uniqueData) {
        final duration = point.dateTo.difference(point.dateFrom);
        final hours = duration.inMinutes / 60.0;

        switch (point.type) {
          case HealthDataType.SLEEP_LIGHT:
            light += hours;
            totalSleep += duration; // only count stages, not summaries
            break;
          case HealthDataType.SLEEP_DEEP:
            deep += hours;
            totalSleep += duration;
            break;
          case HealthDataType.SLEEP_REM:
            rem += hours;
            totalSleep += duration;
            break;
          case HealthDataType.SLEEP_ASLEEP:
            asleep += hours; // used as fallback below
            break;
          default:
            break; // skip SLEEP_IN_BED and other summary types
        }
      }

      // If no stage detail was available, fall back to SLEEP_ASLEEP total
      final bool hasStageData = light > 0 || deep > 0 || rem > 0;
      if (!hasStageData && asleep > 0) {
        totalSleep = Duration(minutes: (asleep * 60).round());
      }

      if (kDebugMode) {
        print(
          "Sleep zones — Light: $light, Deep: $deep, REM: $rem, Asleep fallback: $asleep",
        );
        print("Total sleep: ${totalSleep.inMinutes} minutes");
      }

      return Sleep(
        totalDuration: totalSleep,
        lightHours: light,
        deepHours: deep,
        remHours: rem,
        dateChecked: now,
      );
    } catch (e) {
      if (kDebugMode) print("Error fetching sleep data: $e");
      return Sleep(
        totalDuration: Duration.zero,
        lightHours: 0,
        deepHours: 0,
        remHours: 0,
        dateChecked: now,
      );
    }
  }
}
