import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../../../../core/routes/routes.dart';
import '../cubit/find_doctor_cubit.dart';
import '../cubit/find_doctor_state.dart';

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
            Container(
              height: 120.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.mainGreen, // الفاتح
                      AppColors.deepGreen, // الغامق
                    ],
                    begin: Alignment.bottomCenter, // البداية من تحت (الفاتح تحت)
                    end: Alignment.topCenter,    // النهاية فوق (الغامق فوق)
                  )              ),
              child: Padding(
                padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 22.r),
                    ),
                    Text(
                      'Find Doctors',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.bookmarkedDoctorsScreen);
                      },
                      child: Icon(Icons.bookmark_border, color: Colors.white, size: 28.r),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                        hintText: 'Mohamed',
                        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.black87),
                        prefixIcon: Icon(Icons.search, color: AppColors.gray, size: 22.r),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.gray, width: 1.0),
                          borderRadius: BorderRadius.circular(44.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.mainGreen, width: 1.0),
                          borderRadius: BorderRadius.circular(44.r),
                        ),
                        fillColor: AppColors.lightGray,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    BlocBuilder<FindDoctorCubit, FindDoctorState>(
                      builder: (context, state) {
                        if (state is FindDoctorLoading) {
                          return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
                        } else if (state is FindDoctorSuccess) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.doctors.length,
                            separatorBuilder: (context, index) => SizedBox(height: 15.h),
                            itemBuilder: (context, index) {
                              final doctor = state.doctors[index];
                              // تحويل الكارت لزرار يروح لصفحة التفاصيل
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context, 
                                    Routes.doctorDetailsScreen, 
                                    arguments: doctor
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12.r),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.04),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 80.r,
                                        height: 80.r,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD9D9D9),
                                          borderRadius: BorderRadius.circular(12.r),
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              doctor.name,
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4.h),
                                            Text(
                                              doctor.specialization,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: AppColors.gray,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 8.h),
                                            Row(
                                              children: [
                                                Text(
                                                  doctor.rating,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(width: 4.w),
                                                Icon(Icons.star, color: Colors.amber, size: 16.r),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
