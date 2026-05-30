import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import 'widgets/find_doctor_widgets.dart';

class FindDoctorScreen extends StatelessWidget {
  const FindDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: Column(
        children: [
          Container(
            height: 110.h,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                AppColors.mainGreen, // الفاتح
                AppColors.deepGreen, // الغامق
              ],
              begin: Alignment.bottomCenter, // البداية من تحت (الفاتح تحت)
              end: Alignment.topCenter,    // النهاية فوق (الغامق فوق)
            )

            ),
            child: Padding(
              padding: EdgeInsets.only(top: 45.h, left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // مساحة فارغة لموازنة الهيدر وتوسيط العنوان
                  SizedBox(width: 28.r),
                  Text(
                    'Find Doctors',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.bookmarkedDoctorsScreen);
                    },
                    child: Icon(Icons.bookmark_border, color: Colors.white, size: 28.r),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DoctorSearchBar(),
                  SizedBox(height: 15.h),
                  Text(
                    'Most Popular Specialties',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  const SpecialitiesList(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBottomNavBar(
            currentIndex: 1,
            onTap: (index) {
              if (index == 0) {
                Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
              }
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
