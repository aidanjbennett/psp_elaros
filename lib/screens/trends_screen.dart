import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:psp_elaros/models/trend_enums.dart';
import 'package:psp_elaros/models/zone_duration.dart';
import 'package:psp_elaros/services/trends_service.dart';
import 'package:psp_elaros/style/app_style.dart';
import 'package:psp_elaros/widgets/charts/heart_rate_chart.dart';
import 'package:psp_elaros/widgets/charts/hrv_chart.dart';
import 'package:psp_elaros/widgets/charts/steps_chart.dart';
import 'package:psp_elaros/widgets/charts/zones_chart.dart';
import 'package:psp_elaros/widgets/date_navigation_header.dart';

class TrendsScreen extends StatefulWidget {
  const TrendsScreen({super.key});

  @override
  State<TrendsScreen> createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  final TrendsService trendsService = TrendsService();

  MetricType selectedMetric = MetricType.heartRate;
  Timeframe selectedTimeframe = Timeframe.weekly;
  DateTime selectedDate = DateTime.now();

  final List<MetricType> metrics = MetricType.values;

  DropdownMenuItem<MetricType> buildMetricItem(MetricType metric) {
    return DropdownMenuItem<MetricType>(
      value: metric,
      child: Text(metricLabel(metric)),
    );
  }

  String metricLabel(MetricType metric) {
    switch (metric) {
      case MetricType.heartRate:
        return 'Heart Rate';
      case MetricType.hrv:
        return 'HRV';
      case MetricType.steps:
        return 'Steps';
      case MetricType.sleep:
        return 'Sleep';
    }
  }

  Widget buildChart() {
    switch (selectedMetric) {
      case MetricType.heartRate:
        return HeartRateChart(
          timeframe: selectedTimeframe,
          selectedDate: selectedDate,
          spots: trendsService.getHeartRateSpots(
            timeframe: selectedTimeframe,
            selectedDate: selectedDate,
          ),
        );
      case MetricType.hrv:
        return HRVChart(
          timeframe: selectedTimeframe,
          selectedDate: selectedDate,
          spots: trendsService.getHRVSpots(
            timeframe: selectedTimeframe,
            selectedDate: selectedDate,
          ),
        );
      case MetricType.steps:
        return StepsChart(
          timeframe: selectedTimeframe,
          selectedDate: selectedDate,
          values: trendsService.getStepsValues(
            timeframe: selectedTimeframe,
            selectedDate: selectedDate,
          ),
        );
      case MetricType.sleep:
        return const Center(
          child: Text('Sleep chart coming soon'),
        );
    }
  }

  List<ZoneDuration> getZoneDurations() {
    return trendsService.getZoneDurations(
      timeframe: selectedTimeframe,
      selectedDate: selectedDate,
    );
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void goToPreviousPeriod() {
    setState(() {
      switch (selectedTimeframe) {
        case Timeframe.daily:
          selectedDate = selectedDate.subtract(const Duration(days: 1));
          break;
        case Timeframe.weekly:
          selectedDate = selectedDate.subtract(const Duration(days: 7));
          break;
        case Timeframe.monthly:
          selectedDate = DateTime(
            selectedDate.year,
            selectedDate.month - 1,
            selectedDate.day,
          );
          break;
      }
    });
  }

  void goToNextPeriod() {
    if (!canMoveForward()) return;

    setState(() {
      switch (selectedTimeframe) {
        case Timeframe.daily:
          selectedDate = selectedDate.add(const Duration(days: 1));
          break;
        case Timeframe.weekly:
          selectedDate = selectedDate.add(const Duration(days: 7));
          break;
        case Timeframe.monthly:
          selectedDate = DateTime(
            selectedDate.year,
            selectedDate.month + 1,
            selectedDate.day,
          );
          break;
      }
    });
  }

  bool canMoveForward() {
    final now = DateTime.now();

    switch (selectedTimeframe) {
      case Timeframe.daily:
        return _dateOnly(selectedDate).isBefore(_dateOnly(now));

      case Timeframe.weekly:
        final candidate = startOfWeek(selectedDate).add(const Duration(days: 7));
        return !candidate.isAfter(startOfWeek(now));

      case Timeframe.monthly:
        final candidate = DateTime(selectedDate.year, selectedDate.month + 1, 1);
        final currentMonth = DateTime(now.year, now.month, 1);
        return !candidate.isAfter(currentMonth);
    }
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  DateTime startOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  String formatSelectedPeriod() {
    switch (selectedTimeframe) {
      case Timeframe.daily:
        return '${weekdayName(selectedDate.weekday)} ${selectedDate.day} ${monthName(selectedDate.month)} ${selectedDate.year}';

      case Timeframe.weekly:
        final weekStart = startOfWeek(selectedDate);
        return 'Week of ${weekStart.day} ${monthName(weekStart.month)} ${weekStart.year}';

      case Timeframe.monthly:
        return '${monthName(selectedDate.month)} ${selectedDate.year}';
    }
  }

  String weekdayName(int weekday) {
    const days = [
      '',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];
    return days[weekday];
  }

  String monthName(int month) {
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
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trends",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              DateNavigationHeader(
                label: formatSelectedPeriod(),
                onPrevious: goToPreviousPeriod,
                onNext: goToNextPeriod,
                onPickDate: pickDate,
                canGoForward: canMoveForward(),
              ),
              const SizedBox(height: 12),
              Container(
                height: 460,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<MetricType>(
                        value: selectedMetric,
                        isExpanded: true,
                        items: metrics.map(buildMetricItem).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedMetric = value;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      SegmentedButton<Timeframe>(
                        segments: const [
                          ButtonSegment<Timeframe>(
                            value: Timeframe.daily,
                            label: Text('Daily'),
                          ),
                          ButtonSegment<Timeframe>(
                            value: Timeframe.weekly,
                            label: Text('Weekly'),
                          ),
                          ButtonSegment<Timeframe>(
                            value: Timeframe.monthly,
                            label: Text('Monthly'),
                          ),
                        ],
                        selected: {selectedTimeframe},
                        onSelectionChanged: (Set<Timeframe> newSelection) {
                          setState(() {
                            selectedTimeframe = newSelection.first;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: buildChart(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 360,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Heart Rate Zones",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ZonesChart(
                              timeframe: selectedTimeframe,
                              selectedDate: selectedDate,
                              zoneDurations: getZoneDurations(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}