import 'package:flutter/material.dart';

class MainNavbar extends StatelessWidget {
  final int currentIndex;

  const MainNavbar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        if (currentIndex != 0) {
          Navigator.pushReplacementNamed(context, '/home');
        }
        break;
      case 2:
        if (currentIndex != 2) {
          Navigator.pushReplacementNamed(context, '/about');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
      ],
    );
  }
}
