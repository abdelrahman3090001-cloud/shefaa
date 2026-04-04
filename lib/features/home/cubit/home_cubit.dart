import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void getHomeData() async {
    emit(const HomeLoading());
    
    // محاكاة الاتصال بالسيرفر
    await Future.delayed(const Duration(seconds: 2));
    
    // بيانات وهمية (Mock Data) للتجربة حالياً مطابقة للصورة
    final appointments = [
      {
        'date': 'Sep 18',
        'doctor': 'Dr. Khaled El Eteby',
        'specialization': 'Neurologist',
        'location': 'Future Life Clinics',
        'time': '8:00 PM',
        'day': 'Thursday',
      }
    ];

    final facilities = [
      {
        'name': 'Medical Center 1 - Madinaty South Sector',
        'distance': '5.4 km away',
        'rating': '3.8',
      },
      {
        'name': 'Al-Mokhtabar Labs',
        'distance': '2.9 km away',
        'rating': '3.6',
      },
      {
        'name': 'El Shrouk Central Hospital',
        'distance': '3.1 km away',
        'rating': '3.3',
      }
    ];
    
    emit(HomeSuccess(appointments: appointments, facilities: facilities));
  }
}
