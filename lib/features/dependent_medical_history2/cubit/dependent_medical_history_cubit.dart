import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependent_medical_history_state.dart';

class DependentMedicalHistoryCubit extends Cubit<DependentMedicalHistoryState> {
  DependentMedicalHistoryCubit() : super(const DependentMedicalHistoryInitial());

  void getMedicalHistory() async {
    emit(const DependentMedicalHistoryLoading());
    
    // محاكاة وقت التحميل
    await Future.delayed(const Duration(milliseconds: 500));
    
    // إرسال حالة النجاح، والبيانات سيتم إدارتها من الـ UI مباشرة
    emit(const DependentMedicalHistorySuccess());
  }
}
