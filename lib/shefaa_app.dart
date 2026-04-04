import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/app_router.dart';
import 'package:shefaa/core/routes/routes.dart';

class ShefaaApp extends StatelessWidget {
  final AppRouter appRouter; // إضافة متغير الـ Router للتحكم في التنقل
  const ShefaaApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shefaa App',
          // نستخدم الـ generateRoute لتحديد مسار التنقل بين الشاشات
          onGenerateRoute: appRouter.generateRoute,
          // تحديد شاشة البداية للتطبيق
          initialRoute: Routes.onboardingScreen,
        );
      },
    );
  }
}
