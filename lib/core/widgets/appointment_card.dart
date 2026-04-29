import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String location;
  final String time;
  final String day;
  final String month;
  final String date;
  final VoidCallback? onTap;

  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.location,
    required this.time,
    required this.day,
    required this.month,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFF133B2C),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Text(month, style: TextStyle(color: Colors.white, fontSize: 13.sp)),
                  Text(date,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctorName,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainGreen)),
                  Text('($specialization)',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 12.r, color: Colors.grey),
                      SizedBox(width: 4.w),
                      Text(location,
                          style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(time,
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                Text(day, style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
