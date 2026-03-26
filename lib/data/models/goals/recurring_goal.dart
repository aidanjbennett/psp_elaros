import 'package:psp_elaros/data/models/goals/goal.dart';
import 'package:psp_elaros/data/models/goals/metric_category.dart';
import 'package:psp_elaros/data/models/goals/recurrence_type.dart';

class RecurringGoal extends Goal {
  final DateTime repeatStart;
  final RecurrenceType recurrenceType;
  final Duration? customDuration; // Only required if recurrenceType == custom

  RecurringGoal({
    required super.title,
    required super.currentProgress,
    required super.progressGoal,
    required super.metricCategory,
    required this.repeatStart,
    required this.recurrenceType,
    this.customDuration,
  });

  DateTime _calculateNextDeadline(DateTime now) {
    DateTime nextDeadline = repeatStart;

    if (now.isBefore(nextDeadline)) {
      return nextDeadline;
    }

    while (nextDeadline.isBefore(now) || nextDeadline.isAtSameMomentAs(now)) {
      switch (recurrenceType) {
        case RecurrenceType.daily:
          nextDeadline = nextDeadline.add(const Duration(days: 1));
          break;
        case RecurrenceType.weekly:
          nextDeadline = nextDeadline.add(const Duration(days: 7));
          break;
        case RecurrenceType.monthly:
          nextDeadline = DateTime(
            nextDeadline.year,
            nextDeadline.month + 1,
            nextDeadline.day,
            nextDeadline.hour,
            nextDeadline.minute,
          );
          break;
        case RecurrenceType.custom:
          nextDeadline = nextDeadline.add(customDuration ?? const Duration(days: 1));
          break;
      }
    }

    return nextDeadline;
  }

  @override
  String get formattedTimeRemaining {
    final timeNow = DateTime.now();
    final nextDeadline = _calculateNextDeadline(timeNow);
    final difference = nextDeadline.difference(timeNow);

    if (difference.isNegative) {
      return 'Resetting...';
    }

    // 1. Calculate Weeks
    if (difference.inDays >= 7) {
      int weeks = (difference.inDays / 7).floor();
      return 'Resets in $weeks ${weeks == 1 ? "week" : "weeks"}';
    }

    // 2. Calculate Days
    if (difference.inDays >= 1) {
      return 'Resets in ${difference.inDays} ${difference.inDays == 1 ? "day" : "days"}';
    }

    // 3. Calculate Hours
    if (difference.inHours >= 1) {
      return 'Resets in ${difference.inHours} ${difference.inHours == 1 ? "hour" : "hours"}';
    }

    // 4. Minimum fallback
    return 'Resets in < 1 hour';
  }
}