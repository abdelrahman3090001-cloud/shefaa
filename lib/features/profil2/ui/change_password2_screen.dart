import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom-text_form_field.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';

class ChangePassword2Screen extends StatefulWidget {
  const ChangePassword2Screen({super.key});

  @override
  State<ChangePassword2Screen> createState() => _ChangePassword2ScreenState();
}

class _ChangePassword2ScreenState extends State<ChangePassword2Screen> {
  bool isOldPasswordObscure = true;
  bool isNewPasswordObscure = true;

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
                  'Change Password',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Old password'),
                  CustomTextFormField(
                    hintText: 'Should be at least 8 characters long.',
                    isObscureText: isOldPasswordObscure,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isOldPasswordObscure = !isOldPasswordObscure;
                        });
                      },
                      child: Icon(
                        isOldPasswordObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.grey,
                        size: 20.r,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  _buildLabel('New Password'),
                  CustomTextFormField(
                    hintText: 'Should be at least 8 characters long.',
                    isObscureText: isNewPasswordObscure,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isNewPasswordObscure = !isNewPasswordObscure;
                        });
                      },
                      child: Icon(
                        isNewPasswordObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.grey,
                        size: 20.r,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  AppButton(
                    title: 'Change password',
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
        child: AppBottomNavBar(
          currentIndex: 0, // Assuming it's part of the profile/settings tab
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
