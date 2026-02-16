import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

/// ----------------------------
/// TIMESTAMP
/// ----------------------------
class Timestamps extends Table {
  IntColumn get timestampId => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
}

/// ----------------------------
/// NOTIFICATIONS
/// ----------------------------
class Notifications extends Table {
  IntColumn get notificationId => integer().autoIncrement()();
  TextColumn get notifHeader => text()();
  TextColumn get notifBody => text()();
  IntColumn get timestampId => integer().references(Timestamps, #timestampId)();
}

/// ----------------------------
/// SLEEP
/// ----------------------------
class Sleep extends Table {
  IntColumn get sleepId => integer().autoIncrement()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
}

/// ----------------------------
/// STEPS
/// ----------------------------
class Steps extends Table {
  IntColumn get stepsId => integer().autoIncrement()();
  IntColumn get timestampId => integer().references(Timestamps, #timestampId)();
}

/// ----------------------------
/// HRV
/// ----------------------------
class Hrv extends Table {
  IntColumn get hrvId => integer().autoIncrement()();
  IntColumn get timestampId => integer().references(Timestamps, #timestampId)();
}

/// ----------------------------
/// HEART RATE
/// ----------------------------
class HeartRate extends Table {
  IntColumn get hrId => integer().autoIncrement()();
  IntColumn get timestampId => integer().references(Timestamps, #timestampId)();
  IntColumn get dailyAvg => integer()();
}

/// ----------------------------
/// BASELINE
/// ----------------------------
class Baseline extends Table {
  IntColumn get baselineId => integer().autoIncrement()();
  IntColumn get maxHr => integer()();
  DateTimeColumn get minDate => dateTime()();
  IntColumn get minHr => integer()();
}

/// ----------------------------
/// HEALTH OVERVIEW
/// ----------------------------
class HealthOverview extends Table {
  IntColumn get healthScore => integer().autoIncrement()();

  IntColumn get sleepId => integer().references(Sleep, #sleepId)();

  IntColumn get stepsId => integer().references(Steps, #stepsId)();

  IntColumn get hrvId => integer().references(Hrv, #hrvId)();

  IntColumn get baselineId => integer().references(Baseline, #baselineId)();
}

/// ----------------------------
/// DATABASE
/// ----------------------------
@DriftDatabase(
  tables: [
    Timestamps,
    Notifications,
    Sleep,
    Steps,
    Hrv,
    HeartRate,
    Baseline,
    HealthOverview,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

/// ----------------------------
/// OPEN CONNECTION
/// ----------------------------
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'health_app.db'));
    return NativeDatabase(file);
  });
}
