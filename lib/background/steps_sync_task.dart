import 'package:flutter/foundation.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:workmanager/workmanager.dart';

class StepSyncTask {
  static const taskName = 'stepSyncTask';
}

@pragma('vm:entry-point')
void stepSyncTaskCallbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (kDebugMode) {
      print("Running Step task");
    }
    // iOS sometimes passes 'iOSBackgroundTask' or the unique ID
    // Check for both to be safe
    if (task == StepSyncTask.taskName ||
        task == 'step-sync-task' ||
        task == Workmanager.iOSBackgroundTask) {
      final repo = HealthRepository();

      try {
        int steps = await repo.getSteps();

        if (kDebugMode) {
          print("Steps $steps");
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
