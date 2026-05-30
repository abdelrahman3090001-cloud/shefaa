import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/features/home/cubit/home_cubit.dart';
import 'package:shefaa/features/home/cubit/home_state.dart';
import 'package:shefaa/features/home/ui/widgets/home_widgets.dart';
import 'package:shefaa/features/home/ui/widgets/home_side_drawers.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onNavBarTapped(int index) {
    switch (index) {
      case 0:
        // نحن بالفعل في الصفحة الرئيسية
        break;
      case 1:
        Navigator.pushNamed(context, Routes.appointmentsScreen);
        break;
      case 2:
        Navigator.pushNamed(context, Routes.gpsScreen);
        break;
      case 3:
        Navigator.pushNamed(context, Routes.prescriptionScreen);
        break;
      case 4:
        Navigator.pushNamed(context, Routes.accountScreen);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFFFBFBFB),
        drawer: const ProfileDrawer(),
        endDrawer: const NotificationsDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(
                onProfileTap: () => _scaffoldKey.currentState!.openDrawer(),
                onNotificationsTap: () => _scaffoldKey.currentState!.openEndDrawer(),
              ),
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
              SizedBox(height: 20.h),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBottomNavBar(
              currentIndex: 0,
              onTap: _onNavBarTapped,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
