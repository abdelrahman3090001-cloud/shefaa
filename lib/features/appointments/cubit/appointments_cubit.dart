import 'package:flutter_bloc/flutter_bloc.dart';
import 'appointments_state.dart';
import '../data/models/appointment_model.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit() : super(AppointmentsInitial());

  void getAppointments() {
    emit(AppointmentsLoading());
    // Simulated data based on the design
    final appointments = [
      AppointmentModel(
        doctorName: 'Dr. Khaled El Eteby',
        specialization: 'Neurologist',
        location: 'Future Life Clinics',
        time: '8:00 PM',
        day: 'Thursday',
        month: 'Sep',
        date: '18',
        status: 'Confirmed',
      ),
      AppointmentModel(
        doctorName: 'Dr. Khaled El Eteby',
        specialization: 'Neurologist',
        location: 'Future Life Clinics',
        time: '8:00 PM',
        day: 'Thursday',
        month: 'Nov',
        date: '20',
        status: 'Pending',
      ),
      AppointmentModel(
        doctorName: 'Dr. Khaled El Eteby',
        specialization: 'Neurologist',
        location: 'Future Life Clinics',
        time: '8:00 PM',
        day: 'Thursday',
        month: 'Dec',
        date: '25',
        status: 'Canceled',
      ),
    ];
    emit(AppointmentsSuccess(appointments));
  }
}
