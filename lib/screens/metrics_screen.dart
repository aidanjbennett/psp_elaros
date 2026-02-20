import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/style/app_style.dart';

class MetricsScreen extends StatelessWidget {
  const MetricsScreen({super.key});

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Metrics",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              // Top row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 210,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: const Align(
                        child: Text(
                          'Heart Rate Zones',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const Align(
                            child: Text(
                              'Steps',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(fontSize: 20, color: Colors.black87),
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const Align(
                            child: Text(
                              'Sleep',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(fontSize: 20, color: Colors.black87),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Container(
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: const Align(
                  child: Text(
                    'Heart Rate Variability',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Container(
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: const Align(
                  child: Text(
                    'Heart Rate',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        )





    );


  }
}




//Text(
//"Your Metrics",
//style: Theme.of(context).textTheme.titleLarge,
//),