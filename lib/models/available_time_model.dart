class AvailableTime {
  final String time;
  final bool isSchedule;
  final bool isFutureSchedule;
  final bool isCancel;

  AvailableTime({
    required this.time,
    required this.isSchedule,
    required this.isFutureSchedule,
    required this.isCancel,
  });
}