import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

// 1. GPS Header
class GpsHeader extends StatelessWidget {
  const GpsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w, bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColors.mainGreen,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 30), // للتوسيط
          Text(
            'Find Medical Services',
            style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.bookmark_outline, color: Colors.white, size: 28.r),
        ],
      ),
    );
  }
}

// 2. Gps Search Bar
class GpsSearchBar extends StatelessWidget {
  const GpsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search facilities..',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: AppColors.mainGreen),
          ),
        ),
      ),
    );
  }
}

// 3. Gps Categories (Toggle)
class GpsCategories extends StatefulWidget {
  const GpsCategories({super.key});

  @override
  State<GpsCategories> createState() => _GpsCategoriesState();
}

class _GpsCategoriesState extends State<GpsCategories> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> categories = [
    {'name': 'Hospital', 'icon': Icons.local_hospital_outlined},
    {'name': 'Pharmacy', 'icon': Icons.local_pharmacy_outlined},
    {'name': 'Laboratory', 'icon': Icons.biotech_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: List.generate(categories.length, (index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF133B2C) : Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: isSelected ? Colors.transparent : Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(categories[index]['icon'], 
                    color: isSelected ? Colors.white : Colors.grey, size: 18.r),
                  SizedBox(width: 8.w),
                  Text(
                    categories[index]['name'],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// 4. Map Placeholder
class GpsMapView extends StatelessWidget {
  const GpsMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.r),
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/splash.png'), // محاكاة للخريطة حالياً
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Center(
        child: Icon(Icons.location_on, color: Colors.red, size: 40.r),
      ),
    );
  }
}
