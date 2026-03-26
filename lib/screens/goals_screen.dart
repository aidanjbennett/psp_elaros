import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/data/models/goals/goals.dart';
import 'package:psp_elaros/data/models/goals/recurrence_type.dart';
import 'package:psp_elaros/data/models/goals/recurring_goal.dart';
import 'package:psp_elaros/style/app_style.dart';
import 'package:psp_elaros/widgets/goals/add_goal_form.dart';
import 'package:psp_elaros/widgets/goals/goal_overview_widget.dart';

class GoalsScreen extends StatelessWidget {
  final AppDatabase db;

  const GoalsScreen({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BetterTrack"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push('/settings');
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Goals", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ...dummyGoals
                .map((goal) => GoalOverviewWidget(goalModel: goal))
                .toList(),
            Card(
              elevation: 1,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // CRITICAL: Allows the sheet to move up with the keyboard
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      // Return your custom form widget here
                      return const AddGoalForm();
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add New Goal",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
            ),
             Expanded(
            child: StreamBuilder(
              stream: db.select(db.goals).watch(),
              builder: (context, AsyncSnapshot<List<Goal>> snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                final goals = snapshot.data!;

                if (goals.isEmpty) {
                  return const Text("No goals yet");
                }

                return ListView.builder(
                  itemCount: goals.length,
                  itemBuilder: (context, index) {
                    final goal = goals[index];

                    return ListTile(
                      title: Text(goal.title),
                      trailing: Icon(
                        goal.completed
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

