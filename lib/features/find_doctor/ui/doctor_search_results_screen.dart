import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_header.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../cubit/find_doctor_cubit.dart';
import '../cubit/find_doctor_state.dart';
import 'widgets/doctor_card.dart';

class DoctorSearchResultsScreen extends StatelessWidget {
  const DoctorSearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FindDoctorCubit()..getDoctors(),
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
                        'Doctors',
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
              child: BlocBuilder<FindDoctorCubit, FindDoctorState>(
                builder: (context, state) {
                  if (state is FindDoctorLoading) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
                  } else if (state is FindDoctorSuccess) {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                      itemCount: state.doctors.length,
                      separatorBuilder: (context, index) => SizedBox(height: 15.h),
                      itemBuilder: (context, index) {
                        return DoctorCard(
                          doctor: state.doctors[index],
                          onTap: () {
                            Navigator.pushNamed(
                              context, 
                              Routes.doctorDetailsScreen, 
                              arguments: state.doctors[index]
                            );
                          },
                        );
                      },
                    );
                  } else if (state is FindDoctorError) {
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
              currentIndex: 1,
              onTap: (index) {
                if (index == 0) {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
                }
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
