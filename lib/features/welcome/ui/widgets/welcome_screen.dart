import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../auth/ui/login_screen.dart';
import '../../../auth/ui/sign_up/create_account_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 1. الجزء العلوي الأخضر مع القوس
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: WelcomeHeaderClipper(),
                child: Container(
                  height: 500.h,
                  width: double.infinity,
                  color: AppColors.mainGreen,
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/splash.png',
                    height: 118.h,
                    width: 191.w,
                    color: Colors.white,
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: 250.w,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40.h),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                AppButton(
                  title: "Log in",
                  backgroundColor: selectedIndex == 0 ? AppColors.mainGreen : Colors.white,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                AppButton(
                  title: "Create Account",
                  backgroundColor: selectedIndex == 1 ? AppColors.mainGreen : Colors.white,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// الـ Clipper لازم يكون بره الـ Widget class
class WelcomeHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60.h);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20.h,
      size.width,
      size.height - 60.h,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
