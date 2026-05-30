import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import 'package:shefaa/core/widgets/app_button.dart';
import 'package:shefaa/core/widgets/app_header.dart';
import 'package:shefaa/core/widgets/custom-text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  int selectedType = 0; // 0: Member, 1: Caregiver
  bool isObscureText = true;
  bool isLoading = false;

  Future<void> _mockLogin() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        isLoading = false;
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Success! Welcome Back'),
          backgroundColor: AppColors.mainGreen,
        ),
      );

      Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AppHeader(
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              _buildUserTypeToggle(),
              SizedBox(height: 10.h),
              Text(
                selectedType == 0 ? 'Member' : 'Caregiver',
                style: TextStyle(
                  color: AppColors.mainGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email Address', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Enter your Email Address',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text('Password', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Enter your Password',
                      isObscureText: isObscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() => isObscureText = !isObscureText);
                        },
                        child: Icon(
                          isObscureText ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.mainGreen,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.forgetPassword);
                        },
                        child: Text('Forgot password?', style: TextStyle(color: AppColors.gray, fontSize: 14.sp)),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    isLoading
                        ? const Center(child: CircularProgressIndicator(color: AppColors.NpGreen))
                        : AppButton(
                            title: 'Log In',
                            onTap: _mockLogin,
                          ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text('Or continue with', style: TextStyle(color: AppColors.gray, fontSize: 14.sp)),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(Icons.apple, color: AppColors.mainGreen),
                        SizedBox(width: 20.w),
                        _buildSocialIcon(Icons.g_mobiledata, color: AppColors.mainGreen),
                        SizedBox(width: 20.w),
                        _buildSocialIcon(Icons.window, color: AppColors.mainGreen),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ", style: TextStyle(fontSize: 14.sp)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.signUpScreen);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: AppColors.mainGreen, fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserTypeToggle() {
    // كـ Software Engineer: قمنا بتقليل الـ padding الرأسي (vertical) ليرجع الحجم نحيفاً كما كان في البداية
    // مع الحفاظ على عرض مناسب (width) يعطي شكلاً مستطيلاً منسقاً.
    return Container(
      width: 160.w,height:65,
      // عرض معتدل ليكون مستطيل واضح
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1B5E20),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(2, (index) {
          bool isSelected = selectedType == index;
          return GestureDetector(
            onTap: () => setState(() => selectedType = index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h), // تقليل الـ vertical padding لتصغير الارتفاع
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Image.asset(
                index == 0 ? 'assets/images/User-4.png' : 'assets/images/Users-4.png',
                height: 25.h, // تقليل حجم الأيقونة قليلاً لتناسب المستطيل النحيف
                width:25.w,
                color: isSelected ? const Color(0xFF1B5E20) : Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, {Color? color}) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.mainGreen),
      ),
      child: Icon(icon, color: color, size: 35.sp),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
