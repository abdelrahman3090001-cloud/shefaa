import 'package:flutter_bloc/flutter_bloc.dart';
import 'find_doctor_state.dart';
import '../data/models/doctor_model.dart';

class FindDoctorCubit extends Cubit<FindDoctorState> {
  FindDoctorCubit() : super(FindDoctorInitial());

  void getDoctors() {
    emit(FindDoctorLoading());
    // Simulated data
    final doctors = [
      DoctorModel(
        name: 'Dr. Khaled El Eteby',
        specialization: 'Neurologist',
        rating: '4.8',
        image: 'assets/images/Doctor.png',
        description: 'Specialist in neurology with 10 years of experience.',
        location: 'Future Life Clinics',
        price: '200 EGP',
        availableTimes: ['08:00 PM', '09:00 PM'],
      ),
    ];
    emit(FindDoctorSuccess(doctors));
  }
}
