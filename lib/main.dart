import 'package:flutter/material.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:psp_elaros/screens/about_screen.dart';
import 'package:psp_elaros/screens/home_screen.dart';
import 'package:psp_elaros/services/notification_service.dart';
import 'package:workmanager/workmanager.dart';
import 'background/health_sync_task.dart';

// Future<void> _registerBackgroundTask() async {
//   await Workmanager().initialize(healthSyncCallbackDispatcher);
//   await Workmanager().registerPeriodicTask(
//     'health-sync-task',
//     HealthSyncTask.taskName,
//     frequency: const Duration(minutes: 15),
//     constraints: Constraints(
//       networkType: NetworkType.notRequired,
//       requiresBatteryNotLow: true,
//     ),
//     existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.init();

  final healthRepo = HealthRepository();
  await healthRepo.requestPermissions();

  // await _registerBackgroundTask();

  runApp(const ElarosApp());
}

class ElarosApp extends StatelessWidget {
  const ElarosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
