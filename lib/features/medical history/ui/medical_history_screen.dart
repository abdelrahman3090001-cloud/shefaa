import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import 'package:shefaa/core/widgets/app_bottom_nav_bar.dart';
import '../cubit/medical_history_cubit.dart';
import '../cubit/medical_history_state.dart';
import '../data/models/medical_record_model.dart';
import 'widgets/medical_history_widgets.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicalHistoryCubit()..getMedicalHistory(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFB),
        body: Column(
          children: [
            // 1. Header مطابق للتصميم
            Container(
              height: 110.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainGreen,
                    AppColors.deepGreen,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 45.h, left: 20.w, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 28),
                    Text(
                      'Medical History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.add, color: Colors.white, size: 28.r),
                  ],
                ),
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // بنر المعلومات الطبية
                    _buildInfoBanner(context),
                    SizedBox(height: 10.h),
                    const Divider(color: Color(0xFFE0E0E0)),
                    SizedBox(height: 10.h),
                    
                    // شريط البحث والفلترة
                    const MedicalSearchBar(),
                    SizedBox(height: 15.h),
                    
                    // قائمة السجلات الطبية
                    BlocBuilder<MedicalHistoryCubit, MedicalHistoryState>(
                      builder: (context, state) {
                        if (state is MedicalHistoryLoading) {
                          return const Center(
                            child: CircularProgressIndicator(color: AppColors.mainGreen),
                          );
                        } else if (state is MedicalHistorySuccess) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildGroupHeader('September, 2025'),
                              _buildRecordsList(state.records.where((r) => r.date.contains('Sep')).toList()),
                              SizedBox(height: 10.h),
                              _buildGroupHeader('February, 2025'),
                              _buildRecordsList(state.records.where((r) => r.date.contains('Feb')).toList()),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBottomNavBar(
              currentIndex: 4,
              onTap: (index) {
                if (index == 0) {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
                }
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBanner(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.medicalInformationScreen),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(Icons.description_outlined, color: const Color(0xFF1976D2), size: 22.r),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                'Go to Medical Information',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF1976D2),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupHeader(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildRecordsList(List<MedicalRecordModel> records) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      separatorBuilder: (context, index) => SizedBox(height: 5.h),
      itemBuilder: (context, index) {
        return MedicalRecordCard(record: records[index]);
      },
    );
  }
}
