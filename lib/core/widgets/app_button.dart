import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final void Function()? onTap;
  final double? width; // أضفت العرض كمتغير اختياري
  final double? height; // أضفت الطول كمتغير اختياري

  const AppButton({
    super.key,
    required this.title,
    this.backgroundColor,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity, // إذا لم يحدد العرض، يأخذ المساحة المتاحة
        height: height ?? 56.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44.r),
          color: backgroundColor ?? AppColors.mainGreen,
          border: Border.all(
            color: backgroundColor == Colors.white
                ? AppColors.mainGreen
                : AppColors.mainGreen,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: backgroundColor == Colors.white ? AppColors.mainGreen : Colors.white,
          ),
        ),
      ),
    );
  }
}
