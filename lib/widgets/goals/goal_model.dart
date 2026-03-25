import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

enum MetricCategory { steps, sleep }

class GoalModel {
  final String title;
  final int currentProgress;
  final int progressGoal;
  final DateTime endDate;
  final bool isRepeating;
  final DateTime repeatStart;
  final MetricCategory metricCategory;

  GoalModel({
    required this.title,
    required this.currentProgress,
    required this.progressGoal,
    required this.endDate,
    required this.isRepeating,
    required this.repeatStart,
    required this.metricCategory,
  });

  double get progress => (currentProgress / progressGoal).clamp(0.0, 1.0);
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