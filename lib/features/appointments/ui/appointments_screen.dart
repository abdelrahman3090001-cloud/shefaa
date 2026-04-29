import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_header.dart';
import '../../../../core/widgets/appointment_card.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../cubit/appointments_cubit.dart';
import '../cubit/appointments_state.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentsCubit()..getAppointments(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFB),
        body: Column(
          children: [
            AppHeader(
              child: Stack(
                children: [
                  Positioned(
                    top: 50.h,
                    left: 20.w,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(Icons.arrow_back_ios_new,
                            color: Colors.white, size: 20.r),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Text(
                        'Appointments',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
                builder: (context, state) {
                  if (state is AppointmentsLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.mainGreen));
                  } else if (state is AppointmentsSuccess) {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      itemCount: state.appointments.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.h),
                      itemBuilder: (context, index) {
                        final appointment = state.appointments[index];
                        return Column(
                          children: [
                            AppointmentCard(
                              doctorName: appointment.doctorName,
                              specialization: appointment.specialization,
                              location: appointment.location,
                              time: appointment.time,
                              day: appointment.day,
                              month: appointment.month,
                              date: appointment.date,
                            ),
                            SizedBox(height: 8.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: _buildStatusBadge(appointment.status),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (state is AppointmentsError) {
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
              currentIndex: 4, // Assuming 4 for appointments
              onTap: (index) {
                if (index == 0) Navigator.pop(context);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    Color bgColor;
    IconData icon;

    switch (status) {
      case 'Confirmed':
        color = const Color(0xFF2E7D32);
        bgColor = const Color(0xFFE8F5E9);
        icon = Icons.check_circle;
        break;
      case 'Pending':
        color = const Color(0xFFFFA000);
        bgColor = const Color(0xFFFFF8E1);
        icon = Icons.access_time_filled;
        break;
      case 'Canceled':
        color = const Color(0xFFD32F2F);
        bgColor = const Color(0xFFFFEBEE);
        icon = Icons.cancel;
        break;
      default:
        color = Colors.grey;
        bgColor = Colors.grey.shade100;
        icon = Icons.help;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.r, color: color),
          SizedBox(width: 4.w),
          Text(
            status,
            style: TextStyle(
              color: color,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
