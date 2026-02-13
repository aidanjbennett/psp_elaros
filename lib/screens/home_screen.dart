import 'package:flutter/material.dart';
import 'package:psp_elaros/widgets/main_navbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Elaros Health App")),
      bottomNavigationBar: MainNavbar(currentIndex: 0),
      body: SafeArea(child: Column(children: [Text("Hello, World")])),
    );
  }
}
