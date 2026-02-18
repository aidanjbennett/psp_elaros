import 'dart:io' hide sleep;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

mixin LastModified on Table {
  DateTimeColumn get lastModifiedTime =>
      dateTime().withDefault(currentDateAndTime)();
}

// local date time

/// ----------------------------
/// TIMESTAMP
/// ----------------------------
class Timestamps extends Table with LastModified {
  IntColumn get timestampId => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
}

/// ----------------------------
class Notifications extends Table with LastModified {
  IntColumn get notificationId => integer().autoIncrement()();
  TextColumn get notifHeader => text()();
  TextColumn get notifBody => text()();
  IntColumn get timestampId => integer().references(Timestamps, #timestampId)();
}

/// ----------------------------
class Sleep extends Table with LastModified {
  IntColumn get sleepId => integer().autoIncrement()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
}

/// ----------------------------
class Steps extends Table with LastModified {
  IntColumn get stepsId => integer().autoIncrement()();
  IntColumn get timestampId => integer().references(Timestamps, #timestampId)();
}

/// ----------------------------
class Hrv extends Table with LastModified {
  IntColumn get hrvId => integer().autoIncrement()();
  IntColumn get timestampId => integer().references(Timestamps, #timestampId)();
}

/// ----------------------------
class HeartRate extends Table with LastModified {
  IntColumn get hrId => integer().autoIncrement()();
  IntColumn get timestampId => integer().references(Timestamps, #timestampId)();
  IntColumn get dailyAvg => integer()();
}

/// ----------------------------
class Baseline extends Table with LastModified {
  IntColumn get baselineId => integer().autoIncrement()();
  IntColumn get maxHr => integer()();
  DateTimeColumn get minDate => dateTime()();
  IntColumn get minHr => integer()();
}

/// ----------------------------
class HealthOverview extends Table with LastModified {
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
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },

    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await _migrateToV2(m);
      }

      // if (from < 3) {
      //   await _migrateToV3(m);
      // }
    },
  );

  /// ----------------------------
  /// VERSION 2
  /// Added lastModifiedTime to all tables
  /// ----------------------------
  Future<void> _migrateToV2(Migrator m) async {
    await m.addColumn(timestamps, timestamps.lastModifiedTime);
    await m.addColumn(notifications, notifications.lastModifiedTime);
    await m.addColumn(sleep, sleep.lastModifiedTime);
    await m.addColumn(steps, steps.lastModifiedTime);
    await m.addColumn(hrv, hrv.lastModifiedTime);
    await m.addColumn(heartRate, heartRate.lastModifiedTime);
    await m.addColumn(baseline, baseline.lastModifiedTime);
    await m.addColumn(healthOverview, healthOverview.lastModifiedTime);
  }

  // /// ----------------------------
  // /// VERSION 3
  // /// (Currently no changes — placeholder)
  // /// ----------------------------
  // Future<void> _migrateToV3(Migrator m) async {
  //   // No schema changes yet
  // }
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
