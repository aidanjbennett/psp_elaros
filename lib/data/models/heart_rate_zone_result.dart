import 'package:psp_elaros/services/heart_rate_service.dart';

class HeartRateZoneResult {
  final int blue, green, yellow, orange, red;

  // Time spent in each zone
  final Duration blueDuration;
  final Duration greenDuration;
  final Duration yellowDuration;
  final Duration orangeDuration;
  final Duration redDuration;

  final DatePeriod period;
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
