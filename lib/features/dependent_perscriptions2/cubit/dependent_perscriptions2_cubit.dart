import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependent_perscriptions2_state.dart';

class DependentPrescriptions2Cubit extends Cubit<DependentPrescriptions2State> {
  DependentPrescriptions2Cubit() : super(const DependentPrescriptions2Initial());

  void getPrescriptions() async {
    emit(const DependentPrescriptions2Loading());
    
    // محاكاة وقت التحميل
    await Future.delayed(const Duration(milliseconds: 500));
    
    // إرسال حالة النجاح، والبيانات سيتم إدارتها من الـ UI مباشرة كما في الشاشات السابقة
    emit(const DependentPrescriptions2Success());
  }
}
