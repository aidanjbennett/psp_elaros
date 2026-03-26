import 'package:psp_elaros/data/models/heart_rate_data_model.dart';
import 'package:psp_elaros/data/models/heart_rate_variability_rate_model.dart';

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
