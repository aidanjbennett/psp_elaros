import 'package:flutter/foundation.dart';
import 'package:psp_elaros/data/models/sleep_model.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:workmanager/workmanager.dart';

class SleepSyncTask {
  static const taskName = 'stepSyncTask';
}

@pragma('vm:entry-point')
void sleepSyncTaskCallbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (kDebugMode) {
      print("Running Sleep task");
    }
    // iOS sometimes passes 'iOSBackgroundTask' or the unique ID
    // Check for both to be safe
    if (task == SleepSyncTask.taskName ||
        task == 'sleep-sync-task' ||
        task == Workmanager.iOSBackgroundTask) {
      final repo = HealthRepository();

      try {
        Sleep sleepData = await repo.getLastNightSleep();
        double totalSleep = sleepData.totalHours;

        if (kDebugMode) {
          print("Sleep $totalSleep");
        }

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
