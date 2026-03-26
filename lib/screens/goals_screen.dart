import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/style/app_style.dart';

class GoalsScreen extends StatelessWidget {
  final AppDatabase db;

  const GoalsScreen({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bettertrack"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push('/settings');
            },
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left:16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(
              "Your Goals",
              style: Theme.of(context).textTheme.titleLarge,
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

