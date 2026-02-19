import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

const MethodChannel _channel = MethodChannel('database-link');

class DatabaseLink {
  static Future<String> getDatabasePath() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'health_app.db');
    return path;
  }

  static Future<void> initNativeDatabase() async {
    final dbPath = await getDatabasePath();
    await _channel.invokeMethod('initDatabase', {
      'dbPath': dbPath,
    });
  }

  static Future<void> insertSleep(
      DateTime startTime,
      DateTime endTime,
      ) async {
    await _channel.invokeMethod('insertSleep', {
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
    });
  }

  static Future<List<Map<String, dynamic>>> getSleepData() async {
    final result = await _channel.invokeMethod('getSleepData');
    return List<Map<String, dynamic>>.from(result);
  }


  }

}
