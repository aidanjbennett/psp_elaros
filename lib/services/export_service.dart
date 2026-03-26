import 'dart:convert';
import 'dart:io';


import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:pdf/pdf.dart';
import 'lib/widgets' as pw;
// import 'package:share_plus/share_plus.dart';

import '../data/local/database.dart';



// export rang
enum ExportRange {
  last7Days,
  last30Days,
  last3Months,
  allTime,
}

DateTime? _getStartDate(ExportRange range) {
  final now = DateTime.now();

  switch (range) {
    case ExportRange.last7Days:
      return now.subtract(const Duration(days: 7));
    case ExportRange.last30Days:
      return now.subtract(const Duration(days: 30));
    case ExportRange.last3Months:
      return now.subtract(const Duration(days: 90));
    case ExportRange.allTime:
      return null;
  }
}

// class for export serivec
class ExportService {
  final AppDatabase db;

  ExportService(this.db);

  get Share => null;

  // directory
  Future<Directory> _getDirectory() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        throw Exception("Storage permission denied");
      }

      final dir = await getExternalStorageDirectory();
      return dir!;
    } else {
      return await getApplicationDocumentsDirectory();
    }
  }


  // fetch the data
  Future<Map<String, List<Map<String, dynamic>>>> _fetchData(
      ExportRange range) async {
    final startDate = _getStartDate(range);

    final stepsQuery = db.select(db.steps)
      ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]);
    if (startDate != null) {
      stepsQuery.where((t) => t.timestamp.isBiggerOrEqualValue(startDate));
    }

    final sleepQuery = db.select(db.sleep)
      ..orderBy([(t) => OrderingTerm.desc(t.startTime)]);
    if (startDate != null) {
      sleepQuery.where((t) => t.startTime.isBiggerOrEqualValue(startDate));
    }

    final hrQuery = db.select(db.heartRate)
      ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]);
    if (startDate != null) {
      hrQuery.where((t) => t.timestamp.isBiggerOrEqualValue(startDate));
    }


    final steps = await stepsQuery.get();
    final sleep = await sleepQuery.get();
    final heartRate = await hrQuery.get();

    return {
      "steps": steps.map((e) => e.toJson()).toList(),
      "sleep": sleep.map((e) => e.toJson()).toList(),
      "heartRate": heartRate.map((e) => e.toJson()).toList(),
    };
  }


  // json
  Future<File> exportJson(ExportRange range) async {
    final data = await _fetchData(range);
    final dir = await _getDirectory();

    final file = File('${dir.path}/health_export.json');

    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(data),
    );

    return file;
  }


  // csv
  Future<File> exportCsv(ExportRange range) async {
    final data = await _fetchData(range);
    final dir = await _getDirectory();

    final file = File('${dir.path}/health_export.csv');

    final buffer = StringBuffer();

    String escapeCsv(value) {
      final str = value.toString();
      if (str.contains(',')) {
        return '"$str"';
      }
      return str;
    }

    data.forEach((table, rows) {
      if (rows.isEmpty) return;

      final headers = rows.first.keys.toList();

      buffer.writeln("=== $table ===");
      buffer.writeln(headers.join(","));

      for (final row in rows) {
        buffer.writeln(
            headers.map((h) => escapeCsv(row[h])).join(","));
      }

      buffer.writeln();
    });

    await file.writeAsString(buffer.toString());
  }


  // pdf
  Future<File> exportPdf(ExportRange range) async {
    final data = await _fetchData(range);
    final dir = await _getDirectory();

    final pdf = pw.Document();

    final titleStyle = pw.TextStyle(
      fontSize: 22,
      fontWeight: pw.FontWeight.bold,
    );

    final sectionStyle = pw.TextStyle(
      fontSize: 16,
      fontWeight: pw.FontWeight.bold,
    );

    final cellStyle = const pw.TextStyle(fontSize: 10);

    final headerMap = {
      "timestamp": "Time",
      "steps": "Steps",
      "startTime": "Sleep Start",
      "endTime": "Sleep End",
      "dailyAvg": "Avg HR",
      "hrZone": "HR Zone",
    };

    String formatHeader(String key) => headerMap[key] ?? key;

    String formatValue(dynamic value) {
      if (value is DateTime) {
        return "${value.day}/${value.month}/${value.year} "
            "${value.hour}:${value.minute.toString().padLeft(2, '0')}";
      }

      if (value is String && DateTime.tryParse(value) != null) {
        final dt = DateTime.parse(value);
        return "${dt.day}/${dt.month}/${dt.year} "
            "${dt.hour}:${dt.minute.toString().padLeft(2, '0')}";
      }

      return value.toString();
    }

    // summary page
    final stepsData = data["steps"] ?? [];
    final sleepData = data["sleep"] ?? [];

    int totalSteps = 0;
    for (final row in stepsData) {
      totalSteps += (row["steps"] ?? 0) as int;
    }

    final avgSteps =
    stepsData.isEmpty ? 0 : (totalSteps / stepsData.length).round();

    Duration totalSleep = Duration.zero;
    for (final row in sleepData) {
      final start = row["startTime"] is String
          ? DateTime.tryParse(row["startTime"])
          : row["startTime"];
      final end = row["endTime"] is String
          ? DateTime.tryParse(row["endTime"])
          : row["endTime"];

      if (start != null && end != null) {
        totalSleep += end.difference(start);
      }
    }

    final avgSleepHours = sleepData.isEmpty
        ? 0
        : (totalSleep.inMinutes / sleepData.length) / 60;

    // this should make pretty graphs but i honestly am nt hopeful
    final stepChartData = stepsData
        .take(10)
        .map((e) => (e["steps"] ?? 0) as int)
        .toList();

    final hrChartData = (data["heartRate"] ?? [])
        .take(10)
        .map((e) => (e["dailyAvg"] ?? 0) as int)
        .toList();

    pw.Widget buildBarChart(List<int> values, String title) {
      if (values.isEmpty) return pw.Container();

      final maxVal = values.every((v) => v == 0)
          ? 1
          : values.reduce((a, b) => a > b ? a : b);

      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(title, style: sectionStyle),
          pw.SizedBox(height: 10),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: values.map((v) {
              final height = (v / maxVal) * 100;

              return pw.Container(
                width: 10,
                height: height,
                margin: const pw.EdgeInsets.symmetric(horizontal: 2),
              );
            }).toList(),
          ),
          pw.SizedBox(height: 20),
        ],
      );
    }

    pw.Widget buildTable(String title, List<Map<String, dynamic>> rows) {
      if (rows.isEmpty) {
        return pw.Text("$title (No data)", style: sectionStyle);
      }

      final headers = rows.first.keys.toList();

      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title[0].toUpperCase() + title.substring(1),
            style: sectionStyle,
          ),
          pw.SizedBox(height: 8),
          pw.Table(
            border: pw.TableBorder.all(width: 0.5),
            children: [
              pw.TableRow(
                children: headers.map((h) {
                  return pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text(
                      formatHeader(h),
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  );
                }).toList(),
              ),
              ...List.generate(rows.length, (index) {
                final row = rows[index];

                final bg = index % 2 == 0
                    ? null
                    : const pw.BoxDecoration(
                );

                return pw.TableRow(
                  decoration: bg,
                  children: headers.map((h) {
                    return pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        formatValue(row[h]),
                        style: cellStyle,
                      ),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
          pw.SizedBox(height: 20),
        ],
      );
    }

    pdf.addPage(
      pw.MultiPage(
        margin: const pw.EdgeInsets.all(24),
        build: (_) =>
        [
          pw.Text("Health Report", style: titleStyle),
          pw.SizedBox(height: 10),
          pw.Text("Generated: ${DateTime.now()}",
              style: const pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 20),

          pw.Text("Summary", style: sectionStyle),
          pw.Text("Average Steps: $avgSteps"),
          pw.Text(
              "Average Sleep (hrs): ${avgSleepHours.toStringAsFixed(1)}"),

          pw.SizedBox(height: 20),

          buildBarChart(stepChartData, "Steps"),
          buildBarChart(hrChartData, "Heart Rate"),

          ...data.entries.map((e) => buildTable(e.key, e.value)),
        ],
      ),
    );

    final file = File('${dir.path}/health_export.pdf');
    await file.writeAsBytes(await pdf.save());

    return file;
  }

  // ios
//   Future<void> _shareIfNeeded(File file) async {
//     if (Platform.isIOS) {
//       await Share.shareXFiles([XFile(file.path)]);
//     }
//   }
// }



}

class Permission {
  static get storage => null;
}