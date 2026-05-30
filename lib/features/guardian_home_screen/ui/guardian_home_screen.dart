import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/guardian_home_cubit.dart';
import '../cubit/guardian_home_state.dart';
import 'widgets/guardian_widgets.dart';
import '../../home/ui/widgets/home_widgets.dart';
import '../../../../core/widgets/appointment_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../../../../core/theming/app_colors.dart';

class GuardianHomeScreen extends StatelessWidget {
  const GuardianHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GuardianHomeCubit()..getGuardianHomeData(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFB),
        body: BlocBuilder<GuardianHomeCubit, GuardianHomeState>(
          builder: (context, state) {
            if (state is GuardianHomeLoading) {
              return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
            } else if (state is GuardianHomeSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GuardianHeader(
                      onProfileTap: () {},
                      onNotificationsTap: () {},
                    ),
                    SizedBox(height: 15.h),
                    UserSwitcher(userName: state.locationData['name']),
                    SizedBox(height: 25.h),
                    RealTimeLocation(lastSeen: state.locationData['lastSeen']),
                    SizedBox(height: 25.h),
                    const SectionHeader(title: 'Appointments', actionText: 'View All'),
                    SizedBox(height: 10.h),
                    AppointmentCard(
                      doctorName: state.appointments[0]['doctor'],
                      specialization: state.appointments[0]['specialization'],
                      location: state.appointments[0]['location'],
                      time: state.appointments[0]['time'],
                      day: state.appointments[0]['day'],
                      month: state.appointments[0]['month'],
                      date: state.appointments[0]['date'],
                      onTap: () {},
                    ),
                    const MedicalSummary(), // إعادة استخدام ويدجيت الملخص الطبي
                    SizedBox(height: 100.h),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBottomNavBar(
              currentIndex: 0,
              onTap: (index) {},
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
