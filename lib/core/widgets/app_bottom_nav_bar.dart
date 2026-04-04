import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';

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
      decoration: BoxDecoration(
        color: AppColors.mainGreen,
        borderRadius: BorderRadius.vertical(top: Radius.circular(1.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
        onTap: onTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.group_outlined, size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined, size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.medication_outlined, size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 28), label: ''),
        ],
      ),
    );
  }
}
