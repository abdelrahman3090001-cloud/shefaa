import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/features/home/cubit/home_cubit.dart';
import 'package:shefaa/features/home/cubit/home_state.dart';
import 'package:shefaa/features/home/ui/widgets/home_widgets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFB),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeader(),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: const Center(child: CircularProgressIndicator(color: AppColors.mainGreen)),
                    );
                  } else if (state is HomeSuccess) {
                    return Column(
                      children: [
                        SizedBox(height: 20.h),
                        UpcomingAppointments(appointments: state.appointments),
                        const MedicalSummary(),
                        NearbyFacilities(facilities: state.facilities),
                      ],
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text(state.error));
                  }
                  return const SizedBox.shrink();
                },
              ),
              // سيز بوكس داخلي لضمان مساحة كافية عند السكرول
              SizedBox(height: 20.h),
            ],
          ),
        ),
        // هنا رفعنا الـ Bottom Bar عن طريق لفه بـ Column مع SizedBox من تحت
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBottomNavBar(
              currentIndex: 0,
              onTap: (index) {
                // التنقل بين الصفحات
              },
            ),
            // السيز بوكس ده هو اللي بيعزل الشاشة من تحت خالص وبيرفع البار لفوق
          ],
        ),
      ),
    );
  }
}
