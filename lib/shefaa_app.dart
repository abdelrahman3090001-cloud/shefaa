import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/app_router.dart';
import 'package:shefaa/core/routes/routes.dart';

class ShefaaApp extends StatelessWidget {
  final AppRouter appRouter;
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
          onGenerateRoute: appRouter.generateRoute,
          // الشاشة الابتدائية أصبحت الآن هي الـ SplashScreen
          initialRoute: Routes.splashScreen,
        );
      },
    );
  }
}
