class PrescriptionModel {
  final String medicineName;
  final String dosage;
  final String instruction;
  final List<String> days;
  final int currentDay;
  final int totalDays;
  final List<String> times;

  PrescriptionModel({
    required this.medicineName,
    required this.dosage,
    required this.instruction,
    required this.days,
    required this.currentDay,
    required this.totalDays,
    required this.times,
  });
}
