import 'package:flutter_bloc/flutter_bloc.dart';
import 'guardian_home_state.dart';

class GuardianHomeCubit extends Cubit<GuardianHomeState> {
  GuardianHomeCubit() : super(const GuardianHomeInitial());

  void getGuardianHomeData() async {
    emit(const GuardianHomeLoading());
    
    // محاكاة وقت التحميل فقط
    await Future.delayed(const Duration(milliseconds: 500));
    
    // كـ Software Engineer: تم نقل البيانات لصفحة الـ UI مباشرة لتكون أمام عينك وسهلة التعديل
    emit(const GuardianHomeSuccess()); 
  }
}
