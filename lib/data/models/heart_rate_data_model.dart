import 'package:health/health.dart';

class HeartRate {
  final double value;
  final String unit;
  final DateTime timestamp;
  final String source;

  HeartRate({
    required this.value,
    required this.unit,
    required this.timestamp,
    required this.source,
  });

  factory HeartRate.fromHealthPoint(HealthDataPoint point) {
    return HeartRate(
      value: (point.value as NumericHealthValue).numericValue.toDouble(),
      unit: point.unitString,
      timestamp: point.dateFrom,
      source: point.sourceName,
    );
  }
}
