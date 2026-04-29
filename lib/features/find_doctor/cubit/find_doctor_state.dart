import '../data/models/doctor_model.dart';

abstract class FindDoctorState {}

class FindDoctorInitial extends FindDoctorState {}

class FindDoctorLoading extends FindDoctorState {}

class FindDoctorSuccess extends FindDoctorState {
  final List<DoctorModel> doctors;
  FindDoctorSuccess(this.doctors);
}

class FindDoctorError extends FindDoctorState {
  final String error;
  FindDoctorError(this.error);
}
