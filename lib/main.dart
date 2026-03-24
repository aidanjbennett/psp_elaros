import 'package:flutter/material.dart';
import 'package:psp_elaros/data/local/database.dart' as db;
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:flutter/services.dart';
import 'package:psp_elaros/router/app_router.dart';
import 'package:psp_elaros/services/notification_service.dart';
import 'package:psp_elaros/style/app_style.dart';

Future<void> _registerBackgroundTask() async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = db.AppDatabase();

  await _registerBackgroundTask();

  await NotificationService.init();

  final healthRepo = HealthRepository(database: database);
  await healthRepo.requestPermissions();

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
