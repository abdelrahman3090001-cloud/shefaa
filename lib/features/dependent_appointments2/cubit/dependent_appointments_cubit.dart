import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependent_appointments_state.dart';

class DependentAppointmentsCubit extends Cubit<DependentAppointmentsState> {
  DependentAppointmentsCubit() : super(const DependentAppointmentsInitial());

  void getAppointments() async {
    emit(const DependentAppointmentsLoading());
    
    // محاكاة وقت التحميل
    await Future.delayed(const Duration(milliseconds: 500));
    
    // إرسال حالة النجاح، والبيانات سيتم إدارتها من الـ UI مباشرة كما في الشاشات السابقة
    emit(const DependentAppointmentsSuccess());
  }
}
