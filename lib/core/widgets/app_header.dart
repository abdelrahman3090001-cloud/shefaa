import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';

class AppHeader extends StatelessWidget {
  // كـ Software Engineer، هذا المتغير هو الذي كان ناقصاً لجعل الهيدر يقبل محتوى داخله
  final Widget? child;

  const AppHeader({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(),
      child: Container(
        height: 200.h,
        width: double.infinity,
        alignment: Alignment.center,
        color: AppColors.mainGreen,
        child: child,
      ),
    );
  }
}
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // يبدأ من أعلى اليسار وينزل لقبل نهاية الارتفاع بـ 40 بكسل
    path.lineTo(0, size.height - 40.h);
    // رسم القوس الاحترافي
    path.quadraticBezierTo(
      size.width / 2,     // نقطة التحكم في المنتصف بالعرض
      size.height + 15.h, // دفع القوس لأسفل ليعطي شكل انسيابي
      size.width,         // نقطة الوصول لليمين
      size.height - 40.h,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
