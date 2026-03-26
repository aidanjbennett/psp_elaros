import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:psp_elaros/models/trend_enums.dart';

class HeartRateChart extends StatelessWidget {
  final Timeframe timeframe;
  final DateTime selectedDate;
  final List<FlSpot> spots;

  const HeartRateChart({
    super.key,
    required this.timeframe,
    required this.selectedDate,
    required this.spots,
  });

  String xLabel(double value) {
    switch (timeframe) {
      case Timeframe.daily:
        const labels = [
          '6am',
          '9am',
          '12pm',
          '3pm',
          '6pm',
          '9pm',
          '12am',
          '3am',
        ];
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

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    if (value < 55) return const SizedBox.shrink();

    return Text(
      value.toInt().toString(),
      style: const TextStyle(fontSize: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double minHeartRate = 55;
    const double maxHeartRate = 200;

    const double zone1Top = 65;
    const double zone2Top = 90;
    const double zone3Top = 125;
    const double zone4Top = 170;

    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          handleBuiltInTouches: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                return LineTooltipItem(
                  '${spot.y.toInt()} bpm',
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
        minY: minHeartRate,
        maxY: maxHeartRate,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(color: Colors.black12),
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        rangeAnnotations: RangeAnnotations(
          horizontalRangeAnnotations: [
            HorizontalRangeAnnotation(
              y1: minHeartRate,
              y2: zone1Top,
              color: Colors.blue.withValues(alpha: 0.1),
            ),
            HorizontalRangeAnnotation(
              y1: zone1Top,
              y2: zone2Top,
              color: Colors.green.withValues(alpha: 0.1),
            ),
            HorizontalRangeAnnotation(
              y1: zone2Top,
              y2: zone3Top,
              color: Colors.yellow.withValues(alpha: 0.1),
            ),
            HorizontalRangeAnnotation(
              y1: zone3Top,
              y2: zone4Top,
              color: Colors.orange.withValues(alpha: 0.1),
            ),
            HorizontalRangeAnnotation(
              y1: zone4Top,
              y2: maxHeartRate,
              color: Colors.red.withValues(alpha: 0.1),
            ),
          ],
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
              interval: 25,
              getTitlesWidget: leftTitleWidgets,
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
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: zone1Top,
              color: Colors.blue,
              strokeWidth: 1.5,
              dashArray: [6, 4],
            ),
            HorizontalLine(
              y: zone2Top,
              color: Colors.green,
              strokeWidth: 1.5,
              dashArray: [6, 4],
            ),
            HorizontalLine(
              y: zone3Top,
              color: Colors.orange,
              strokeWidth: 1.5,
              dashArray: [6, 4],
            ),
            HorizontalLine(
              y: zone4Top,
              color: Colors.red,
              strokeWidth: 1.5,
              dashArray: [6, 4],
            ),
          ],
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