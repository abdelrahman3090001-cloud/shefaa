import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';
import '../routes/routes.dart';

class AppBottomNavBar2 extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavBar2({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: double.infinity, // تم التغيير ليكون مرناً مع أي شاشة
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44.r),
        gradient: const LinearGradient(
          colors: [
            AppColors.mainGreen,
            AppColors.deepGreen,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          )
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return;

          switch (index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(context, Routes.guardianHomeScreen, (route) => false);
              break;
            case 1:
              Navigator.pushNamed(context, Routes.dependentAppointments2Screen);
              break;
            case 2:
              Navigator.pushNamed(context, Routes.realTimeLocation2Screen);
              break;
            case 3:
              Navigator.pushNamed(context, Routes.dependentPrescriptions2Screen);
              break;
            case 4:
              Navigator.pushNamed(context, Routes.dependentMedicalHistory2Screen);
              break;
            default:
              onTap(index);
          }
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined, size: 28),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined, size: 28), label: ''),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/pill.png'), size: 28),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.description_outlined, size: 28), label: ''),
        ],
      ),
    );
  }
}
