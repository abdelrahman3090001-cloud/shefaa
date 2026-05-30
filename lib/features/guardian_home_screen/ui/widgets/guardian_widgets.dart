import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_header.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../gen/assets.gen.dart';

class GuardianHeader extends StatelessWidget {
  final VoidCallback onProfileTap;
  final VoidCallback onNotificationsTap;

  const GuardianHeader({
    super.key,
    required this.onProfileTap,
    required this.onNotificationsTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      child: Stack(
        children: [
          Positioned(
            top: 40.h,
            left: 20.w,
            child: InkWell(
              onTap: onProfileTap,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.user4.image(height: 40.r, width: 40.r, fit: BoxFit.contain),
                  SizedBox(height: 4.h),
                  Text('Ahmed', style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Positioned(
            top: 45.h,
            right: 20.w,
            child: InkWell(
              onTap: onNotificationsTap,
              child: Stack(
                children: [
                  Assets.images.bell.image(height: 30.r, width: 30.r, fit: BoxFit.contain, color: Colors.white),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Assets.images.splash.image(height: 60.h, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}

class UserSwitcher extends StatelessWidget {
  final String userName;
  const UserSwitcher({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.swap_horiz, color: Colors.grey, size: 20.r),
            SizedBox(width: 8.w),
            Text(userName, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class RealTimeLocation extends StatelessWidget {
  final String lastSeen;
  const RealTimeLocation({super.key, required this.lastSeen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Real-Time Location', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFC8E6C9),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 3, backgroundColor: Colors.green),
                        SizedBox(width: 4.w),
                        Text(lastSeen, style: TextStyle(fontSize: 10.sp, color: Colors.green)),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 20.r,
                    width: 20.r,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        height: 8.r,
                        width: 8.r,
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
