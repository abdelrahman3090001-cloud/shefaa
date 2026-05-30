import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';
import '../routes/routes.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,width: 345,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44.r),
          gradient: LinearGradient(
            colors: [
              AppColors.mainGreen, AppColors.deepGreen,
            ],
            begin: Alignment.topCenter,    // البداية من فوق (هياخد أول لون)
            end: Alignment.bottomCenter,   // النهاية تحت (هياخد تاني لون)
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
          if (index == 0 && currentIndex != 0) {
            Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
          } else if (index == 1 && currentIndex != 1) {
            Navigator.pushNamed(context, Routes.findDoctorScreen);
          } else if (index == 2 && currentIndex != 2) {
            Navigator.pushNamed(context, Routes.gpsScreen);
          } else if (index == 3 && currentIndex != 3) {
            Navigator.pushNamed(context, Routes.prescriptionScreen);
          } else if (index == 4 && currentIndex != 4) {
            Navigator.pushNamed(context, Routes.medicalHistoryScreen);
          } else {
            onTap(index);
          }
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: ''),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/Doctor.png'), size: 28),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined, size: 28), label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/pill.png'), size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.description_outlined, size: 28), label: ''),
        ],
      ),
    );
  }
}
