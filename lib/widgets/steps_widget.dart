import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class StepsWidget extends StatefulWidget {
  const StepsWidget({super.key});

  @override
  State<StepsWidget> createState() => _StepsWidgetState();
}

class _StepsWidgetState extends State<StepsWidget> {
  final Health _health = Health();
  int _steps = 0;
  bool _isAuthorized = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initHealth();
  }

  Future<void> _initHealth() async {
    final types = [HealthDataType.STEPS];
    final permissions = [HealthDataAccess.READ];

    // Check existing permissions first
    bool? hasPermissions = await _health.hasPermissions(
      types,
      permissions: permissions,
    );

    if (hasPermissions != true) {
      // Request permissions
      _isAuthorized = await _health.requestAuthorization(
        types,
        permissions: permissions,
      );
    } else {
      _isAuthorized = true;
    }

    if (!_isAuthorized) {
      if (kDebugMode) {
        print("Authorization not granted");
      }
      setState(() => _isLoading = false);
      return;
    }

    if (kDebugMode) {
      print("Authorization granted");
    }

    await _fetchSteps();
  }

  Future<void> _fetchSteps() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    try {
      final steps = await _health.getTotalStepsInInterval(midnight, now);

      setState(() {
        _steps = steps ?? 0;
        _isLoading = false;
      });

      if (kDebugMode) {
        print("Today's steps: $_steps");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching steps: $e");
      }

      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_isAuthorized) {
      return const Center(
        child: Text(
          "Health permission not granted",
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return Center(
      child: Text('Steps today: $_steps', style: const TextStyle(fontSize: 24)),
    );
  }
}
