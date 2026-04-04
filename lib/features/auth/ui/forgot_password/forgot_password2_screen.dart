import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_header.dart';

class ForgotPassword2Screen extends StatefulWidget {
  const ForgotPassword2Screen({super.key});

  @override
  State<ForgotPassword2Screen> createState() => _ForgotPassword2ScreenState();
}

class _ForgotPassword2ScreenState extends State<ForgotPassword2Screen> {
  bool isLoading = false;

  Future<void> _mockVerifyCode() async {
    setState(() {
      isLoading = true;
    });

    // محاكاة التأكد من الكود
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    if (!mounted) return;

    // نجاح التحقق والانتقال لصفحة تعيين الباسورد الجديد
    Navigator.pushNamed(context, Routes.resetPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    const Spacer(flex: 2),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    'An SMS code was sent to your phone number\nPlease enter it below',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOtpBox(context, first: true, last: false),
                      _buildOtpBox(context, first: false, last: false),
                      _buildOtpBox(context, first: false, last: false),
                      _buildOtpBox(context, first: false, last: true),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Code Resent!'), backgroundColor: AppColors.mainGreen),
                      );
                    },
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        color: AppColors.mainGreen,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  isLoading
                      ? const Center(child: CircularProgressIndicator(color: AppColors.mainGreen))
                      : AppButton(
                          title: 'Continue',
                          onTap: _mockVerifyCode,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(BuildContext context, {required bool first, last}) {
    return Container(
      height: 70.h,
      width: 65.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "_",
          hintStyle: TextStyle(color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
