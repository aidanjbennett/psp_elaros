import 'package:flutter/foundation.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:psp_elaros/services/health_sync_service.dart';
import 'package:workmanager/workmanager.dart';

class HealthSyncTask {
  static const taskName = 'healthSyncTask';
}

@pragma('vm:entry-point')
void healthSyncCallbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (kDebugMode) {
      print("Running task");
    }
    // iOS sometimes passes 'iOSBackgroundTask' or the unique ID
    // Check for both to be safe
    if (task == HealthSyncTask.taskName ||
        task == 'health-sync-task' ||
        task == Workmanager.iOSBackgroundTask) {
      // IMPORTANT: Initialize your database INSIDE the task
      // Background isolates do not share memory with the main app isolate
      // final db = AppDatabase();

      final repo = HealthRepository();

      try {
        await HealthSyncService(healthRepo: repo).sync();
        return true;
      } catch (e) {
        return false;
      } finally {
        if (kDebugMode) {
          print("Done task");
        }
      }
    }
    return true;
  });
}
