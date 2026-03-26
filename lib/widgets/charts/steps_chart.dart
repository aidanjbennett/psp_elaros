import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:psp_elaros/models/trend_enums.dart';

class StepsChart extends StatelessWidget {
  final Timeframe timeframe;
  final DateTime selectedDate;
  final List<double> values;

  const StepsChart({
    super.key,
    required this.timeframe,
    required this.selectedDate,
    required this.values,
  });

  String xLabel(double value) {
    switch (timeframe) {
      case Timeframe.daily:
        const labels = ['6am', '9am', '12pm', '3pm', '6pm', '9pm'];
        return value.toInt() >= 0 && value.toInt() < labels.length
            ? labels[value.toInt()]
            : '';
      case Timeframe.weekly:
        const labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        return value.toInt() >= 0 && value.toInt() < labels.length
            ? labels[value.toInt()]
            : '';
      case Timeframe.monthly:
        const labels = ['W1', 'W2', 'W3', 'W4'];
        return value.toInt() >= 0 && value.toInt() < labels.length
            ? labels[value.toInt()]
            : '';
    }
  }

  double maxY() {
    switch (timeframe) {
      case Timeframe.daily:
        return 8000;
      case Timeframe.weekly:
        return 12000;
      case Timeframe.monthly:
        return 60000;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: maxY(),
        alignment: BarChartAlignment.spaceBetween,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(color: Colors.black12),
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 22,
              getTitlesWidget: (value, meta) {
                if (value % 1 != 0) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    xLabel(value),
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              },
            ),
          ),
        ),
        barGroups: List.generate(
          values.length,
              (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: values[index],
                width: 16,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}