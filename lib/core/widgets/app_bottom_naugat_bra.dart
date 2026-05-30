import 'package:flutter/material.dart'; // استخدم material بدلاً من cupertino
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart'; // تأكد من استيراد الألوان

class AppBottomNavBar extends StatelessWidget { // يفضل تسمية الكلاس باسم واضح
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // تم حذف Placeholder واستخدام Padding و Row مباشرة
    return Container(
      padding: EdgeInsets.all(15.r),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
                color: AppColors.softGreen,
                borderRadius: BorderRadius.circular(10.r)
            ),
            child: Icon(
              Icons.local_hospital_outlined, // تم إصلاح استدعاء الأيقونة
              color: AppColors.mainGreen,
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min, // مهم جداً داخل الـ Row
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Facility Name", // ضع نص ثابت أو متغير
                  style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "2.5 km",
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.bookmark, color: AppColors.mainGreen),
        ],
      ),
    );
  }
}