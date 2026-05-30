import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/core/widgets/dependent_selector_bottom_sheet.dart';
import 'package:shefaa/features/guardian_home_screen/ui/widgets/guardian_widgets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar2.dart';
import '../cubit/real_time_location2_cubit.dart';
import '../cubit/real_time_location2_state.dart';

class RealTimeLocation2Screen extends StatefulWidget {
  const RealTimeLocation2Screen({super.key});

  @override
  State<RealTimeLocation2Screen> createState() => _RealTimeLocation2ScreenState();
}

class _RealTimeLocation2ScreenState extends State<RealTimeLocation2Screen> {
  String selectedDependent = 'Sara Ahmed';
  final List<String> dependents = [
    'Sara Ahmed',
    'Mostafa Mohamed',
    'Rahma Mahmoud',
    'Karim Ahmed'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RealTimeLocation2Cubit()..getLocationData(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFB),
        body: Column(
          children: [
            // 1. Header مستطيل أخضر ثابت
            Container(
              width: double.infinity,
              height: 110.h,
              padding: EdgeInsets.only(top: 40.h),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [
                AppColors.NpGreen,
                AppColors.mainGreen,
              ],
            ),
          ),
              child: Center(
                child: Text(
                  'Real-Time Location',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: BlocBuilder<RealTimeLocation2Cubit, RealTimeLocation2State>(
                builder: (context, state) {
                  if (state is RealTimeLocation2Loading) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
                  }
                  
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        // زر التبديل بين التابعين
                        UserSwitcher(
                          userName: selectedDependent,
                          onTap: () {
                            DependentSelectorBottomSheet.show(
                              context,
                              dependents: dependents,
                              selectedDependent: selectedDependent,
                              onDependentSelected: (name) {
                                setState(() {
                                  selectedDependent = name;
                                });
                              },
                            );
                          },
                        ),
                        SizedBox(height: 25.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Real-Time Location',
                            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        // عرض الخريطة الكبيرة
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Container(
                            height: 450.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFC8E6C9),
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 15.h,
                                  left: 15.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: const Row(
                                      children: [
                                        CircleAvatar(radius: 3, backgroundColor: Colors.green),
                                        SizedBox(width: 6),
                                        Text('Live 2m ago', style: TextStyle(fontSize: 10, color: Colors.green)),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 24.r,
                                    width: 24.r,
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Container(
                                        height: 10.r,
                                        width: 10.r,
                                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBottomNavBar2(
              currentIndex: 2, // أيقونة الموقع (الثالثة)
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, Routes.guardianHomeScreen);
                    break;
                  case 1:
                    Navigator.pushNamed(context, Routes.dependentAppointments2Screen);
                    break;
                  case 4:
                    Navigator.pushNamed(context, Routes.accountScreen);
                    break;
                }
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
