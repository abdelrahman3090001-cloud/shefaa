import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';

class AppHeader extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;

  const AppHeader({
    super.key,
    this.child,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(),
      child: Container(
        height: height ?? 200.h,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.NpGreen,
              AppColors.mainGreen,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40.h);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 15.h,
      size.width,
      size.height - 40.h,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
