class MedicalRecordModel {
  final String title;
  final String date;
  final String type; // e.g., PDF, Image
  final String fileName;

  MedicalRecordModel({
    required this.title,
    required this.date,
    required this.type,
    required this.fileName,
  });
}

class MedicalInfoModel {
  final String fullName;
  final String dob;
  final String phone;
  final String bloodType;
  final String weight;
  final String height;
  final List<String> chronicConditions;
  final String insuranceProvider;
  final String insuranceId;
  final List<String> allergies;

  MedicalInfoModel({
    required this.fullName,
    required this.dob,
    required this.phone,
    required this.bloodType,
    required this.weight,
    required this.height,
    required this.chronicConditions,
    required this.insuranceProvider,
    required this.insuranceId,
    required this.allergies,
  });
}
