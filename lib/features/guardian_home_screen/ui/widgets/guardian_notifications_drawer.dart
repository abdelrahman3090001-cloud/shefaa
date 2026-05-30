import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../gen/assets.gen.dart';

class GuardianNotificationsDrawer extends StatelessWidget {
  const GuardianNotificationsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          bottomLeft: Radius.circular(40.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              children: [
                Assets.images.bell.image(width: 28.w, color: Colors.black),
                SizedBox(width: 10.w),
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                _buildNotificationCard(
                  title: '"Sara Ahmed" should take her dosage',
                  time: '1 min ago',
                ),
                _buildNotificationCard(
                  title: 'Sara Ahmed accepted your request.',
                  time: '9 min ago',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({required String title, required String time}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F8F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(height: 8.h),
          Text(
            time,
            style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
