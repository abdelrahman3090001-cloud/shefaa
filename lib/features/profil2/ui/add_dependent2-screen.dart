import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/custom-text_form_field.dart';
import 'package:shefaa/core/widgets/app_bottom_nav_bar2.dart';

class AddDependent2Screen extends StatelessWidget {
  const AddDependent2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7), // لون الخلفية الفاتح كما في الصورة
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 15.w, right: 15.w),
        child: AppBottomNavBar2(
          currentIndex: 0, // قيمة افتراضية
          onTap: (index) {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الهيدر الجديد باستخدام Container المخصص
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
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                      ),
                      const Spacer(flex: 2),
                      Text(
                        'Add Dependent',
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
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  // نص التعليمات
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Enter the dependent email address to add him.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 40.h),
                  
                  // Label للحقل
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 10.h),
                  
                  // حقل الإدخال
                  const CustomTextFormField(
                    hintText: 'Enter an Email Address',
                  ),
                  
                  SizedBox(height: 50.h),
                  
                  // زر الإرسال (تم تحديد العرض ليطابق الصورة)
                  AppButton(
                    title: 'Send',
                    width: 220.w,
                    onTap: () {
                      // سيتم إضافة المنطق لاحقاً
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
}
