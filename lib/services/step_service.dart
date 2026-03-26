import 'package:health/health.dart';

class StepService {
  final Health _health = Health();

  Future<int> getSteps() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    return await _health.getTotalStepsInInterval(midnight, now) ?? 0;
  }

  Future<int> getDailyAverageSteps() => getSteps();

  Future<int> getWeeklyAverageSteps() async {
    final now = DateTime.now();
    final weekAgo = now.subtract(const Duration(days: 7));
    final total = await _health.getTotalStepsInInterval(weekAgo, now) ?? 0;
    return (total / 7).round();
  }

  Future<int> getMonthlyAverageSteps() async {
    final now = DateTime.now();
    final monthAgo = now.subtract(const Duration(days: 30));
    final total = await _health.getTotalStepsInInterval(monthAgo, now) ?? 0;
    return (total / 30).round();
  }
}
