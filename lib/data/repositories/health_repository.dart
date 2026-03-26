import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'package:psp_elaros/data/local/database.dart' as db;
import 'package:psp_elaros/data/models/heart_metrics_model.dart';
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
  final db.AppDatabase _db;

  HealthRepository({required db.AppDatabase database}) : _db = database;

  HealthDataType get _hrvType =>
      Platform.isIOS
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
    final start = now.subtract(const Duration(minutes: 16));

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

  Future<void> saveSleep(Sleep sleep) async {
    await _db.transaction(() async {
      final now = DateTime.now();
      final startTime = now.subtract(sleep.totalDuration);

      await _db.into(_db.sleep).insertOnConflictUpdate(
        db.SleepCompanion(
          startTime: Value(startTime),
          endTime: Value(now),
        ),
      );
    });
  }

  Future<void> saveSteps(int steps) async {
    await _db.transaction(() async {
      final now = DateTime.now();
      final timestamp = DateTime(now.year, now.month, now.day);

      await _db.into(_db.timestamps).insertOnConflictUpdate(
        db.TimestampsCompanion(
          time: Value(timestamp),
          date: Value(timestamp),
        ),
      );

      await _db.into(_db.steps).insertOnConflictUpdate(
        db.StepsCompanion(
          timestamp: Value(timestamp),
          steps: Value(steps),
        ),
      );
    });
  }

  Future<void> saveHeartMetrics(HeartMetrics metrics) async {
    await _db.transaction(() async {
      final zoneId = await _db.into(_db.heartRateZones).insertOnConflictUpdate(
        db.HeartRateZonesCompanion(
          restingLower: const Value(50),
          restingUpper: const Value(70),
          exerciseLower: const Value(70),
          exerciseHigher: const Value(140),
          exertionLower: const Value(140),
          exertionUpper: const Value(180),
        ),
      );

      for (final hr in metrics.heartRates) {
        final timestamp = hr.timestamp;

        await _db.into(_db.timestamps).insertOnConflictUpdate(
          db.TimestampsCompanion(
            time: Value(timestamp),
            date: Value(timestamp),
          ),
        );

        await _db.into(_db.heartRate).insertOnConflictUpdate(
          db.HeartRateCompanion(
            timestamp: Value(timestamp),
            dailyAvg: Value(hr.value.round()),
            hrZone: Value(zoneId),
          ),
        );
      }

      if (metrics.averageHrv != null) {
        for (final hrv in metrics.hrvRates) {
          final timestamp = hrv.dateFrom;

          await _db.into(_db.timestamps).insertOnConflictUpdate(
            db.TimestampsCompanion(
              time: Value(timestamp),
              date: Value(timestamp),
            ),
          );

          await _db.into(_db.hrv).insertOnConflictUpdate(
            db.HrvCompanion(
              hrv: Value(hrv.value.round()),
              timestamp: Value(timestamp),
            ),
          );
        }
      }
    });
  }

  Future<void> saveBaseline({
    required int maxHr,
    required DateTime minHrDate,
    required int maxHrv,
  }) async {
    await _db.transaction(() async {
      await _db.into(_db.baseline).insertOnConflictUpdate(
        db.BaselineCompanion(
          maxHr: Value(maxHr),
          minHrDate: Value(minHrDate),
          maxHrv: Value(maxHrv),
        ),
      );
    });
  }

  Future<void> saveHealthOverview({
    required int sleepId,
    required int stepsId,
    required int hrvValue,
    required int baselineId,
  }) async {
    await _db.transaction(() async {
      await _db.into(_db.healthOverview).insertOnConflictUpdate(
        db.HealthOverviewCompanion(
          sleepId: Value(sleepId),
          stepsId: Value(stepsId),
          hrv: Value(hrvValue),
          baselineId: Value(baselineId),
        ),
      );
    });
  }

  Future<HeartMetrics> getHeartMetrics() async {
    final heartRates = await getHeartRateList();
    final hrvRates = await getHeartRateVariabilityRate();

    double? avgHeartRate;
    double? avgHrv;

    if (heartRates.isNotEmpty) {
      final sum =
      heartRates.map((e) => e.value).reduce((a, b) => a + b);
      avgHeartRate = sum / heartRates.length;
    }

    if (hrvRates.isNotEmpty) {
      final sum =
      hrvRates.map((e) => e.value).reduce((a, b) => a + b);
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