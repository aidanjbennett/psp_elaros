import 'package:drift/drift.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart' show DateTimeRange;
import 'package:psp_elaros/data/local/database.dart';
import 'package:psp_elaros/models/trend_enums.dart';
import 'package:psp_elaros/models/zone_duration.dart';

class TrendsRepository {
  final AppDatabase _db;

  TrendsRepository({required AppDatabase database}) : _db = database;

  // ----------------------------
  // HEART RATE
  // ----------------------------

  Future<List<FlSpot>> getHeartRateSpots({
    required Timeframe timeframe,
    required DateTime selectedDate,
  }) async {
    switch (timeframe) {
      case Timeframe.daily:
        return _heartRateDaily(selectedDate);
      case Timeframe.weekly:
        return _heartRateWeekly(selectedDate);
      case Timeframe.monthly:
        return _heartRateMonthly(selectedDate);
    }
  }

  Future<List<FlSpot>> _heartRateDaily(DateTime date) async {
    final dayStart = DateTime(date.year, date.month, date.day, 6, 0);
    final dayEnd = DateTime(date.year, date.month, date.day + 1, 6, 0);

    final rows =
        await (_db.select(_db.heartRate)..where(
              (t) =>
                  t.timestamp.isBiggerOrEqualValue(dayStart) &
                  t.timestamp.isSmallerThanValue(dayEnd),
            ))
            .get();

    // 8 x 3-hour buckets starting at 6am: 6,9,12,15,18,21,0,3
    final bucketSums = List<double>.filled(8, 0);
    final bucketCounts = List<int>.filled(8, 0);

    for (final row in rows) {
      final hour = row.timestamp.hour;
      final bucket = _hourToDailyBucket(hour);
      if (bucket != null) {
        bucketSums[bucket] += row.dailyAvg;
        bucketCounts[bucket]++;
      }
    }

    return _buildSpots(bucketSums, bucketCounts);
  }

  int? _hourToDailyBucket(int hour) {
    // Buckets: 6,9,12,15,18,21,0,3
    const starts = [6, 9, 12, 15, 18, 21, 0, 3];
    for (int i = 0; i < starts.length; i++) {
      final next = (starts[i] + 3) % 24;
      if (starts[i] < next) {
        if (hour >= starts[i] && hour < next) return i;
      } else {
        if (hour >= starts[i] || hour < next) return i;
      }
    }
    return null;
  }

  Future<List<FlSpot>> _heartRateWeekly(DateTime date) async {
    final weekStart = _startOfWeek(date);
    final weekEnd = weekStart.add(const Duration(days: 7));

    final rows =
        await (_db.select(_db.heartRate)..where(
              (t) =>
                  t.timestamp.isBiggerOrEqualValue(weekStart) &
                  t.timestamp.isSmallerThanValue(weekEnd),
            ))
            .get();

    final bucketSums = List<double>.filled(7, 0);
    final bucketCounts = List<int>.filled(7, 0);

    for (final row in rows) {
      // weekday: Mon=1 … Sun=7, map to index 0–6
      final index = row.timestamp.weekday - 1;
      bucketSums[index] += row.dailyAvg;
      bucketCounts[index]++;
    }

    return _buildSpots(bucketSums, bucketCounts);
  }

  Future<List<FlSpot>> _heartRateMonthly(DateTime date) async {
    final monthStart = DateTime(date.year, date.month, 1);
    final monthEnd = DateTime(date.year, date.month + 1, 1);

    final rows =
        await (_db.select(_db.heartRate)..where(
              (t) =>
                  t.timestamp.isBiggerOrEqualValue(monthStart) &
                  t.timestamp.isSmallerThanValue(monthEnd),
            ))
            .get();

    final bucketSums = List<double>.filled(4, 0);
    final bucketCounts = List<int>.filled(4, 0);

    for (final row in rows) {
      final week = _dayToWeekBucket(row.timestamp.day);
      bucketSums[week] += row.dailyAvg;
      bucketCounts[week]++;
    }

    return _buildSpots(bucketSums, bucketCounts);
  }

  // ----------------------------
  // HRV
  // ----------------------------

  Future<List<FlSpot>> getHRVSpots({
    required Timeframe timeframe,
    required DateTime selectedDate,
  }) async {
    switch (timeframe) {
      case Timeframe.daily:
        return _hrvDaily(selectedDate);
      case Timeframe.weekly:
        return _hrvWeekly(selectedDate);
      case Timeframe.monthly:
        return _hrvMonthly(selectedDate);
    }
  }

  Future<List<FlSpot>> _hrvDaily(DateTime date) async {
    final dayStart = DateTime(date.year, date.month, date.day, 6, 0);
    final dayEnd = DateTime(date.year, date.month, date.day + 1, 6, 0);

    final rows =
        await (_db.select(_db.hrv)..where(
              (t) =>
                  t.timestamp.isBiggerOrEqualValue(dayStart) &
                  t.timestamp.isSmallerThanValue(dayEnd),
            ))
            .get();

    final bucketSums = List<double>.filled(8, 0);
    final bucketCounts = List<int>.filled(8, 0);

    for (final row in rows) {
      final bucket = _hourToDailyBucket(row.timestamp.hour);
      if (bucket != null) {
        bucketSums[bucket] += row.hrv;
        bucketCounts[bucket]++;
      }
    }

    return _buildSpots(bucketSums, bucketCounts);
  }

