import 'package:flutter/material.dart';
import 'package:health/health.dart';

class SleepZonesWidget extends StatefulWidget {
  const SleepZonesWidget({Key? key}) : super(key: key);

  @override
  State<SleepZonesWidget> createState() => _SleepZonesWidgetState();
}

class _SleepZonesWidgetState extends State<SleepZonesWidget> {
  final Health _health = Health();

  double _asleep = 0;
  double _awake = 0;
  double _inBed = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initHealth();
  }

  Future<void> _initHealth() async {
    final types = [
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.SLEEP_AWAKE,
      HealthDataType.SLEEP_IN_BED,
    ];

    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];

    bool granted = await _health.requestAuthorization(
      types,
      permissions: permissions,
    );

    if (!granted) {
      print("❌ Sleep permission not granted");
      setState(() => _loading = false);
      return;
    }

    await _fetchSleepData();
  }

  Future<void> _fetchSleepData() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));

    final types = [
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.SLEEP_AWAKE,
      HealthDataType.SLEEP_IN_BED,
    ];

    List<HealthDataPoint> data = await _health.getHealthDataFromTypes(
      startTime: yesterday,
      endTime: now,
      types: types,
    );

    double asleep = 0;
    double awake = 0;
    double inBed = 0;

    for (var point in data) {
      final hours = point.value is NumericHealthValue
          ? (point.value as NumericHealthValue).numericValue / 60
          : 0;

      switch (point.type) {
        case HealthDataType.SLEEP_ASLEEP:
          asleep += hours;
          break;
        case HealthDataType.SLEEP_AWAKE:
          awake += hours;
          break;
        case HealthDataType.SLEEP_IN_BED:
          inBed += hours;
          break;
        default:
          break;
      }
    }

    setState(() {
      _asleep = asleep;
      _awake = awake;
      _inBed = inBed;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const CircularProgressIndicator();
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
            Text("😴 Asleep: ${_asleep.toStringAsFixed(2)} hrs"),
            Text("👀 Awake: ${_awake.toStringAsFixed(2)} hrs"),
            Text("🛌 In Bed: ${_inBed.toStringAsFixed(2)} hrs"),
          ],
        ),
      ),
    );
  }
}
