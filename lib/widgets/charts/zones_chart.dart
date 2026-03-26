import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:psp_elaros/models/trend_enums.dart';
import 'package:psp_elaros/models/zone_duration.dart';

class ZonesChart extends StatelessWidget {
  final Timeframe timeframe;
  final DateTime selectedDate;
  final List<ZoneDuration> zoneDurations;

  const ZonesChart({
    super.key,
    required this.timeframe,
    required this.selectedDate,
    required this.zoneDurations,
  });

  Color zoneColor(int index) {
    switch (index) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.red;
      case 4:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  String formatMinutes(double minutes) {
    if (minutes >= 1440) {
      final days = minutes ~/ 1440;
      final hours = ((minutes % 1440) ~/ 60);
      if (hours == 0) return '${days}d';
      return '${days}d ${hours}h';
    }

    if (minutes >= 60) {
      final hours = minutes ~/ 60;
      final mins = (minutes % 60).round();
      if (mins == 0) return '${hours}h';
      return '${hours}h ${mins}m';
    }

    return '${minutes.round()}m';
  }

  double getMaxMinutes(List<ZoneDuration> values) {
    if (values.isEmpty) return 1;
    final maxValue = values
        .map((zone) => zone.minutes)
        .reduce((a, b) => a > b ? a : b);
    if (maxValue == 0) return 1;
    return maxValue * 1.15;
  }

  @override
  Widget build(BuildContext context) {
    final maxX = getMaxMinutes(zoneDurations);

    return BarChart(
      BarChartData(
        rotationQuarterTurns: 1,
        maxY: maxX,
        alignment: BarChartAlignment.spaceAround,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 70,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= zoneDurations.length) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      formatMinutes(zoneDurations[index].minutes),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 60,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= zoneDurations.length) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      zoneDurations[index].label,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                );
              },
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        barGroups: List.generate(
          zoneDurations.length,
              (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: zoneDurations[index].minutes,
                width: 18,
                color: zoneColor(index),
                borderRadius: BorderRadius.circular(6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}