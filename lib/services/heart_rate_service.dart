import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'package:psp_elaros/data/models/heart_rate_data_model.dart';
import 'package:psp_elaros/data/models/heart_rate_zone_result.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';

enum DatePeriod { day, week, month }

class HeartRateService {
  final HealthRepository _repository;

  HeartRateService(this._repository);

  final Health _health = Health();

  DateTime _fromDate(DatePeriod period) {
    final now = DateTime.now();
    return switch (period) {
      DatePeriod.day => DateTime(now.year, now.month, now.day),
      DatePeriod.week => now.subtract(const Duration(days: 7)),
      DatePeriod.month => DateTime(now.year, now.month - 1, now.day),
    };
  }

  HeartRateZoneResult _classify(
    List<HeartRate> data,
    DatePeriod period,
    DateTime from,
  ) {
    int blue = 0, green = 0, yellow = 0, orange = 0, red = 0;
    Duration dBlue = Duration.zero,
        dGreen = Duration.zero,
        dYellow = Duration.zero,
        dOrange = Duration.zero,
        dRed = Duration.zero;

    // 1. Sort data chronologically to calculate time gaps accurately
    final sortedData = List<HeartRate>.from(data)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    for (int i = 0; i < sortedData.length; i++) {
      final hr = sortedData[i];
      final bpm = hr.value.round();

      // 2. Determine duration for this data point
      // We calculate time until the next reading.
      Duration duration = Duration.zero;
      if (i < sortedData.length - 1) {
        duration = sortedData[i + 1].timestamp.difference(hr.timestamp);

        // Safety check: If the gap is > 10 mins, assume the sensor was off
        // and only count this reading as 1 minute of activity.
        if (duration.inMinutes > 10) {
          duration = const Duration(minutes: 1);
        }
      }

      // 3. Increment counts and accumulate durations
      if (bpm < 60) {
        blue++;
        dBlue += duration;
      } else if (bpm <= 99) {
        green++;
        dGreen += duration;
      } else if (bpm <= 139) {
        yellow++;
        dYellow += duration;
      } else if (bpm <= 169) {
        orange++;
        dOrange += duration;
      } else {
        red++;
        dRed += duration;
      }
    }

    return HeartRateZoneResult(
      blue: blue,
      green: green,
      yellow: yellow,
      orange: orange,
      red: red,
      blueDuration: dBlue,
      greenDuration: dGreen,
      yellowDuration: dYellow,
      orangeDuration: dOrange,
      redDuration: dRed,
      period: period,
      from: from,
      to: DateTime.now(),
    );
  }

  Future<HeartRateZoneResult> getZoneCounts(DatePeriod period) async {
    final from = _fromDate(period);
    final data = await _repository.getHeartRateList();

    final filtered = data.where((hr) => hr.timestamp.isAfter(from)).toList();

    if (kDebugMode) {
      print("HeartRateService: ${filtered.length} data points for $period");
    }

    return _classify(filtered, period, from);
  }

  Future<int> getTotalDataPoints(DatePeriod period) async {
    final result = await getZoneCounts(period);
    return result.totalDataPoints;
  }

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
}
