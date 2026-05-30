import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/core/widgets/dependent_selector_bottom_sheet.dart';
import 'package:shefaa/features/guardian_home_screen/ui/widgets/guardian_widgets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar2.dart';
import '../cubit/dependent_perscriptions2_cubit.dart';
import '../cubit/dependent_perscriptions2_state.dart';

class DependentPrescriptions2Screen extends StatefulWidget {
  const DependentPrescriptions2Screen({super.key});

  @override
  State<DependentPrescriptions2Screen> createState() => _DependentPrescriptions2ScreenState();
}

class _DependentPrescriptions2ScreenState extends State<DependentPrescriptions2Screen> {
  String selectedDependent = 'Sara Ahmed';
  final List<String> dependents = [
    'Sara Ahmed',
    'Mostafa Mohamed',
    'Rahma Mahmoud',
    'Karim Ahmed'
  ];

  @override
  Widget build(BuildContext context) {
    // بيانات وهمية للروشتات حسب التصميم
    final List<Map<String, dynamic>> prescriptions = [
      {
        'name': 'Panadol',
        'dosage': '2 Pills',
        'timing': 'After Eating',
        'days': 'Sun, Tue, Thu',
        'times': ['9:00\nPM', '10:00\nAM'],
      },
      {
        'name': 'Aspirin',
        'dosage': '1 Pill',
        'timing': 'Before Eating',
        'days': 'Everyday',
        'times': ['9:00\nPM'],
      },
    ];

    return BlocProvider(
      create: (context) => DependentPrescriptions2Cubit()..getPrescriptions(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFB),
        body: Column(
          children: [
            // 1. Header مستطيل أخضر مع علامة الزائد
            Container(
              width: double.infinity,
              height: 110.h,
              padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
              color: AppColors.mainGreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 32), // للتوسيط
                  Text(
                    'Dependent Prescriptions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.add, color: Colors.white, size: 28.r),
                ],
              ),
            ),

            Expanded(
              child: BlocBuilder<DependentPrescriptions2Cubit, DependentPrescriptions2State>(
                builder: (context, state) {
                  if (state is DependentPrescriptions2Loading) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
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
                            'Your Prescriptions',
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: prescriptions.length,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemBuilder: (context, index) {
                            return _buildPrescriptionCard(prescriptions[index]);
                          },
                        ),
                        SizedBox(height: 100.h),
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
              currentIndex: 3, // أيقونة الروشتات (الرابعة)
              onTap: (index) {
                // التنقل بين الصفحات
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPrescriptionCard(Map<String, dynamic> prescription) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prescription['name'],
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        prescription['dosage'],
                        style: TextStyle(fontSize: 10.sp, color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        prescription['timing'],
                        style: TextStyle(fontSize: 10.sp, color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  prescription['days'],
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                ),
                SizedBox(height: 10.h),
                // محاكاة الخط الرمادي في التصميم
                Container(
                  height: 2.h,
                  width: 100.w,
                  color: Colors.grey.shade200,
                ),
              ],
            ),
          ),
          Column(
            children: (prescription['times'] as List<String>).map((time) {
              return Container(
                margin: EdgeInsets.only(bottom: 5.h),
                width: 45.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: AppColors.mainGreen,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    time,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 9.sp, fontWeight: FontWeight.bold, height: 1.1),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
