import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import 'package:shefaa/core/widgets/app_bottom_nav_bar2.dart';

class Settings2Screen extends StatelessWidget {
  const Settings2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      // استخدام Container بارتفاع محدد لضمان استقرار الـ Layout
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.h, left: 15.w, right: 15.w),
          child: AppBottomNavBar2(
            currentIndex: 0, 
            onTap: (index) {},
          ),
        ),
      ),
      body: Column(
        children: [
          // Header الموحد مع SafeArea لضمان الوضوح
          Container(
            height: 120.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  AppColors.NpGreen,
                  AppColors.mainGreen,
                ],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.r),
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
                    const SizedBox(width: 40), // موازن لزر العودة
                  ],
                ),
              ),
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
    );
  }

  Widget _buildSettingItem(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(44.r),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey.shade600,
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
