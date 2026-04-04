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
            // الجزء الأخضر العلوي (القبة) باستخدام ClipPath للحصول على شكل احترافي
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: 280.h,
                width: double.infinity,
                color: AppColors.mainGreen,
              ),
            ),
            // عرض الصورة بناءً على عنوان الصفحة (Patient, Guardian, Doctor)
            if (model.title == 'Doctor' || model.title == 'Patient' || model.title == 'Guardian')
              Positioned(
                top: 90.h,
                left: 35.w,
                child: Image.asset(
                  model.title == 'Doctor'
                      ? 'assets/images/Doctor.png'
                      : model.title == 'Guardian'
                          ? 'assets/images/Users-4.png' // الصورة الجديدة للمرافق
                          : 'assets/images/User-4.png', // صورة المريض
                  height: 110.h,
                  width: 130.w,
                  color: Colors.white, // تلوينها بالأبيض لتتناسق مع التصميم
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
            // العنوان (يتم تعديل مكانه تلقائياً إذا وجدت الصورة)
            Positioned(
              top: (model.title == 'Doctor' || model.title == 'Patient' || model.title == 'Guardian') ? 140.h : 130.h,
              right: 75.w,
              child: Text(
                model.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 60.h),
        Padding(
          // تقليل الـ horizontal padding لضمان ظهور النص في سطر واحد قدر الإمكان
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              // نص الوصف التعريفي
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
              // عرض نقاط الشرح (Bullet Points)
              ...model.bulletPoints.map((point) => _buildBulletPoint(point)),
            ],
          ),
        ),
      ],
    );
  }

  // ويدجيت لبناء النقطة الخضراء وجنبها النص
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
    // يبدأ من أعلى اليسار وينزل لقبل نهاية الارتفاع بـ 40 بكسل
    path.lineTo(0, size.height - 40.h);
    // رسم القوس الاحترافي
    path.quadraticBezierTo(
      size.width / 2,     // نقطة التحكم في المنتصف بالعرض
      size.height + 15.h, // دفع القوس لأسفل ليعطي شكل انسيابي
      size.width,         // نقطة الوصول لليمين
      size.height - 40.h,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
