import 'dart:math';
import 'package:flutter/material.dart';

class MetricsViewModel extends ChangeNotifier {
  // You can add a repository here later
  MetricsViewModel();

  String _hrv = '-- ms';
  bool _isLoading = false;
  bool _isHrvHealthy = false;

  String get hrv => _hrv;
  bool get isLoading => _isLoading;
  bool get isHrvHealthy => _isHrvHealthy;

  Future<void> loadMetrics() async {
    _isLoading = true;
    notifyListeners();

    // Mocking the data fetch
    await Future.delayed(const Duration(milliseconds: 1000));

    final mockHrvValue = Random().nextInt(70) + 25; // Random range 25-95
    _hrv = '$mockHrvValue ms';
    _isHrvHealthy = mockHrvValue >= 35 && mockHrvValue <= 99;

    _isLoading = false;
    notifyListeners();
  }
}
