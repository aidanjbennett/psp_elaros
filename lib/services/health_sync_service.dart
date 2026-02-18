import 'package:flutter/foundation.dart';
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
      // TODO: Actually save this in data

      if (kDebugMode) {
        print(point);
      }
    }

    if (kDebugMode) {
      print('Printed ${dataPoints.length} health records.');
    }
  }
}
