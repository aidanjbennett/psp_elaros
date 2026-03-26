import 'package:fl_chart/fl_chart.dart';
import 'package:psp_elaros/models/trend_enums.dart';
import 'package:psp_elaros/models/zone_duration.dart';

class TrendsService {
  List<FlSpot> getHeartRateSpots({
    required Timeframe timeframe,
    required DateTime selectedDate,
  }) {
    switch (timeframe) {
      case Timeframe.daily:
        return const [
          FlSpot(0, 68),
          FlSpot(1, 93),
          FlSpot(2, 111),
          FlSpot(3, 154),
          FlSpot(4, 189),
          FlSpot(5, 174),
          FlSpot(6, 155),
          FlSpot(7, 130),
        ];
      case Timeframe.weekly:
        return const [
          FlSpot(0, 68),
          FlSpot(1, 72),
          FlSpot(2, 70),
          FlSpot(3, 75),
          FlSpot(4, 73),
          FlSpot(5, 78),
          FlSpot(6, 74),
        ];
      case Timeframe.monthly:
        return const [
          FlSpot(0, 69),
          FlSpot(1, 71),
          FlSpot(2, 73),
          FlSpot(3, 72),
        ];
    }
  }

  List<FlSpot> getHRVSpots({
    required Timeframe timeframe,
    required DateTime selectedDate,
  }) {
    switch (timeframe) {
      case Timeframe.daily:
        return const [
          FlSpot(0, 32),
          FlSpot(1, 35),
          FlSpot(2, 31),
          FlSpot(3, 38),
          FlSpot(4, 36),
          FlSpot(5, 40),
        ];
      case Timeframe.weekly:
        return const [
          FlSpot(0, 32),
          FlSpot(1, 36),
          FlSpot(2, 30),
          FlSpot(3, 40),
          FlSpot(4, 38),
          FlSpot(5, 45),
          FlSpot(6, 42),
        ];
      case Timeframe.monthly:
        return const [
          FlSpot(0, 34),
          FlSpot(1, 37),
          FlSpot(2, 41),
          FlSpot(3, 39),
        ];
    }
  }

  List<double> getStepsValues({
    required Timeframe timeframe,
    required DateTime selectedDate,
  }) {
    switch (timeframe) {
      case Timeframe.daily:
        return [1200, 2400, 3100, 4500, 6200, 7100];
      case Timeframe.weekly:
        return [5000, 7200, 6400, 8900, 7600, 11000, 9800];
      case Timeframe.monthly:
        return [42000, 51000, 47000, 56000];
    }
  }

  List<ZoneDuration> getZoneDurations({
    required Timeframe timeframe,
    required DateTime selectedDate,
  }) {
    final heartRates = getHeartRateSpots(
      timeframe: timeframe,
      selectedDate: selectedDate,
    ).map((spot) => spot.y).toList();

    final counts = [0, 0, 0, 0, 0];

    for (final hr in heartRates) {
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
}