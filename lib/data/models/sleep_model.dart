class Sleep {
  final Duration totalDuration;
  final DateTime dateChecked;

  Sleep({required this.totalDuration, required this.dateChecked});

  double get totalHours => totalDuration.inMinutes / 60.0;
}
