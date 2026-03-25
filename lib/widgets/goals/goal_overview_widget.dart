import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:psp_elaros/data/models/goals/goal.dart';
import 'package:psp_elaros/style/app_style.dart';
import 'package:psp_elaros/widgets/goals/goal_model.dart';

class GoalOverviewWidget extends StatelessWidget {
  final Goal goalModel;

  const GoalOverviewWidget({super.key, required this.goalModel});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  goalModel.title,
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                Spacer(),
                _GoalStatusBadge(
                  label: "${goalModel.currentProgress} / ${goalModel.progressGoal}",
                  icon: goalModel.categoryIcon,
                ),
              ],
            ),
            SizedBox(height: 12),
            LinearProgressIndicator(
              value: goalModel.progress,
              color: Colors.orange,
              minHeight: 32,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _GoalStatusBadge(
                    label: goalModel.formattedTimeRemaining,
                    icon: Icons.schedule,
                    backgroundColor: Color(0xFFea9800),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _GoalStatusBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color textColor;
  final Color backgroundColor;

  _GoalStatusBadge({
    required this.label,
    required this.icon,
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xFF5E9086)
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Using .only to balance that "empty air" on the icon's left
      padding: const EdgeInsets.only(left: 8, right: 12, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: backgroundColor, // Your specific teal
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2), // Subtle outline
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // CRITICAL: Keeps the teal box from stretching
        children: [
          Icon(
            icon,
            color: textColor,
            size: 18, // Slightly smaller for better fit
          ),
          const SizedBox(width: 8), // The fixed gap
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
