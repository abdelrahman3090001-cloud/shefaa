import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/core/widgets/dependent_selector_bottom_sheet.dart';
import 'package:shefaa/features/guardian_home_screen/ui/widgets/guardian_widgets.dart';
import 'package:shefaa/features/medical%20history/ui/widgets/medical_history_widgets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar2.dart';
import '../../medical%20history/data/models/medical_record_model.dart';
import '../cubit/dependent_medical_history_cubit.dart';
import '../cubit/dependent_medical_history_state.dart';

class DependentMedicalHistory2Screen extends StatefulWidget {
  const DependentMedicalHistory2Screen({super.key});

  @override
  State<DependentMedicalHistory2Screen> createState() => _DependentMedicalHistory2ScreenState();
}

class _DependentMedicalHistory2ScreenState extends State<DependentMedicalHistory2Screen> {
  String selectedDependent = 'Sara Ahmed';
  final List<String> dependents = [
    'Sara Ahmed',
    'Mostafa Mohamed',
    'Rahma Mahmoud',
    'Karim Ahmed'
  ];

  @override
  Widget build(BuildContext context) {
    // بيانات وهمية مطابقة للصورة
    final List<MedicalRecordModel> records = [
      MedicalRecordModel(title: 'MRI Report', date: 'Feb 23, 2025', type: 'PDF', fileName: 'mri.pdf'),
      MedicalRecordModel(title: 'Lab Result', date: 'Feb 22, 2025', type: 'PDF', fileName: 'lab.pdf'),
      MedicalRecordModel(title: 'MRI Report', date: 'Feb 21, 2025', type: 'PDF', fileName: 'mri2.pdf'),
    ];

    return BlocProvider(
      create: (context) => DependentMedicalHistoryCubit()..getMedicalHistory(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFB),
        body: Column(
          children: [
            // 1. Header مستطيل أخضر
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
                  'Dependent Medical History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Expanded(
              child: BlocBuilder<DependentMedicalHistoryCubit, DependentMedicalHistoryState>(
                builder: (context, state) {
                  if (state is DependentMedicalHistoryLoading) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        // تبديل التابعين
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
                        SizedBox(height: 20.h),
                        // شريط البحث
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: MedicalSearchBar(),
                        ),
                        SizedBox(height: 25.h),
                        
                        // قائمة السجلات مقسمة حسب التاريخ
                        _buildSectionHeader('September, 2025'),
                        _buildRecordsList(records.sublist(0, 2)),
                        
                        SizedBox(height: 20.h),
                        _buildSectionHeader('February, 2025'),
                        _buildRecordsList(records.sublist(2)),
                        
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
              currentIndex: 4, // أيقونة السجلات الطبية نشطة
              onTap: (index) {
                // التنقل بين صفحات المراقب
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
      ),
    );
  }

  Widget _buildRecordsList(List<MedicalRecordModel> records) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: MedicalRecordCard(record: records[index]),
        );
      },
    );
  }
}
