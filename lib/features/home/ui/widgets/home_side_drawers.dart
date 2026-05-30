import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../gen/assets.gen.dart';

// --- ويدجيت موحد لصفوف القائمة (Custom ListTile) ---
Widget _buildDrawerMenuItem({required Widget icon, required String title, VoidCallback? onTap}) {
  return ListTile(
    leading: icon,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    ),
    onTap: onTap,
    contentPadding: EdgeInsets.symmetric(horizontal: 25.w),
    visualDensity: const VisualDensity(vertical: -2), // لتقليل المسافة الرأسية بين العناصر لتطابق التصميم
  );
}

// 1. Profile Drawer (Left Side) - المحدث بالظبط حسب الصورة
class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.70, // العرض في الصورة يبدو حوالي 70%
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 60.h),

          // --- الجزء العلوي (User Info) ---
          Column(
            children: [
              // أيقونة المستخدم من ملف الجين
              Assets.images.user4.image(width: 80.w, height: 90.h, color: Colors.black),
              SizedBox(height: 10.h),
              Text(
                'Ahmed Mostafa',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                'Ahmed.Mostafa@email.com',
                style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade600),
              ),
            ],
          ),

          SizedBox(height: 20.h),
          // الخط الفاصل الموجود في الصورة
          Divider(thickness: 1, color: Colors.grey.shade200, indent: 20.w, endIndent: 20.w),
          SizedBox(height: 10.h),

          // --- قائمة الاختيارات ---
          _buildDrawerMenuItem(
            icon: Icon(Icons.person_outline, size: 35.r, color: Colors.black87),
            title: 'Account',
            onTap: () {
              Navigator.pop(context); // إغلاق الـ Drawer
              Navigator.pushNamed(context, Routes.accountScreen);
            },
          ),
          SizedBox(height: 10.h),

          _buildDrawerMenuItem(
            icon: Icon(Icons.settings_outlined, size: 35.r, color: Colors.black87),
            title: 'Settings',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Routes.settingsScreen);
            },
          ),
          SizedBox(height: 10.h),

          _buildDrawerMenuItem(
            icon: Icon(Icons.group_outlined, size: 35.r, color: Colors.black87),
            title: 'Switch to Caregiver', // الاسم الصحيح حسب فيجما
            onTap: () {
              Navigator.pop(context); // إغلاق الدرور
              Navigator.pushNamed(context, Routes.guardianHomeScreen); // الانتقال لصفحة المراقب الجديدة
            },
          ),
          SizedBox(height: 10.h),

          _buildDrawerMenuItem(
            icon: Icon(Icons.assignment_outlined, size: 35.r, color: Colors.black87),
            title: 'Insurance Info',
            onTap: () {
              // يمكن إضافة صفحة معلومات التأمين لاحقاً
              Navigator.pop(context);
            },
          ),

          const Spacer(),

          // --- زر تسجيل الخروج (Log out) ---
          Padding(
            padding: EdgeInsets.only(bottom: 40.h, left: 25.w),
            child: InkWell(
              onTap: () {
                // العودة لصفحة تسجيل الدخول وإزالة كل الشاشات السابقة
                Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
              },
              child: Row(
                children: [
                  // أيقونة Logout الحمراء من فيجما
                  Icon(Icons.logout_rounded, color: Colors.redAccent, size: 22.r),
                  SizedBox(width: 10.w),
                  Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. Notifications Drawer (Right Side)
class NotificationsDrawer extends StatelessWidget {
  const NotificationsDrawer({super.key});

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
                _buildNotificationCard(title: 'Don\'t Forget your dosage', time: '1 min ago'),
                _buildNotificationCard(title: 'You have an upcoming appointment', time: '9 min ago'),
                _buildNotificationCard(
                  title: 'Ahmed Mostafa sent a caregiver request.',
                  time: '3 min ago',
                  extraContent: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'They\'d like to support you by staying updated on your care plan and reminders.',
                        style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade700),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainGreen,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                              ),
                              child: const Text('Accept'),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade400,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                              ),
                              child: const Text('Decline'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({required String title, required String time, Widget? extraContent}) {
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
          Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
          if (extraContent != null) ...[
            SizedBox(height: 8.h),
            extraContent,
          ],
          SizedBox(height: 8.h),
          Text(time, style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}
