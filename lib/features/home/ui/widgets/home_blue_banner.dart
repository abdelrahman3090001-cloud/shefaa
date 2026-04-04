import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class HomeBlueBanner extends StatelessWidget {
  const HomeBlueBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 145.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              image: const DecorationImage(
                image: AssetImage('assets/images/splash.png'), // أو خلفية زرقاء لو حابب
                fit: BoxFit.cover,
              ),
              color: AppColors.mainGreen, // خليناه أخضر عشان نتماشى مع هوية "شفاء"
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.r),
                      ),
                    ),
                    child: Text(
                      'Find Nearby',
                      style: TextStyle(color: AppColors.mainGreen, fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8.w,
            top: 0,
            child: Image.asset(
              'assets/images/Doctor.png',
              height: 160.h,
            ),
          ),
        ],
      ),
    );
  }
}
