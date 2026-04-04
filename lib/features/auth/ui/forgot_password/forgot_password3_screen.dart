import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_header.dart';
import '../../../../core/widgets/custom-text_form_field.dart';

class ForgotPassword3Screen extends StatefulWidget {
  const ForgotPassword3Screen({super.key});

  @override
  State<ForgotPassword3Screen> createState() => _ForgotPassword3ScreenState();
}

class _ForgotPassword3ScreenState extends State<ForgotPassword3Screen> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  bool isLoading = false;

  Future<void> _mockResetPassword() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      // محاكاة الاتصال بالسيرفر
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        isLoading = false;
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset successfully!'),
          backgroundColor: AppColors.mainGreen,
        ),
      );

      // العودة لصفحة تسجيل الدخول
      Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    _buildLabel('New Password'),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Should be at least 8 characters long',
                      isObscureText: isPasswordObscure,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordObscure = !isPasswordObscure;
                          });
                        },
                        child: Icon(
                          isPasswordObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: AppColors.gray,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    _buildLabel('Confirm New Password'),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      hintText: 'Re-enter new password',
                      isObscureText: isConfirmPasswordObscure,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isConfirmPasswordObscure = !isConfirmPasswordObscure;
                          });
                        },
                        child: Icon(
                          isConfirmPasswordObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: AppColors.gray,
                        ),
                      ),
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 60.h),
                    isLoading
                        ? const Center(child: CircularProgressIndicator(color: AppColors.mainGreen))
                        : AppButton(
                            title: 'Continue',
                            onTap: _mockResetPassword,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, left: 4.w),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
