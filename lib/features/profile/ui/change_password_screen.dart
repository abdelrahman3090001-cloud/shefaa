import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom-text_form_field.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBottomNavBar(
            currentIndex: 3,
            onTap: (index) {
              if (index == 0) {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.homeScreen, (route) => false);
              }
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الهيدر الجديد الموحد
            Container(
              height: 110.h,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white, size: 20),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Spacer(flex: 2),
                      Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Old password'),
                  CustomTextFormField(
                    hintText: 'Should be at least 8 characters long',
                    isObscureText: true,
                    suffixIcon: Icon(Icons.visibility_off_outlined,
                        color: AppColors.gray, size: 20.r),
                  ),
                  SizedBox(height: 20.h),
                  _buildLabel('New Password'),
                  CustomTextFormField(
                    hintText: 'Should be at least 8 characters long',
                    isObscureText: true,
                    suffixIcon: Icon(Icons.visibility_off_outlined,
                        color: AppColors.gray, size: 20.r),
                  ),
                  SizedBox(height: 40.h),
                  AppButton(
                    title: 'Change password',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Password Changed Successfully'),
                            backgroundColor: AppColors.mainGreen),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(text,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
    );
  }
}
