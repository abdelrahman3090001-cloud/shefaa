import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../../../../core/routes/routes.dart';
import '../cubit/prescription_cubit.dart';
import '../cubit/prescription_state.dart';
import '../data/models/prescription_model.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrescriptionCubit()..getPrescriptions(),
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
                    'Prescription',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.add, color: Colors.white, size: 28.r),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Prescriptions',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    SizedBox(height: 15.h),
                    Expanded(
                      child: BlocBuilder<PrescriptionCubit, PrescriptionState>(
                        builder: (context, state) {
                          if (state is PrescriptionLoading) {
                            return const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.mainGreen));
                          } else if (state is PrescriptionSuccess) {
                            return ListView.separated(
                              itemCount: state.prescriptions.length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 15.h),
                              itemBuilder: (context, index) {
                                return _buildPrescriptionCard(
                                    context, state.prescriptions[index], index);
                              },
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
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
              currentIndex: 3,
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

  Widget _buildPrescriptionCard(
      BuildContext context, PrescriptionModel prescription, int index) {
    return Dismissible(
      key: Key(prescription.medicineName + index.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        context.read<PrescriptionCubit>().deletePrescription(index);
      },
      background: Container(
        padding: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
          color: const Color(0xFFFF7171),
          borderRadius: BorderRadius.circular(16.r),
        ),
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete_outline, color: Colors.white, size: 28.r),
      ),
      child: Container(
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4))
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(prescription.medicineName,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      _buildBadge(prescription.dosage, const Color(0xFFE3F2FD),
                          const Color(0xFF2196F3)),
                      SizedBox(width: 8.w),
                      _buildBadge(prescription.instruction,
                          const Color(0xFFFFF3E0), const Color(0xFFFF9800)),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(prescription.days.join(', '),
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                  SizedBox(height: 8.h),
                  // Progress Bar
                  Stack(
                    children: [
                      Container(
                        height: 4.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(2.r)),
                      ),
                      Container(
                        height: 4.h,
                        width: (prescription.currentDay / prescription.totalDays) *
                            150.w,
                        decoration: BoxDecoration(
                            color: AppColors.mainGreen,
                            borderRadius: BorderRadius.circular(2.r)),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text('Day ${prescription.currentDay}/${prescription.totalDays}',
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
                ],
              ),
            ),
            Column(
              children: prescription.times.map((time) => _buildTimeSlot(time)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(8.r)),
      child: Text(text,
          style: TextStyle(
              color: textColor, fontSize: 10.sp, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTimeSlot(String time) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.deepGreen,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        time.replaceAll(' ', '\n'),
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
