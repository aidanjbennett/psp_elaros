import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:psp_elaros/data/local/database.dart' as db;
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:psp_elaros/data/models/sleep_model.dart';
import 'package:psp_elaros/data/models/heart_metrics_model.dart' hide HeartMetrics;
import 'package:psp_elaros/data/models/heart_rate_data_model.dart';
import 'package:psp_elaros/data/models/heart_rate_variability_rate_model.dart';

db.AppDatabase openTestDatabase() =>
    db.AppDatabase.forTesting(NativeDatabase.memory());

void main() {
  late db.AppDatabase database;
  late HealthRepository repository;

  setUp(() {
    database = openTestDatabase();
    repository = HealthRepository(database: database);
  });

  tearDown(() async {
    await database.close();
  });

  group('saveSleep', () {
    test('inserts a sleep record', () async {
      final sleep = Sleep(
        totalDuration: const Duration(hours: 7),
        dateChecked: DateTime.now(),
      );

      await repository.saveSleep(sleep);

      final rows = await database.select(database.sleep).get();
      expect(rows.length, 1);
      expect(rows.first.endTime.difference(rows.first.startTime).inHours, 7);
    });
  });

  group('saveSteps', () {
    test('inserts a steps record with a timestamp', () async {
      await repository.saveSteps(8000);

      final stepRows = await database.select(database.steps).get();
      final timestampRows = await database.select(database.timestamps).get();

      expect(stepRows.length, 1);
      expect(stepRows.first.steps, 8000);
      expect(timestampRows.length, 1);
    });

    test('updates existing steps on conflict', () async {
      await repository.saveSteps(5000);
      await repository.saveSteps(8000);

      // Timestamps deduplicates by day, so only one timestamp row
      final timestampRows = await database.select(database.timestamps).get();
      expect(timestampRows.length, 1);
    });
  });

  group('saveHeartMetrics', () {
    test('inserts heart rate and HRV records', () async {
      final now = DateTime.now();
      final metrics = HeartMetrics(
        heartRates: [
          HeartRate(value: 72, unit: 'bpm', timestamp: now, source: 'test'),
        ],
        hrvRates: [
          HeartRateVariabilityRate(
            value: 45,
            dateFrom: now,
            dateTo: now.add(const Duration(minutes: 1)),
          ),
        ],
        averageHeartRate: 72,
        averageHrv: 45,
      );

      await repository.saveHeartMetrics(metrics);

      final hrRows = await database.select(database.heartRate).get();
      final hrvRows = await database.select(database.hrv).get();

      expect(hrRows.length, 1);
      expect(hrRows.first.dailyAvg, 72);
      expect(hrvRows.length, 1);
      expect(hrvRows.first.hrv, 45);
    });

    test('inserts heart rate zone alongside heart rate', () async {
      final now = DateTime.now();
      final metrics = HeartMetrics(
        heartRates: [
          HeartRate(value: 95, unit: 'bpm', timestamp: now, source: 'test'),
        ],
        hrvRates: [],
        averageHeartRate: 95,
        averageHrv: null,
      );

      await repository.saveHeartMetrics(metrics);

      final zoneRows = await database.select(database.heartRateZones).get();
      expect(zoneRows.length, 1);
      expect(zoneRows.first.restingLower, 50);
      expect(zoneRows.first.restingUpper, 70);
    });

    test('skips HRV insert when averageHrv is null', () async {
      final metrics = HeartMetrics(
        heartRates: [],
        hrvRates: [],
        averageHeartRate: null,
        averageHrv: null,
      );

      await repository.saveHeartMetrics(metrics);

      final hrvRows = await database.select(database.hrv).get();
      expect(hrvRows.isEmpty, true);
    });

    test('inserts multiple heart rate records', () async {
      final now = DateTime.now();
      final metrics = HeartMetrics(
        heartRates: [
          HeartRate(value: 68, unit: 'bpm', timestamp: now, source: 'test'),
          HeartRate(
            value: 74,
            unit: 'bpm',
            timestamp: now.add(const Duration(minutes: 5)),
            source: 'test',
          ),
        ],
        hrvRates: [],
        averageHeartRate: 71,
        averageHrv: null,
      );

      await repository.saveHeartMetrics(metrics);

      final hrRows = await database.select(database.heartRate).get();
      expect(hrRows.length, 2);
    });
  });

  group('saveBaseline', () {
    test('inserts a baseline record', () async {
      await repository.saveBaseline(
        maxHr: 185,
        minHrDate: DateTime.now(),
        maxHrv: 60,
      );

      final rows = await database.select(database.baseline).get();
      expect(rows.length, 1);
      expect(rows.first.maxHr, 185);
      expect(rows.first.maxHrv, 60);
    });
  });

  group('saveHealthOverview', () {
    test('inserts a health overview record', () async {
      await repository.saveHealthOverview(
        sleepId: 1,
        stepsId: 1,
        hrvValue: 45,
        baselineId: 1,
      );

      final rows = await database.select(database.healthOverview).get();
      expect(rows.length, 1);
      expect(rows.first.hrv, 45);
    });
  });
}
