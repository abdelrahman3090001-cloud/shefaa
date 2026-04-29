import '../models/facility_model.dart';

class GpsRepo {
  Future<List<FacilityModel>> getNearbyFacilities() async {
    // محاكاة طلب من السيرفر
    await Future.delayed(const Duration(seconds: 1));
    
    final List<Map<String, dynamic>> mockData = [
      {
        'name': 'Medical Center 1 - Madinaty South Sector',
        'distance': '5.4 km away',
        'rating': '3.8',
        'type': 'Hospital',
        'isOpen': true,
      },
      {
        'name': 'Al-Mokhtabar Labs',
        'distance': '2.9 km away',
        'rating': '3.6',
        'type': 'Laboratory',
        'isOpen': true,
      },
      {
        'name': 'El Shrouk Central Hospital',
        'distance': '3.1 km away',
        'rating': '3.3',
        'type': 'Hospital',
        'isOpen': true,
      }
    ];

    return mockData.map((e) => FacilityModel.fromJson(e)).toList();
  }
}