  Future<List<FlSpot>> _hrvWeekly(DateTime date) async {
    final weekStart = _startOfWeek(date);
    final weekEnd = weekStart.add(const Duration(days: 7));

    final rows =
        await (_db.select(_db.hrv)..where(
              (t) =>
                  t.timestamp.isBiggerOrEqualValue(weekStart) &
                  t.timestamp.isSmallerThanValue(weekEnd),
            ))
            .get();

    final bucketSums = List<double>.filled(7, 0);
    final bucketCounts = List<int>.filled(7, 0);

    for (final row in rows) {
      final index = row.timestamp.weekday - 1;
      bucketSums[index] += row.hrv;
      bucketCounts[index]++;
    }

    return _buildSpots(bucketSums, bucketCounts);
  }

  Future<List<FlSpot>> _hrvMonthly(DateTime date) async {
    final monthStart = DateTime(date.year, date.month, 1);
    final monthEnd = DateTime(date.year, date.month + 1, 1);

    final rows =
        await (_db.select(_db.hrv)..where(
              (t) =>
                  t.timestamp.isBiggerOrEqualValue(monthStart) &
                  t.timestamp.isSmallerThanValue(monthEnd),
            ))
            .get();

    final bucketSums = List<double>.filled(4, 0);
    final bucketCounts = List<int>.filled(4, 0);

    for (final row in rows) {
      final week = _dayToWeekBucket(row.timestamp.day);
      bucketSums[week] += row.hrv;
      bucketCounts[week]++;
    }

    return _buildSpots(bucketSums, bucketCounts);
  }

  // ----------------------------
  // HEART RATE ZONES
  // ----------------------------

  Future<List<ZoneDuration>> getZoneDurations({
    required Timeframe timeframe,
    required DateTime selectedDate,
  }) async {
    final DateTimeRange range = _dateRangeFor(timeframe, selectedDate);

    final rows =
        await (_db.select(_db.heartRate)..where(
              (t) =>
                  t.timestamp.isBiggerOrEqualValue(range.start) &
                  t.timestamp.isSmallerThanValue(range.end),
            ))
            .get();

    final counts = List<int>.filled(5, 0);

    for (final row in rows) {
      final hr = row.dailyAvg;
      if (hr < 65) {
        counts[0]++;
      } else if (hr < 90) {
        counts[1]++;
      } else if (hr < 125) {
        counts[2]++;
      } else if (hr < 170) {
        counts[3]++;
      } else {
        counts[4]++;
      }
    }

    final minutesPerReading = switch (timeframe) {
      Timeframe.daily => 180.0,
      Timeframe.weekly => 1440.0,
      Timeframe.monthly => 10080.0,
    };

    return [
      ZoneDuration(label: 'Zone 1', minutes: counts[0] * minutesPerReading),
      ZoneDuration(label: 'Zone 2', minutes: counts[1] * minutesPerReading),
      ZoneDuration(label: 'Zone 3', minutes: counts[2] * minutesPerReading),
      ZoneDuration(label: 'Zone 4', minutes: counts[3] * minutesPerReading),
      ZoneDuration(label: 'Zone 5', minutes: counts[4] * minutesPerReading),
    ];
  }

  DateTimeRange _dateRangeFor(Timeframe timeframe, DateTime date) {
    return switch (timeframe) {
      Timeframe.daily => DateTimeRange(
        start: DateTime(date.year, date.month, date.day, 6, 0),
        end: DateTime(date.year, date.month, date.day + 1, 6, 0),
      ),
      Timeframe.weekly => DateTimeRange(
        start: _startOfWeek(date),
        end: _startOfWeek(date).add(const Duration(days: 7)),
      ),
      Timeframe.monthly => DateTimeRange(
        start: DateTime(date.year, date.month, 1),
        end: DateTime(date.year, date.month + 1, 1),
      ),
    };
  }

  // ----------------------------
  // HELPERS
  // ----------------------------

  DateTime _startOfWeek(DateTime date) {
    return DateTime(
      date.year,
      date.month,
      date.day,
    ).subtract(Duration(days: date.weekday - 1));
  }

  int _dayToWeekBucket(int day) {
    if (day <= 7) return 0;
    if (day <= 14) return 1;
    if (day <= 21) return 2;
    return 3;
  }

  List<FlSpot> _buildSpots(List<double> sums, List<int> counts) {
    final spots = <FlSpot>[];
    for (int i = 0; i < sums.length; i++) {
      if (counts[i] > 0) {
        spots.add(FlSpot(i.toDouble(), sums[i] / counts[i]));
      }
    }
    return spots;
  }
}
