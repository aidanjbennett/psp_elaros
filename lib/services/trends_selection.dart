import 'package:flutter/foundation.dart';
import 'package:psp_elaros/models/trend_enums.dart';

class TrendsSelection {
  static final ValueNotifier<MetricType> selectedMetric =
  ValueNotifier(MetricType.heartRate);
}