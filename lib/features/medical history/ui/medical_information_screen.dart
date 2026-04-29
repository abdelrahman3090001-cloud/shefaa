import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import '../cubit/medical_history_cubit.dart';
import '../cubit/medical_history_state.dart';
import 'widgets/add_medical_info_widgets.dart';

class MedicalInformationScreen extends StatelessWidget {
  const MedicalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<MedicalHistoryCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // 1. Header
            Container(
              height: 110.h,
              width: double.infinity,
              color: AppColors.deepGreen,
              padding: EdgeInsets.only(top: 45.h, left: 15.w, right: 15.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.r),
                  ),
                  const Spacer(flex: 2),
                  Text(
                    'Medical Information',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 2),
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
                  if (state is MedicalHistorySuccess && state.info != null) {
                    final info = state.info!;
                    return SingleChildScrollView(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle('Basic Information'),
                          _buildInfoRow('Full Name', info.fullName),
                          _buildInfoRow('Date of Birth', info.dob),
                          _buildInfoRow('Phone Number', info.phone),
                          _buildInfoRow('Blood Type', info.bloodType),
                          
                          SizedBox(height: 25.h),
                          _buildSectionTitle('Weight & Height'),
                          Row(
                            children: [
                              Expanded(child: _buildInfoRow('Weight', info.weight)),
                              SizedBox(width: 20.w),
                              Expanded(child: _buildInfoRow('Height', info.height)),
                            ],
                          ),
                          
                          SizedBox(height: 25.h),
                          _buildSectionTitle('Chronic Conditions'),
                          _buildBulletList(info.chronicConditions),
                          
                          SizedBox(height: 25.h),
                          _buildSectionTitle('Insurance'),
                          _buildInfoRow('Insurance Provider', info.insuranceProvider),
                          _buildInfoRow('Insurance ID', info.insuranceId),
                          
                          SizedBox(height: 25.h),
                          _buildSectionTitle('Allergies'),
                          _buildBulletList(info.allergies),
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.mainGreen),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
          SizedBox(height: 4.h),
          Text(value, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black87)),
          Divider(color: Colors.grey.shade200),
        ],
      ),
    );
  }

  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Row(
          children: [
            Container(width: 6.r, height: 6.r, decoration: const BoxDecoration(color: AppColors.mainGreen, shape: BoxShape.circle)),
            SizedBox(width: 10.w),
            Text(item, style: TextStyle(fontSize: 14.sp, color: Colors.black87)),
          ],
        ),
      )).toList(),
    );
  }
}
