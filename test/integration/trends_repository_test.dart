import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:psp_elaros/data/local/database.dart';
import 'package:psp_elaros/data/repositories/trends_repository.dart';
import 'package:psp_elaros/models/trend_enums.dart';

import '../helpers/test_database.dart';

void main() {
  late AppDatabase db;
  late TrendsRepository repository;

  // Monday 2025-01-06
  final monday = DateTime(2025, 1, 6);

  setUp(() {
    db = createTestDatabase();
    repository = TrendsRepository(database: db);
  });

  tearDown(() async {
    await db.close();
  });

  // ----------------------------
  // HELPERS
  // ----------------------------

  Future<int> insertZone() async {
    return db
        .into(db.heartRateZones)
        .insert(
          HeartRateZonesCompanion(
            restingLower: const Value(50),
            restingUpper: const Value(70),
            exerciseLower: const Value(70),
            exerciseHigher: const Value(140),
            exertionLower: const Value(140),
            exertionUpper: const Value(180),
          ),
        );
  }

  Future<void> insertHr(DateTime timestamp, int bpm, int zoneId) async {
    await db
        .into(db.timestamps)
        .insertOnConflictUpdate(
          TimestampsCompanion(time: Value(timestamp), date: Value(timestamp)),
        );
    await db
        .into(db.heartRate)
        .insertOnConflictUpdate(
          HeartRateCompanion(
            timestamp: Value(timestamp),
            dailyAvg: Value(bpm),
            hrZone: Value(zoneId),
          ),
        );
  }

  Future<void> insertHrv(DateTime timestamp, int value) async {
    await db
        .into(db.timestamps)
        .insertOnConflictUpdate(
          TimestampsCompanion(time: Value(timestamp), date: Value(timestamp)),
        );
    await db
        .into(db.hrv)
        .insertOnConflictUpdate(
          HrvCompanion(hrv: Value(value), timestamp: Value(timestamp)),
        );
  }

  // ----------------------------
  // HEART RATE — DAILY
  // ----------------------------

  group('getHeartRateSpots — daily', () {
    test('returns empty list when no rows exist', () async {
      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );
      expect(spots, isEmpty);
    });

    test('reading at 9:30am lands in bucket 1', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 6, 9, 30), 80, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(spots.length, 1);
      expect(spots.first.x, 1.0);
      expect(spots.first.y, 80.0);
    });

    test('reading at 6:00am lands in bucket 0', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 6, 6, 0), 65, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(spots.first.x, 0.0);
    });

    test('reading at midnight lands in bucket 6', () async {
      final zoneId = await insertZone();
      // Midnight on Jan 7 falls in the daily window for Jan 6
      // (window runs 6am Jan 6 → 6am Jan 7)
      await insertHr(DateTime(2025, 1, 7, 0, 0), 58, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(spots.first.x, 6.0);
    });

    test('multiple readings in same bucket are averaged', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 6, 9, 0), 80, zoneId);
      await insertHr(DateTime(2025, 1, 6, 9, 30), 100, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(spots.length, 1);
      expect(spots.first.y, 90.0);
    });

    test('reading from a different day is excluded', () async {
      final zoneId = await insertZone();
      // Tuesday
      await insertHr(DateTime(2025, 1, 7, 9, 0), 80, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(spots, isEmpty);
    });
  });

  // ----------------------------
  // HEART RATE — WEEKLY
  // ----------------------------

  group('getHeartRateSpots — weekly', () {
    test('Monday reading lands in bucket 0', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 6, 9, 0), 72, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.weekly,
        selectedDate: monday,
      );

      expect(spots.length, 1);
      expect(spots.first.x, 0.0);
      expect(spots.first.y, 72.0);
    });

    test('Sunday reading lands in bucket 6', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 12, 9, 0), 75, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.weekly,
        selectedDate: monday,
      );

      expect(spots.first.x, 6.0);
    });

    test('reading from previous week is excluded', () async {
      final zoneId = await insertZone();
      // Sunday before the week of monday
      await insertHr(DateTime(2025, 1, 5, 9, 0), 80, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.weekly,
        selectedDate: monday,
      );

      expect(spots, isEmpty);
    });
  });

  // ----------------------------
  // HEART RATE — MONTHLY
  // ----------------------------

  group('getHeartRateSpots — monthly', () {
    test('day 1 lands in W1 (bucket 0)', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 1, 9, 0), 70, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.monthly,
        selectedDate: DateTime(2025, 1, 15),
      );

      expect(spots.first.x, 0.0);
    });

    test('day 8 lands in W2 (bucket 1)', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 8, 9, 0), 70, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.monthly,
        selectedDate: DateTime(2025, 1, 15),
      );

      expect(spots.first.x, 1.0);
    });

    test('day 22 lands in W4 (bucket 3)', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 22, 9, 0), 70, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.monthly,
        selectedDate: DateTime(2025, 1, 15),
      );

      expect(spots.first.x, 3.0);
    });

    test('reading from a different month is excluded', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 2, 1, 9, 0), 70, zoneId);

      final spots = await repository.getHeartRateSpots(
        timeframe: Timeframe.monthly,
        selectedDate: DateTime(2025, 1, 15),
      );

      expect(spots, isEmpty);
    });
  });

  // ----------------------------
  // HRV — DAILY
  // ----------------------------

  group('getHRVSpots — daily', () {
    test('returns empty list when no rows exist', () async {
      final spots = await repository.getHRVSpots(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );
      expect(spots, isEmpty);
    });

    test('HRV reading at 12:00 lands in bucket 2', () async {
      await insertHrv(DateTime(2025, 1, 6, 12, 0), 38);

      final spots = await repository.getHRVSpots(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(spots.length, 1);
      expect(spots.first.x, 2.0);
      expect(spots.first.y, 38.0);
    });

    test('HRV reading from different day is excluded', () async {
      await insertHrv(DateTime(2025, 1, 7, 9, 0), 40);

      final spots = await repository.getHRVSpots(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(spots, isEmpty);
    });
  });

  // ----------------------------
  // ZONE DURATIONS
  // ----------------------------

  group('getZoneDurations', () {
    test('reading of 60 bpm counts as Zone 1', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 6, 6, 0), 60, zoneId);

      final zones = await repository.getZoneDurations(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(zones[0].minutes, greaterThan(0));
      expect(zones[1].minutes, 0);
      expect(zones[2].minutes, 0);
      expect(zones[3].minutes, 0);
      expect(zones[4].minutes, 0);
    });

    test('reading of 80 bpm counts as Zone 2', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 6, 9, 0), 80, zoneId);

      final zones = await repository.getZoneDurations(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(zones[0].minutes, 0);
      expect(zones[1].minutes, greaterThan(0));
    });

    test('reading of 100 bpm counts as Zone 3', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 6, 9, 0), 100, zoneId);

      final zones = await repository.getZoneDurations(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(zones[2].minutes, greaterThan(0));
    });

    test('reading of 150 bpm counts as Zone 4', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 6, 9, 0), 150, zoneId);

      final zones = await repository.getZoneDurations(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(zones[3].minutes, greaterThan(0));
    });

    test('reading of 180 bpm counts as Zone 5', () async {
      final zoneId = await insertZone();
      await insertHr(DateTime(2025, 1, 6, 9, 0), 180, zoneId);

      final zones = await repository.getZoneDurations(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(zones[4].minutes, greaterThan(0));
    });

    test('returns 5 zones always', () async {
      final zones = await repository.getZoneDurations(
        timeframe: Timeframe.weekly,
        selectedDate: monday,
      );

      expect(zones.length, 5);
    });

    test('zone labels are correct', () async {
      final zones = await repository.getZoneDurations(
        timeframe: Timeframe.daily,
        selectedDate: monday,
      );

      expect(zones.map((z) => z.label).toList(), [
        'Zone 1',
        'Zone 2',
        'Zone 3',
        'Zone 4',
        'Zone 5',
      ]);
    });
  });
}
