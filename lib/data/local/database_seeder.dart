import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:psp_elaros/data/local/database.dart';

class DatabaseSeeder {
  final AppDatabase _db;

  DatabaseSeeder({required AppDatabase database}) : _db = database;

  Future<void> seedIfEmpty() async {
    final existing = await _db.select(_db.heartRate).get();
    if (existing.isNotEmpty) {
      if (kDebugMode) print('DatabaseSeeder: data already present, skipping');
      return;
    }

    if (kDebugMode) print('DatabaseSeeder: seeding mock data...');
    await _seed();
    if (kDebugMode) print('DatabaseSeeder: done');
  }

  Future<void> _seed() async {
    final zoneId = await _db
        .into(_db.heartRateZones)
        .insertOnConflictUpdate(
          HeartRateZonesCompanion(
            restingLower: const Value(50),
            restingUpper: const Value(70),
            exerciseLower: const Value(70),
            exerciseHigher: const Value(140),
            exertionLower: const Value(140),
            exertionUpper: const Value(180),
          ),
        );

    final now = DateTime.now();

    // Seed 28 days of data
    for (int daysAgo = 27; daysAgo >= 0; daysAgo--) {
      final day = now.subtract(Duration(days: daysAgo));

      // 6-8 HR readings per day at realistic hours
      final hrHours = [6, 9, 12, 15, 18, 21, 0, 3];
      for (final hour in hrHours) {
        final timestamp = DateTime(day.year, day.month, day.day, hour);
        final hr = _realisticHr(hour);

        await _db
            .into(_db.timestamps)
            .insertOnConflictUpdate(
              TimestampsCompanion(
                time: Value(timestamp),
                date: Value(timestamp),
              ),
            );

        await _db
            .into(_db.heartRate)
            .insertOnConflictUpdate(
              HeartRateCompanion(
                timestamp: Value(timestamp),
                dailyAvg: Value(hr),
                hrZone: Value(zoneId),
              ),
            );
      }

      // 8 HRV readings per day matching daily bucket hours
      final hrvHours = [6, 9, 12, 15, 18, 21, 0, 3];
      for (final hour in hrvHours) {
        final timestamp = DateTime(day.year, day.month, day.day, hour);
        final hrv = _realisticHrv();

        await _db
            .into(_db.timestamps)
            .insertOnConflictUpdate(
              TimestampsCompanion(
                time: Value(timestamp),
                date: Value(timestamp),
              ),
            );

        await _db
            .into(_db.hrv)
            .insertOnConflictUpdate(
              HrvCompanion(hrv: Value(hrv), timestamp: Value(timestamp)),
            );
      }
    }
  }

  // Resting HR at night/morning, higher during day
  int _realisticHr(int hour) {
    final base = switch (hour) {
      0 || 3 => 58,
      6 => 65,
      9 => 78,
      12 => 85,
      15 => 110,
      18 => 145,
      21 => 95,
      _ => 70,
    };
    return base + _jitter(10);
  }

  int _realisticHrv() {
    return 35 + _jitter(15);
  }

  int _jitter(int range) {
    final seed = DateTime.now().microsecondsSinceEpoch;
    return (seed % (range * 2)) - range;
  }
}
