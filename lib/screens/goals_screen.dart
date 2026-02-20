import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/style/app_style.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

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
          ],
        ),
      ),

    );
  }
}
