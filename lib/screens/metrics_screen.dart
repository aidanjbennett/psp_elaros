import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MetricsScreen extends StatelessWidget {
  const MetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hi"),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.push('/settings');
              },
            )
          ],
        ),

      body: Column(
        children: [
          Text("Hello world!"),
          Text("METRICS SCREEN")
        ],
      )
    );
  }
}
