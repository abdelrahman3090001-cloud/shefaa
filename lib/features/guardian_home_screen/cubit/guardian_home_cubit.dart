import 'package:flutter_bloc/flutter_bloc.dart';
import 'guardian_home_state.dart';

class GuardianHomeCubit extends Cubit<GuardianHomeState> {
  GuardianHomeCubit() : super(const GuardianHomeInitial());

  void getGuardianHomeData() async {
    emit(const GuardianHomeLoading());
    
    // محاكاة تحميل بيانات الشخص المراقب (Sara Ahmed)
    await Future.delayed(const Duration(seconds: 1));
    
    final appointments = [
      {
        'doctor': 'Doctor Mohamed Refaat',
        'specialization': 'Orthopedic',
        'location': 'Future Life Clinics',
        'time': '7:45 PM',
        'day': 'Thursday',
        'date': '23',
        'month': 'Nov',
        'status': 'Confirmed'
      }
    ];

    emit(GuardianHomeSuccess(
      appointments: appointments,
      locationData: {'name': 'Sara Ahmed', 'lastSeen': 'Live 2m ago'},
    ));
  }
}
