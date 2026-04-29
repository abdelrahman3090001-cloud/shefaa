import '../data/models/medical_record_model.dart';

abstract class MedicalHistoryState {}

class MedicalHistoryInitial extends MedicalHistoryState {}

class MedicalHistoryLoading extends MedicalHistoryState {}

class MedicalHistorySuccess extends MedicalHistoryState {
  final List<MedicalRecordModel> records;
  final MedicalInfoModel? info;
  MedicalHistorySuccess({required this.records, this.info});
}

class MedicalHistoryError extends MedicalHistoryState {
  final String error;
  MedicalHistoryError(this.error);
}
