enum ExportRange {
  last7Days,
  last30Days,
  last3Months,
  allTime,
}

DateTime? getStartDate(ExportRange range) {
  final now = DateTime.now();

  switch (range) {
    case ExportRange.last7Days:
      return now.subtract(const Duration(days: 7));
    case ExportRange.last30Days:
      return now.subtract(const Duration(days: 30));
    case ExportRange.last3Months:
      return DateTime(now.year, now.month - 3, now.day);
    case ExportRange.allTime:
      return null;
  }
}