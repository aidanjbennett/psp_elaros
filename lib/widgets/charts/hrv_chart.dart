import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:psp_elaros/models/trend_enums.dart';

class HRVChart extends StatelessWidget {
  final Timeframe timeframe;
  final DateTime selectedDate;
  final List<FlSpot> spots;

  const HRVChart({
    super.key,
    required this.timeframe,
    required this.selectedDate,
    required this.spots,
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

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          handleBuiltInTouches: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                return LineTooltipItem(
                  '${spot.y.toInt()} ms',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }).toList();
            },
          ),
        ),
        minX: 0,
        maxX: (spots.length - 1).toDouble(),
        minY: 20,
        maxY: 60,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 5,
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
              reservedSize: 32,
              interval: 5,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 22,
              getTitlesWidget: (value, meta) {
                if (value % 1 != 0) return const SizedBox.shrink();
                return Text(
                  xLabel(value),
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 3,
            dotData: const FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}