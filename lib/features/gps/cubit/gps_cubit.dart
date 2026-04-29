import 'package:flutter_bloc/flutter_bloc.dart';
import 'gps_state.dart';

class GpsCubit extends Cubit<GpsState> {
  GpsCubit() : super(const GpsInitial());

  void getGpsData() async {
    emit(const GpsLoading());
    
    // محاكاة تحميل البيانات
    await Future.delayed(const Duration(seconds: 1));
    
    final facilities = [
      {'name': 'Medical Center 1 - Madinaty South Sector', 'distance': '5.4 km away', 'rating': '3.8'},
      {'name': 'Al-Mokhtabar Labs', 'distance': '2.9 km away', 'rating': '3.6'},
      {'name': 'El Shrouk Central Hospital', 'distance': '3.1 km away', 'rating': '3.3'},
    ];
    
    emit(GpsSuccess(facilities: facilities));
  }
}
