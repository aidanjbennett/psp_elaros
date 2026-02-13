import 'package:flutter/material.dart';
import 'package:psp_elaros/screens/about_screen.dart';
import 'package:psp_elaros/screens/home_screen.dart';

void main() {
  runApp(const ElarosApp());
}

class ElarosApp extends StatelessWidget {
  const ElarosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
