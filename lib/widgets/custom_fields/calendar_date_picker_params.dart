class CalendarDatePickerParams {
  CalendarDatePickerParams({
    required this.firstDate,
    required this.lastDate,
    this.initialDate,
    this.currentDate,
  });

  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? initialDate;
  DateTime? currentDate;
}
