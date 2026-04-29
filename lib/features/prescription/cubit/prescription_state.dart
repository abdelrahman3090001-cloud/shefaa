import '../data/models/prescription_model.dart';

abstract class PrescriptionState {}

class PrescriptionInitial extends PrescriptionState {}

class PrescriptionLoading extends PrescriptionState {}

class PrescriptionSuccess extends PrescriptionState {
  final List<PrescriptionModel> prescriptions;
  PrescriptionSuccess(this.prescriptions);
}

class PrescriptionError extends PrescriptionState {
  final String error;
  PrescriptionError(this.error);
}
