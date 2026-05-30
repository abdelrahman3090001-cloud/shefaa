import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom-text_form_field.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
                        'Account',
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
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('First Name*'),
                  const CustomTextFormField(hintText: 'Ahmed'),
                  SizedBox(height: 12.h),
                  _buildLabel('Last Name*'),
                  const CustomTextFormField(hintText: 'Mostafa'),
                  SizedBox(height: 12.h),
                  _buildLabel('Phone Number*'),
                  const CustomTextFormField(hintText: '+20 01012345678'),
                  SizedBox(height: 12.h),
                  _buildLabel('Email Address*'),
                  const CustomTextFormField(hintText: 'Ahmed.Mostafa@email.com'),
                  SizedBox(height: 12.h),
                  _buildLabel('Gender*'),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.deepGreen,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: const Text('Male',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Container(
                          height: 50.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.mainGreen),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: const Text('Female',
                              style: TextStyle(color: AppColors.mainGreen)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  AppButton(
                    title: 'Change Password',
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.changePasswordScreen),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      label: const Text('Delete Account',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    ),
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
