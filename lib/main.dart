import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psp_elaros/background/sleep_sync_task.dart';
import 'package:psp_elaros/data/models/heart_rate_data_model.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:flutter/services.dart';
import 'package:psp_elaros/router/app_router.dart';
import 'package:psp_elaros/services/notification_service.dart';
import 'package:psp_elaros/style/app_style.dart';
import 'package:workmanager/workmanager.dart';
import 'background/steps_sync_task.dart';
import 'package:psp_elaros/data/models/sleep_model.dart';

Future<void> _registerBackgroundTask() async {
  await Workmanager().initialize(stepSyncTaskCallbackDispatcher);

  // Step Task
  await Workmanager().registerPeriodicTask(
    'step-sync-task',
    StepSyncTask.taskName,
    frequency: const Duration(minutes: 15),
    constraints: Constraints(
      networkType: NetworkType.notRequired,
      requiresBatteryNotLow: false,
    ),
    existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
  );

  // Get Sleep Task

  await Workmanager().registerPeriodicTask(
    'sleep-sync-task',
    SleepSyncTask.taskName,
    frequency: const Duration(hours: 24),
    constraints: Constraints(
      networkType: NetworkType.notRequired,
      requiresBatteryNotLow: false,
    ),
    existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await _registerBackgroundTask();

  await NotificationService.init();

  final healthRepo = HealthRepository();
  await healthRepo.requestPermissions();

  await Future.wait([
    healthRepo.getLastNightSleep(),
    healthRepo.getSteps(),
    healthRepo.getHeartRateVariabilityRate(),
    healthRepo.getHeartRateList(),
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  runApp(const ElarosApp());
}

class ElarosApp extends StatelessWidget {
  const ElarosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Flutter App',
      routerConfig: router,

      theme: AppTheme.light(),
    );
  }
}
