import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_header.dart';
import '../../../../core/widgets/app_button.dart';
import '../data/models/doctor_model.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Doctor Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50.h,
                  right: 20.w,
                  child: Icon(Icons.bookmark_border, color: Colors.white, size: 24.r),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.asset(
                            doctor.image,
                            width: 120.r,
                            height: 120.r,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 120.r,
                              height: 120.r,
                              color: AppColors.lightGray,
                              child: Icon(Icons.person, color: AppColors.gray, size: 60.r),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          doctor.name,
                          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          doctor.specialization,
                          style: TextStyle(fontSize: 14.sp, color: AppColors.gray),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20.r),
                            SizedBox(width: 5.w),
                            Text(
                              doctor.rating,
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(' (120 Reviews)', style: TextStyle(fontSize: 12.sp, color: AppColors.gray)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Text('About Doctor', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  Text(
                    doctor.description,
                    style: TextStyle(fontSize: 14.sp, color: AppColors.gray, height: 1.5),
                  ),
                  SizedBox(height: 25.h),
                  Text('Available Slots', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 45.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: doctor.availableTimes.length,
                      separatorBuilder: (context, index) => SizedBox(width: 10.w),
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.lightGreen,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.mainGreen),
                        ),
                        child: Text(
                          doctor.availableTimes[index],
                          style: TextStyle(color: AppColors.mainGreen, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  AppButton(
                    buttonText: 'Book Appointment',
                    textStyle: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.bookAppointmentScreen, arguments: doctor);
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
