import 'package:flutter_bloc/flutter_bloc.dart';
import 'real_time_location2_state.dart';

class RealTimeLocation2Cubit extends Cubit<RealTimeLocation2State> {
  RealTimeLocation2Cubit() : super(const RealTimeLocation2Initial());

  void getLocationData() async {
    emit(const RealTimeLocation2Loading());
    
    // محاكاة وقت التحميل
    await Future.delayed(const Duration(milliseconds: 500));
    
    // إرسال حالة النجاح، والبيانات سيتم إدارتها من الـ UI مباشرة كما في الشاشات السابقة
    emit(const RealTimeLocation2Success());
  }
}
