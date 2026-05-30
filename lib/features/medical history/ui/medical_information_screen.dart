import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import 'package:shefaa/core/widgets/app_bottom_nav_bar.dart';
import '../cubit/medical_history_cubit.dart';
import '../cubit/medical_history_state.dart';
import 'widgets/add_medical_info_widgets.dart';

class MedicalInformationScreen extends StatelessWidget {
  const MedicalInformationScreen({super.key});

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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainGreen,
                    AppColors.deepGreen,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.only(top: 45.h, left: 15.w, right: 15.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 20.r),
                  ),
                  const Spacer(),
                  Text(
                    'Medical History',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => showAddMedicalInfoBottomSheet(context),
                    child: Icon(Icons.add, color: Colors.white, size: 24.r),
                  ),
                ],
              ),
            ),

            Expanded(
              child: BlocBuilder<MedicalHistoryCubit, MedicalHistoryState>(
                builder: (context, state) {
                  if (state is MedicalHistoryLoading) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
                  } else if (state is MedicalHistorySuccess && state.info != null) {
                    final info = state.info!;
                    return SingleChildScrollView(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Medical Information',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          SizedBox(height: 15.h),
                          
                          Row(
                            children: [
                              Expanded(child: _buildInfoCard('Name', info.fullName)),
                              SizedBox(width: 15.w),
                              Expanded(child: _buildInfoCard('Date of Birth', info.dob)),
                            ],
                          ),
                          SizedBox(height: 15.h),

                          Row(
                            children: [
                              Expanded(child: _buildInfoCard('Phone Number', info.phone)),
                              SizedBox(width: 15.w),
                              Expanded(child: _buildInfoCard('Blood Type', info.bloodType)),
                            ],
                          ),
                          SizedBox(height: 15.h),

                          _buildInfoCard('Weight & Height', '${info.weight} - ${info.height}'),
                          SizedBox(height: 15.h),

                          _buildInfoCard('Chronic Conditions', info.chronicConditions.join(' - ')),
                          SizedBox(height: 15.h),

                          _buildInfoCard(
                            'Insurance ID',
                            'Insurance Provider: ${info.insuranceProvider}\n\n${info.insuranceId}',
                          ),
                          SizedBox(height: 15.h),

                          _buildInfoCard(
                            'Allergies',
                            info.allergies.join('\n'),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    );
                  } else if (state is MedicalHistoryError) {
                    return Center(child: Text(state.error));
                  }
                  return const SizedBox.shrink();
                },
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
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.homeScreen, (route) => false);
                }
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 6.h),
          Text(
            value,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
