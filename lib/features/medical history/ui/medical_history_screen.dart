import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import 'package:shefaa/core/widgets/app_bottom_nav_bar.dart';
import '../cubit/medical_history_cubit.dart';
import '../cubit/medical_history_state.dart';
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
            // 1. Header
            Container(
              height: 110.h,
              width: double.infinity,
              color: AppColors.deepGreen,
              padding: EdgeInsets.only(top: 45.h, left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 25),
                  Text(
                    'Medical History',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.add, color: Colors.white, size: 28.r),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Column(
                  children: [
                    // Info Banner
                    _buildInfoBanner(context),
                    SizedBox(height: 20.h),
                    
                    // Search & Filter
                    const MedicalSearchBar(),
                    SizedBox(height: 20.h),
                    
                    // History List
                    BlocBuilder<MedicalHistoryCubit, MedicalHistoryState>(
                      builder: (context, state) {
                        if (state is MedicalHistoryLoading) {
                          return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
                        } else if (state is MedicalHistorySuccess) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildGroupHeader('September, 2025'),
                              _buildRecordsList(state.records.where((r) => r.date.contains('Sep')).toList()),
                              SizedBox(height: 20.h),
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
              currentIndex: 4, // Assuming last icon
              onTap: (index) {
                if (index == 0) Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBanner(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.medicalInformationScreen),
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.blue, size: 22.r),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                'Your Medical Information',
                style: TextStyle(fontSize: 14.sp, color: Colors.blue.shade800, fontWeight: FontWeight.bold),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 16.r),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupHeader(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(text, style: TextStyle(fontSize: 14.sp, color: Colors.grey, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildRecordsList(List<dynamic> records) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final record = records[index];
        return Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
          ),
          child: Row(
            children: [
              Container(
                width: 50.r,
                height: 50.r,
                decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12.r)),
                child: Icon(record.type == 'PDF' ? Icons.description_outlined : Icons.image_outlined, color: AppColors.mainGreen),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(record.title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    Text('${record.date} - ${record.type}', style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
