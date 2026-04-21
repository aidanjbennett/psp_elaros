import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:psp_elaros/data/repositories/trends_repository.dart';
import 'package:psp_elaros/models/trend_enums.dart';
import 'package:psp_elaros/models/zone_duration.dart';

class TrendsViewModel extends ChangeNotifier {
  final TrendsRepository _repository;

  TrendsViewModel({required TrendsRepository repository})
    : _repository = repository;

  MetricType selectedMetric = MetricType.heartRate;
  Timeframe selectedTimeframe = Timeframe.weekly;
  DateTime selectedDate = DateTime.now();

  List<FlSpot> _spots = [];
  List<ZoneDuration> _zoneDurations = [];
  bool isLoading = false;
  bool hasError = false;

  List<FlSpot> get spots => _spots;
  List<ZoneDuration> get zoneDurations => _zoneDurations;

  Future<void> load() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      final results = await Future.wait([
        _fetchSpots(),
        _repository.getZoneDurations(
          timeframe: selectedTimeframe,
          selectedDate: selectedDate,
        ),
      ]);
      _spots = results[0] as List<FlSpot>;
      _zoneDurations = results[1] as List<ZoneDuration>;
    } catch (e) {
      if (kDebugMode) print('TrendsViewModel load error: $e');
      hasError = true;
      _spots = [];
      _zoneDurations = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<List<FlSpot>> _fetchSpots() {
    switch (selectedMetric) {
      case MetricType.heartRate:
        return _repository.getHeartRateSpots(
          timeframe: selectedTimeframe,
          selectedDate: selectedDate,
        );
      case MetricType.hrv:
        return _repository.getHRVSpots(
          timeframe: selectedTimeframe,
          selectedDate: selectedDate,
        );
      case MetricType.steps:
      case MetricType.sleep:
        return Future.value([]);
    }
  }

  void setMetric(MetricType metric) {
    selectedMetric = metric;
    load();
  }

  void setTimeframe(Timeframe timeframe) {
    selectedTimeframe = timeframe;
    load();
  }

  void setDate(DateTime date) {
    selectedDate = date;
    load();
  }

  void goToPreviousPeriod() {
    selectedDate = switch (selectedTimeframe) {
      Timeframe.daily => selectedDate.subtract(const Duration(days: 1)),
      Timeframe.weekly => selectedDate.subtract(const Duration(days: 7)),
      Timeframe.monthly => DateTime(
        selectedDate.year,
        selectedDate.month - 1,
        selectedDate.day,
      ),
    };
    load();
  }

  void goToNextPeriod() {
    if (!canMoveForward) return;
    selectedDate = switch (selectedTimeframe) {
      Timeframe.daily => selectedDate.add(const Duration(days: 1)),
      Timeframe.weekly => selectedDate.add(const Duration(days: 7)),
      Timeframe.monthly => DateTime(
        selectedDate.year,
        selectedDate.month + 1,
        selectedDate.day,
      ),
    };
    load();
  }

  bool get canMoveForward {
    final now = DateTime.now();
    return switch (selectedTimeframe) {
      Timeframe.daily => _dateOnly(selectedDate).isBefore(_dateOnly(now)),
      Timeframe.weekly => !_startOfWeek(
        selectedDate,
      ).add(const Duration(days: 7)).isAfter(_startOfWeek(now)),
      Timeframe.monthly => !DateTime(
        selectedDate.year,
        selectedDate.month + 1,
        1,
      ).isAfter(DateTime(now.year, now.month, 1)),
    };
  }

  String get formattedPeriod {
    return switch (selectedTimeframe) {
      Timeframe.daily =>
        '${_weekdayName(selectedDate.weekday)} ${selectedDate.day} ${_monthName(selectedDate.month)} ${selectedDate.year}',
      Timeframe.weekly => () {
        final weekStart = _startOfWeek(selectedDate);
        return 'Week of ${weekStart.day} ${_monthName(weekStart.month)} ${weekStart.year}';
      }(),
      Timeframe.monthly =>
        '${_monthName(selectedDate.month)} ${selectedDate.year}',
    };
  }

  DateTime _dateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  DateTime _startOfWeek(DateTime date) =>
      _dateOnly(date).subtract(Duration(days: date.weekday - 1));

  String _weekdayName(int weekday) {
    const days = ['', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday];
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }
}
