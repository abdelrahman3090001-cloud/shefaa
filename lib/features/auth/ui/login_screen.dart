import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import 'package:shefaa/core/widgets/app_button.dart';
import 'package:shefaa/core/widgets/app_header.dart';
import 'package:shefaa/core/widgets/custom-text_form_field.dart';
import 'sign_up/create_account_screen.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscureText = true;
  bool isLoading = false;

  Future<void> _mockLogin() async {
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

      if (emailController.text == 'admin@shefaa.com' && passwordController.text == '123456') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Success! Welcome Back'), backgroundColor: AppColors.mainGreen),
        );
        // التوجيه للصفحة الرئيسية (Home)
        Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid Email or Password!'), backgroundColor: Colors.red),
        );
      }
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
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
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
                        if (value == null || value.isEmpty || value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.forgetPassword);
                        },
                        child: Text('Forgot password?', style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    isLoading 
                      ? const Center(child: CircularProgressIndicator(color: AppColors.mainGreen))
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
                          child: Text('Or continue with', style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
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
                  ],
                ),
              ),
            ],
          ),
        ),
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
