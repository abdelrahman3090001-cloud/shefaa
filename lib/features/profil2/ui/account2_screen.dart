import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom-text_form_field.dart';

class Account2Screen extends StatelessWidget {
  const Account2Screen({super.key});

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
                  'Account',
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
                  _buildLabel('First Name*'),
                  CustomTextFormField(hintText: 'Ahmed'),
                  SizedBox(height: 15.h),
                  _buildLabel('Last Name*'),
                  CustomTextFormField(hintText: 'Mostafa'),
                  SizedBox(height: 15.h),
                  _buildLabel('Phone Number*'),
                  CustomTextFormField(hintText: '+20 01012345678'),
                  SizedBox(height: 15.h),
                  _buildLabel('Email Address*'),
                  CustomTextFormField(hintText: 'Ahmed.Mostafa@email.com'),
                  SizedBox(height: 15.h),
                  _buildLabel('Gender*'),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.deepGreen,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            'Male',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Container(
                          height: 48.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            'Female',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  AppButton(
                    title: 'Change Password',
                    onTap: () => Navigator.pushNamed(context, Routes.changePassword2Screen),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: InkWell(
                      onTap: () => _showDeleteAccountDialog(context),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Delete Account',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(Icons.delete_outline, color: Colors.red, size: 20.r),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.delete_outline, color: Colors.red, size: 60.r),
            SizedBox(height: 20.h),
            Text(
              'Are you sure you want to delete\nyour account?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            AppButton(
              title: 'Yes',
              onTap: () => Navigator.pop(context),
            ),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
