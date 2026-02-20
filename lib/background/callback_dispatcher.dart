import 'package:flutter/foundation.dart';
import 'package:workmanager/workmanager.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:psp_elaros/background/steps_sync_task.dart';
import 'package:psp_elaros/background/sleep_sync_task.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final repo = HealthRepository();

    try {
      switch (task) {
        case StepSyncTask.taskName:
          if (kDebugMode) print("Running Step Sync...");
          int steps = await repo.getSteps();
          if (kDebugMode) print("Steps fetched: $steps");
          break;

        case SleepSyncTask.taskName:
          if (kDebugMode) print("Running Sleep Sync...");
          final sleepData = await repo.getLastNightSleep();
          if (kDebugMode) print("Sleep hours: ${sleepData.totalHours}");
          break;

        case Workmanager.iOSBackgroundTask:
          // iOS often groups background work.
          // You can run both here to ensure data stays fresh.
          await repo.getSteps();
          await repo.getLastNightSleep();
          break;

        default:
          if (kDebugMode) print("Unknown task: $task");
          break;
      }
      return Future.value(true);
    } catch (e) {
      if (kDebugMode) print("Background Task Error: $e");
      return Future.value(false);
    }
  });
}
