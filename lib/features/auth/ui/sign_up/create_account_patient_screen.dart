import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_header.dart';
import '../../../../core/widgets/custom-text_form_field.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/routes/routes.dart';

class CreateAccountPatientScreen extends StatefulWidget {
  const CreateAccountPatientScreen({super.key});

  @override
  State<CreateAccountPatientScreen> createState() => _CreateAccountPatientScreenState();
}

class _CreateAccountPatientScreenState extends State<CreateAccountPatientScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  bool isLoading = false;

  Future<void> _mockSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      
      // محاكاة الاتصال بالسيرفر لإنشاء الحساب
      await Future.delayed(const Duration(seconds: 2));
      
      setState(() => isLoading = false);
      
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!'), backgroundColor: AppColors.mainGreen),
      );
      
      // الانتقال للـ Home بعد النجاح ومسح كل الصفحات السابقة
      Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              child: Text(
                'Create account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.mainGreen),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Icon(
                        Icons.person_outline,
                        size: 40.r,
                        color: AppColors.mainGreen,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Patient',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainGreen,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    _buildLabel('Email Address'),
                    CustomTextFormField(
                      hintText: 'example@email.com',
                      validator: (v) => v!.contains('@') ? null : 'Invalid email',
                    ),
                    SizedBox(height: 20.h),
                    _buildLabel('Password'),
                    CustomTextFormField(
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
                      validator: (v) => v!.length < 8 ? 'Too short' : null,
                    ),
                    SizedBox(height: 20.h),
                    _buildLabel('Confirm Password'),
                    CustomTextFormField(
                      hintText: 'Should be at least 8 characters long',
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
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 50.h),
                    isLoading
                      ? const CircularProgressIndicator(color: AppColors.mainGreen)
                      : AppButton(
                          title: 'Sign Up',
                          onTap: _mockSignUp,
                        ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.loginScreen);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.mainGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h, left: 4.w),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
