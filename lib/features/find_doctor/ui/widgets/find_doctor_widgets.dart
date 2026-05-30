import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/routes/routes.dart';

class DoctorSearchBar extends StatelessWidget {
  final String? hint;
  const DoctorSearchBar({super.key, this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          hintText: hint ?? 'Search for specialty or doctor...',
          hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.gray),
          prefixIcon: Icon(Icons.search, color: AppColors.gray, size: 22.r),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(44.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.mainGreen),
            borderRadius: BorderRadius.circular(44.r),
          ),
          fillColor: const Color(0xFFF5F5F5),
          filled: true,
        ),
      ),
    );
  }
}

class SpecialitiesList extends StatelessWidget {
  const SpecialitiesList({super.key});

  final List<Map<String, dynamic>> specialities = const [
    {'name': 'Dentistry', 'icon': 'assets/images/Maps4.png'},
    {'name': 'Dermatology', 'icon': 'assets/images/Vector (Stroke).png'},
    {'name': 'Neurology', 'icon': 'assets/images/img.png'},
    {'name': 'Orthopedics', 'icon': 'assets/images/img_1.png'},
    {'name': 'Cardiology and Vascular Disease', 'icon': 'assets/images/img_2.png'},
    {'name': 'Ear, Nose, and Throat', 'icon': 'assets/images/img_3.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: specialities.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.doctorSearchResultsScreen);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  specialities[index]['icon'],
                  width: 28.r,
                  height: 28.r,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Text(
                    specialities[index]['name'],
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
