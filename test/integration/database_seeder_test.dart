import 'package:flutter_test/flutter_test.dart';
import 'package:psp_elaros/data/local/database.dart';
import 'package:psp_elaros/data/local/database_seeder.dart';

import '../helpers/test_database.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;

  setUp(() {
    db = createTestDatabase();
    seeder = DatabaseSeeder(database: db);
  });

  tearDown(() async {
    await db.close();
  });

  group('seedIfEmpty()', () {
    test('inserts HR rows into an empty database', () async {
      await seeder.seedIfEmpty();
      final rows = await db.select(db.heartRate).get();
      expect(rows, isNotEmpty);
    });

    test('inserts HRV rows into an empty database', () async {
      await seeder.seedIfEmpty();
      final rows = await db.select(db.hrv).get();
      expect(rows, isNotEmpty);
    });

    test('seeds 28 days worth of HR data (8 readings per day = 224)', () async {
      await seeder.seedIfEmpty();
      final rows = await db.select(db.heartRate).get();
      expect(rows.length, 224);
    });

    test('seeds HRV data for 28 days', () async {
      await seeder.seedIfEmpty();
      final rows = await db.select(db.hrv).get();
      // Hrv table uses hrv value as primary key so duplicate jitter values
      // collapse via insertOnConflictUpdate — count is at least 1 per day
      expect(rows.length, greaterThanOrEqualTo(28));
      expect(rows.length, lessThanOrEqualTo(224));
    });

    test('is important — calling twice does not double the rows', () async {
      await seeder.seedIfEmpty();
      final countAfterFirst = (await db.select(db.heartRate).get()).length;

      await seeder.seedIfEmpty();
      final countAfterSecond = (await db.select(db.heartRate).get()).length;

      expect(countAfterFirst, countAfterSecond);
    });

    test('creates exactly one heart rate zone row', () async {
      await seeder.seedIfEmpty();
      final zones = await db.select(db.heartRateZones).get();
      expect(zones.length, 1);
    });
  });
}
