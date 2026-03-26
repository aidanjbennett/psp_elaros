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

/// ----------------------------
/// TIMESTAMP
/// ----------------------------
class Timestamps extends Table with LastModified {
  DateTimeColumn get time => dateTime()();
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {time};
}

/// ----------------------------
/// SETTINGS
/// ----------------------------
class Settings extends Table with LastModified {
  IntColumn get settingsId => integer().autoIncrement()();
  BoolColumn get theme => boolean()();
  TextColumn get fontText => text()();
  BoolColumn get reducedMotion => boolean()();
  IntColumn get fontSize => integer()();
}

/// ----------------------------
/// USER INFO
/// ----------------------------
class UserInfo extends Table with LastModified {
  IntColumn get infoId => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get weight => real()();
  DateTimeColumn get dob => dateTime()();
  RealColumn get height => real()();
}

/// ----------------------------
/// NOTIFICATIONS
/// ----------------------------
class Notifications extends Table with LastModified {
  IntColumn get notificationId => integer().autoIncrement()();
  TextColumn get notifHeader => text()();
  TextColumn get notifBody => text()();
  DateTimeColumn get timestamp => dateTime().references(Timestamps, #time)();
}

/// ----------------------------
/// SLEEP
/// ----------------------------
class Sleep extends Table with LastModified {
  IntColumn get sleepId => integer().autoIncrement()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
}

/// ----------------------------
/// STEPS
/// ----------------------------
class Steps extends Table with LastModified {
  IntColumn get stepsId => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime().references(Timestamps, #time)();
  IntColumn get steps => integer()();
}

/// ----------------------------
/// HRV
/// ----------------------------
class Hrv extends Table with LastModified {
  IntColumn get hrv => integer()();
  DateTimeColumn get timestamp => dateTime().references(Timestamps, #time)();

  @override
  Set<Column> get primaryKey => {hrv};
}

/// ----------------------------
/// HEART RATE ZONES
/// ----------------------------
class HeartRateZones extends Table with LastModified {
  IntColumn get hrZoneId => integer().autoIncrement()();
  IntColumn get restingLower => integer()();
  IntColumn get restingUpper => integer()();
  IntColumn get exerciseLower => integer()();
  IntColumn get exerciseHigher => integer()();
  IntColumn get exertionLower => integer()();
  IntColumn get exertionUpper => integer()();
}

/// ----------------------------
/// HEART RATE
/// ----------------------------
class HeartRate extends Table with LastModified {
  IntColumn get hrId => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime().references(Timestamps, #time)();
  IntColumn get dailyAvg => integer()();
  IntColumn get hrZone => integer().references(HeartRateZones, #hrZoneId)();
}

/// ----------------------------
/// BASELINE
/// ----------------------------
class Baseline extends Table with LastModified {
  IntColumn get baselineId => integer().autoIncrement()();
  IntColumn get maxHr => integer()();
  DateTimeColumn get minHrDate => dateTime()();
  IntColumn get maxHrv => integer()();
}
// Goals screen 
class Goals extends Table with LastModified {
  IntColumn get goalId => integer().autoIncrement()();
  TextColumn get title => text()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}


/// ----------------------------
/// HEALTH OVERVIEW
/// ----------------------------
class HealthOverview extends Table with LastModified {
  IntColumn get healthScore => integer().autoIncrement()();
  IntColumn get sleepId => integer().references(Sleep, #sleepId)();
  IntColumn get stepsId => integer().references(Steps, #stepsId)();
  IntColumn get hrv => integer().references(Hrv, #hrv)();
  IntColumn get baselineId => integer().references(Baseline, #baselineId)();
}

@DriftDatabase(
  tables: [
    Timestamps,
    Settings,
    UserInfo,
    Notifications,
    Sleep,
    Steps,
    Hrv,
    HeartRateZones,
    HeartRate,
    Baseline,
    HealthOverview,
    Goals,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.connection);

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


