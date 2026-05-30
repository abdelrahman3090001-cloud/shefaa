import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import 'package:shefaa/features/welcome/data/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // الجزء الأخضر العلوي (القبة)
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: 280.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        AppColors.deepGreen,
                        AppColors.mainGreen,
                      ],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,    // البداية من أعلى المنتصف
                  )
                )
              ),
            ),
            // عرض الصورة بناءً على المسميات الجديدة (Member, Caregiver)
            if (model.title == 'Member' || model.title == 'Caregiver' || model.title == 'Doctor' || model.title == 'Patient' || model.title == 'Guardian')
              Positioned(
                top: 80.h,
                left: 30.w,
                child: Image.asset(
                  (model.title == 'Caregiver' || model.title == 'Guardian')
                      ? 'assets/images/Users-4.png' // صورة المرافق
                      : (model.title == 'Member' || model.title == 'Patient')
                          ? 'assets/images/User-4.png' // صورة المريض
                          : 'assets/images/Doctor.png', // صورة الطبيب
                  height: 100.h,
                  width: 100.w,
                  color: Colors.white,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
            // العنوان
            Positioned(
              top: 120.h,
              right: 75.w,
              child: Text(
                model.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 60.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Text(
                model.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40.h),
              ...model.bulletPoints.map((point) => _buildBulletPoint(point)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.w),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Container(
            width: 8.w,
            height: 8.h,
            decoration: const BoxDecoration(
              color: AppColors.mainGreen,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40.h);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 15.h,
      size.width,
      size.height - 40.h,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
