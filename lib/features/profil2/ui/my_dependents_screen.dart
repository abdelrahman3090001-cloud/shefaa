import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import 'widgets/delete_dependent_dialog.dart';

class MyDependentsScreen extends StatelessWidget {
  const MyDependentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dependents = [
      'Sara Ahmed',
      'Mostafa Mahmoud',
      'Rahma Mahmoud',
      'Karim Ahmed',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: Column(
        children: [
          // Header
          Container(
            height: 110.h,
            width: double.infinity,
            color: AppColors.deepGreen,
            padding: EdgeInsets.only(top: 45.h, left: 15.w, right: 15.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.r),
                ),
                const Spacer(),
                Text(
                  'My Dependent',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 20),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(24.r),
              itemCount: dependents.length,
              separatorBuilder: (context, index) => SizedBox(height: 15.h),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dependents[index],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      InkWell(
                        onTap: () => showDeleteDependentDialog(context, dependents[index]),
                        child: Icon(Icons.delete_outline, color: Colors.red, size: 20.r),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: AppButton(
              title: 'Add Dependent',
              onTap: () => Navigator.pushNamed(context, Routes.addDependentScreen),
            ),
          ),
          SizedBox(height: 80.h), // Space for bottom nav
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
        child: AppBottomNavBar(
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
            }
          },
        ),
      ),
    );
  }
}
