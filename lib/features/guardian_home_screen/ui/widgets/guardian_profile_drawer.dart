import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../gen/assets.gen.dart';

class GuardianProfileDrawer extends StatelessWidget {
  const GuardianProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.70,
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
          // User Info
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Assets.images.user4.image(width: 60.w, height: 60.h, color: Colors.black54),
              ),
              SizedBox(height: 10.h),
              Text(
                'Ahmed Mostafa',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                'Ahmed.Mostafa@email.com',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          _buildMenuItem(Icons.person_outline, 'Account', () => Navigator.pushNamed(context, Routes.account2Screen)),
          // تم التعديل هنا لفتح Settings2Screen بدلاً من الصفحة القديمة
          _buildMenuItem(Icons.settings_outlined, 'Settings', () => Navigator.pushNamed(context, Routes.settings2Screen)),
          _buildMenuItem(Icons.person_search_outlined, 'Switch to Member', () {
            Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
          }),
          _buildMenuItem(Icons.group_outlined, 'My Dependents', () {
            Navigator.pushNamed(context, Routes.myDependentsScreen);
          }),
          const Spacer(),
          // Logout
          Padding(
            padding: EdgeInsets.only(bottom: 40.h, left: 25.w),
            child: InkWell(
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false),
              child: Row(
                children: [
                  const Icon(Icons.logout_rounded, color: Colors.redAccent),
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

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87, size: 28.r),
      title: Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 25.w),
    );
  }
}
