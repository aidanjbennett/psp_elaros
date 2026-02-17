import 'package:flutter/material.dart';
import 'package:health/health.dart';

class SleepZonesWidget extends StatefulWidget {
  const SleepZonesWidget({super.key});

  @override
  State<SleepZonesWidget> createState() => _SleepZonesWidgetState();
}

class _SleepZonesWidgetState extends State<SleepZonesWidget> {
  final Health _health = Health();
  double _light = 0;
  double _deep = 0;
  double _rem = 0;
  bool _loading = true;
  bool _authorized = false;

  // SLEEP_ASLEEP is a catch-all for devices that can't distinguish between
  // stages. Since this device records LIGHT, DEEP and REM it will always be 0
  // so it has been removed.
  static const _sleepTypes = [
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
  ];

  @override
  void initState() {
    super.initState();
    _initHealth();
  }

  Future<void> _initHealth() async {
    final permissions = List.filled(_sleepTypes.length, HealthDataAccess.READ);

    // FIX 2: Check existing permissions before requesting — calling
    // requestAuthorization every time forces the permission dialog to show
    // on every launch even if already granted
    bool? hasPerms = await _health.hasPermissions(
      _sleepTypes,
      permissions: permissions,
    );

    if (hasPerms != true) {
      _authorized = await _health.requestAuthorization(
        _sleepTypes,
        permissions: permissions,
      );
    } else {
      _authorized = true;
    }

    if (!_authorized) {
      print("❌ Sleep permission not granted");
      setState(() => _loading = false);
      return;
    }

    await _fetchSleepData();
  }

  Future<void> _fetchSleepData() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));

    try {
      List<HealthDataPoint> data = await _health.getHealthDataFromTypes(
        startTime: yesterday,
        endTime: now,
        types: _sleepTypes,
      );

      // Use built-in deduplication
      final uniqueData = _health.removeDuplicates(data);

      double light = 0;
      double deep = 0;
      double rem = 0;

      for (var point in uniqueData) {
        // Sleep duration comes from the difference between dateFrom and dateTo
        final hours = point.dateTo.difference(point.dateFrom).inMinutes / 60;

        switch (point.type) {
          case HealthDataType.SLEEP_LIGHT:
            light += hours;
            break;
          case HealthDataType.SLEEP_DEEP:
            deep += hours;
            break;
          case HealthDataType.SLEEP_REM:
            rem += hours;
            break;
          default:
            break;
        }
      }

      setState(() {
        _light = light;
        _deep = deep;
        _rem = rem;
        _loading = false;
      });

      print("Sleep zones — Light: $_light, Deep: $_deep, REM: $_rem");
    } catch (e) {
      print("Error fetching sleep zones: $e");
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_authorized) {
      return const Center(
        child: Text(
          "Sleep permission not granted",
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Sleep (Last 24h)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text("💤 Light: ${_light.toStringAsFixed(2)} hrs"),
            Text("🌊 Deep: ${_deep.toStringAsFixed(2)} hrs"),
            Text("🧠 REM: ${_rem.toStringAsFixed(2)} hrs"),
          ],
        ),
      ),
    );
  }
}
