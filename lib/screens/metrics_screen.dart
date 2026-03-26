import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/style/app_style.dart';

class MetricsScreen extends StatelessWidget {
  const MetricsScreen({super.key});

  //current code is messy, after meeting refine it to widgets
  //create if statements for on track, displaying HRV, etc

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Dashboard"),
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
                "Status Overview",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        const Text(
                          "Heart Rate",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),

                        const Spacer(),

                        const Text(
                          "Status",
                          style: TextStyle(fontSize: 18),
                        ),

                        const SizedBox(width: 10),

                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: const [
                        Text(
                          "HRV:",
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "000",
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'text demo',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),
                    const Text(
                      "Update on the user here",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    //sleep section
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.purple,
                          child: const Icon(Icons.bed, color: Colors.white),
                        ),
                        SizedBox(width: 12),

                        Text(
                          "Sleep",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        Spacer(),
                        Text(
                          'All good',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        SizedBox(width: 12),
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.check, color: Colors.white, size: 24),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                    const Divider(thickness: 2,),

                    //goals section
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.location_searching, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          "Goals",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        Spacer(),
                        Text(
                          'On track',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        SizedBox(width: 12),
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.check, color: Colors.white, size: 24),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                    const Divider(thickness: 2,),
                    const SizedBox(height: 10),

                    //steps section
                    Row(
                      children: const [
                        Icon(Icons.directions_walk, color: Colors.white,),
                        SizedBox(width: 12),
                        Text(
                          "Steps",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        Spacer(),
                        Text(
                          'On track',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        SizedBox(width: 12),
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.check, color: Colors.white, size: 24),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ],

                ),

              ),
              SizedBox(height: 10),
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