import 'package:flutter/foundation.dart';
import 'package:psp_elaros/data/models/heart_rate_data_model.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';

enum HeartRatePeriod { day, week, month }

class HeartRateZoneResult {
  final int blue, green, yellow, orange, red;

  // Time spent in each zone
  final Duration blueDuration;
  final Duration greenDuration;
  final Duration yellowDuration;
  final Duration orangeDuration;
  final Duration redDuration;

  final HeartRatePeriod period;
  final DateTime from;
  final DateTime to;

  HeartRateZoneResult({
    required this.blue,
    required this.green,
    required this.yellow,
    required this.orange,
    required this.red,
    required this.blueDuration,
    required this.greenDuration,
    required this.yellowDuration,
    required this.orangeDuration,
    required this.redDuration,
    required this.period,
    required this.from,
    required this.to,
  });

  int get totalDataPoints => blue + green + yellow + orange + red;

  Duration get totalDuration =>
      blueDuration +
      greenDuration +
      yellowDuration +
      orangeDuration +
      redDuration;
}

class HeartRateService {
  final HealthRepository _repository;

  HeartRateService(this._repository);

  DateTime _fromDate(HeartRatePeriod period) {
    final now = DateTime.now();
    return switch (period) {
      HeartRatePeriod.day => DateTime(now.year, now.month, now.day),
      HeartRatePeriod.week => now.subtract(const Duration(days: 7)),
      HeartRatePeriod.month => DateTime(now.year, now.month - 1, now.day),
    };
  }

  HeartRateZoneResult _classify(
    List<HeartRate> data,
    HeartRatePeriod period,
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

  Future<HeartRateZoneResult> getZoneCounts(HeartRatePeriod period) async {
    final from = _fromDate(period);
    final data = await _repository.getHeartRateList();

    final filtered = data.where((hr) => hr.timestamp.isAfter(from)).toList();

    if (kDebugMode) {
      print("HeartRateService: ${filtered.length} data points for $period");
    }

    return _classify(filtered, period, from);
  }

  Future<int> getTotalDataPoints(HeartRatePeriod period) async {
    final result = await getZoneCounts(period);
    return result.totalDataPoints;
  }
}
