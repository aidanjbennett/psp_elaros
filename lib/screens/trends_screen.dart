import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:psp_elaros/models/trend_enums.dart';
import 'package:psp_elaros/models/trend_view_model.dart';
import 'package:psp_elaros/style/app_style.dart';
import 'package:psp_elaros/widgets/charts/heart_rate_chart.dart';
import 'package:psp_elaros/widgets/charts/hrv_chart.dart';
import 'package:psp_elaros/widgets/charts/steps_chart.dart';
import 'package:psp_elaros/widgets/charts/zones_chart.dart';
import 'package:psp_elaros/widgets/date_navigation_header.dart';

class TrendsScreen extends StatelessWidget {
  const TrendsScreen({super.key});

  String _metricLabel(MetricType metric) {
    return switch (metric) {
      MetricType.heartRate => 'Heart Rate',
      MetricType.hrv => 'HRV',
      MetricType.steps => 'Steps',
      MetricType.sleep => 'Sleep',
    };
  }

  Widget _buildChart(TrendsViewModel vm) {
    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.hasError) {
      return const Center(child: Text('Failed to load data'));
    }

    if (vm.spots.isEmpty &&
        vm.selectedMetric != MetricType.steps &&
        vm.selectedMetric != MetricType.sleep) {
      return const Center(child: Text('No data for this period'));
    }

    return switch (vm.selectedMetric) {
      MetricType.heartRate => HeartRateChart(
        timeframe: vm.selectedTimeframe,
        selectedDate: vm.selectedDate,
        spots: vm.spots,
      ),
      MetricType.hrv => HRVChart(
        timeframe: vm.selectedTimeframe,
        selectedDate: vm.selectedDate,
        spots: vm.spots,
      ),
      MetricType.steps => StepsChart(
        timeframe: vm.selectedTimeframe,
        selectedDate: vm.selectedDate,
        values: const [],
      ),
      MetricType.sleep => const Center(child: Text('Sleep chart coming soon')),
    };
  }

  Future<void> _pickDate(BuildContext context, TrendsViewModel vm) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: vm.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      vm.setDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TrendsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("BetterTrack"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
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
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.onBackground),
              ),
              const SizedBox(height: 12),
              DateNavigationHeader(
                label: vm.formattedPeriod,
                onPrevious: vm.goToPreviousPeriod,
                onNext: vm.goToNextPeriod,
                onPickDate: () => _pickDate(context, vm),
                canGoForward: vm.canMoveForward,
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
                        value: vm.selectedMetric,
                        isExpanded: true,
                        items: MetricType.values
                            .map(
                              (m) => DropdownMenuItem(
                                value: m,
                                child: Text(_metricLabel(m)),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) vm.setMetric(value);
                        },
                      ),
                      const SizedBox(height: 16),
                      SegmentedButton<Timeframe>(
                        segments: const [
                          ButtonSegment(
                            value: Timeframe.daily,
                            label: Text('Daily'),
                          ),
                          ButtonSegment(
                            value: Timeframe.weekly,
                            label: Text('Weekly'),
                          ),
                          ButtonSegment(
                            value: Timeframe.monthly,
                            label: Text('Monthly'),
                          ),
                        ],
                        selected: {vm.selectedTimeframe},
                        onSelectionChanged: (newSelection) {
                          vm.setTimeframe(newSelection.first);
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
                            child: _buildChart(vm),
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
                            child: vm.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : vm.zoneDurations.isEmpty
                                ? const Center(
                                    child: Text('No zone data for this period'),
                                  )
                                : ZonesChart(
                                    timeframe: vm.selectedTimeframe,
                                    selectedDate: vm.selectedDate,
                                    zoneDurations: vm.zoneDurations,
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
