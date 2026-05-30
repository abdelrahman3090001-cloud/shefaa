import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';

class Settings2Screen extends StatelessWidget {
  const Settings2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  'Settings',
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
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  _buildSettingItem('Country', 'Egypt'),
                  SizedBox(height: 15.h),
                  _buildSettingItem('Language', 'English'),
                ],
              ),
            ),
          ),
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

  Widget _buildSettingItem(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(44.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20.r),
            ],
          ),
        ],
      ),
    );
  }
}
