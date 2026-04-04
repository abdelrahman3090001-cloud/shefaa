import 'package:flutter/material.dart';
import 'package:shefaa/core/routes/app_router.dart';
import 'package:shefaa/shefaa_app.dart';

void main() {
  // كـ Software Engineer، نقوم بإنشاء الـ Router هنا ليمر على كامل التطبيق
  final AppRouter appRouter = AppRouter();
  
  runApp(ShefaaApp(appRouter: appRouter));
}
