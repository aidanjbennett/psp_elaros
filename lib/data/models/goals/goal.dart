import 'package:flutter/cupertino.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:psp_elaros/data/models/goals/goals.dart';

abstract class Goal {
  final String title;
  final int currentProgress;
  final int progressGoal;
  final MetricCategory metricCategory;


  Goal({
    required this.title,
    required this.currentProgress,
    required this.progressGoal,
    required this.metricCategory,
  });

  String get formattedTimeRemaining;

  double get progress => (currentProgress / progressGoal).clamp(0.0, 1.0);
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

  bool get completed => false;
}