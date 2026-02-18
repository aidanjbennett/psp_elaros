import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';

class HealthSyncService {
  final HealthRepository _healthRepo;

  HealthSyncService({required HealthRepository healthRepo})
    : _healthRepo = healthRepo;

  Future<void> sync({Duration window = const Duration(hours: 24)}) async {
    if (kDebugMode) {
      print("Running Sync function");
    }

    final now = DateTime.now();
    final from = now.subtract(window);

    final dataPoints = await _healthRepo.fetchRecent(from: from, to: now);

    for (final point in dataPoints) {
      if (kDebugMode) {
        final type = point.type;
        final value = point.value;

        // Extract the numeric value safely
        final numericValue = (value is NumericHealthValue)
            ? value.numericValue.toDouble().toStringAsFixed(1)
            : value.toString();

        // Determine the unit
        String unit = '';
        if (type == HealthDataType.STEPS) {
          unit = 'steps';
        } else if (type == HealthDataType.HEART_RATE) {
          unit = 'bpm';
        } else if (type.name.contains('SLEEP')) {
          unit = 'min';
        } else if (type.name.contains('VARIABILITY')) {
          unit = 'ms';
        }

        print(
          '${type.name.replaceFirst('HealthDataType.', '')}: $numericValue $unit',
        );
      }
    }

    if (kDebugMode) {
      print('Printed ${dataPoints.length} health records.');
    }
  }
}
