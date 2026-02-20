class Sleep {
  final Duration totalDuration;
  final double lightHours;
  final double deepHours;
  final double remHours;
  final DateTime dateChecked;

  Sleep({
    required this.totalDuration,
    required this.lightHours,
    required this.deepHours,
    required this.remHours,
    required this.dateChecked,
  });

  // Optional: Add a helper to get total hours as a double
  double get totalHours => totalDuration.inMinutes / 60.0;
}
