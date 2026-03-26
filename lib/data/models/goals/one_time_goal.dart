import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:psp_elaros/data/models/goals/goal.dart';
import 'package:psp_elaros/data/models/goals/metric_category.dart';


class OneTimeGoal extends Goal {
  final DateTime endDate;

  OneTimeGoal({
    required super.title,
    required super.currentProgress,
    required super.progressGoal,
    required super.metricCategory,
    required this.endDate,
  });

  @override
  String get formattedTimeRemaining {
    final timeNow = DateTime.now();
    final difference = endDate.difference(timeNow);

    if (difference.isNegative) {
      return 'Goal ended';
    }

    // 2. Calculate Weeks
    if (difference.inDays >= 7) {
      int weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? "week" : "weeks"} left';
    }

    // 3. Calculate Days
    if (difference.inDays >= 1) {
      return '${difference.inDays} ${difference.inDays == 1 ? "day" : "days"} left';
    }

    // 4. Calculate Hours
    if (difference.inHours >= 1) {
      return '${difference.inHours} ${difference.inHours == 1 ? "hour" : "hours"} left';
    }

    // 5. Minimum fallback
    return '< 1 hour left';
  }
  IconData get categoryIcon {
    if (metricCategory == MetricCategory.steps) {
      return Symbols.steps;
    }
    else if (metricCategory == MetricCategory.sleep) {
      return Symbols.sleep;
    }
    else {
      return Symbols.target;
    }
  }
}