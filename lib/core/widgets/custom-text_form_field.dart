import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isObscureText = false,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14.sp, color:AppColors.gray),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color:AppColors.gray, width: 1.4),
          borderRadius: BorderRadius.circular(44.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.mainGreen, width: 1.3),
          borderRadius: BorderRadius.circular(44.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.3),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.3),
          borderRadius: BorderRadius.circular(16.r),
        ),
        fillColor: AppColors.lightGray,
        filled: true,
      ),
    );
  }
}
