import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../../../../core/routes/routes.dart';
import '../cubit/appointments_cubit.dart';
import '../cubit/appointments_state.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentsCubit()..getAppointments(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBottomNavBar(
              currentIndex: 1,
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
        body: Column(
          children: [
            // الهيدر الموحد الجديد
            Container(
              height: 110.h,
              width: double.infinity,
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
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white, size: 20),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Spacer(flex: 2),
                      Text(
                        'Appointments',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                      itemCount: state.appointments.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.h),
                      itemBuilder: (context, index) {
                        final appointment = state.appointments[index];
                        return _buildAppointmentCard(context, appointment);
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
      ),
    );
  }

  Widget _buildAppointmentCard(BuildContext context, dynamic appointment) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xFF133B2C),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                Text(appointment.month,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold)),
                Text(appointment.date,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appointment.doctorName,
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.bold)),
                Text('(${appointment.specialization})',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 14.r, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(appointment.location,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 8.h),
                _buildStatusBadge(appointment.status),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(appointment.time,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              Text('PM',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 5.h),
              Text(appointment.day,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    Color bgColor;
    IconData icon;

    switch (status) {
      case 'Confirmed':
        color = Colors.white;
        bgColor = const Color(0xFF2E7D32);
        icon = Icons.check_circle;
        break;
      case 'Pending':
        color = const Color(0xFF8A6D3B);
        bgColor = const Color(0xFFFCF8E3);
        icon = Icons.access_time_filled;
        break;
      case 'Canceled':
        color = Colors.white;
        bgColor = const Color(0xFFE57373);
        icon = Icons.cancel;
        break;
      default:
        color = Colors.grey;
        bgColor = Colors.grey.shade100;
        icon = Icons.help;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.r, color: color),
          SizedBox(width: 4.w),
          Text(status,
              style: TextStyle(
                  color: color, fontSize: 10.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
