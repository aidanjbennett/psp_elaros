import 'package:health/health.dart';

class HeartRateVariabilityRate {
  final double value;
  final DateTime dateFrom;
  final DateTime dateTo;

  HeartRateVariabilityRate({
    required this.value,
    required this.dateFrom,
    required this.dateTo,
  });

  factory HeartRateVariabilityRate.fromHealthData(HealthDataPoint point) {
    return HeartRateVariabilityRate(
      value: (point.value as NumericHealthValue).numericValue.toDouble(),
      dateFrom: point.dateFrom,
      dateTo: point.dateTo,
    );
  }
}
