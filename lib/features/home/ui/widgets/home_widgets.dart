import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_header.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/appointment_card.dart';
import '../../../../gen/assets.gen.dart';
import '../../../gps/data/models/facility_model.dart';

// 1. Header Widget
class HomeHeader extends StatelessWidget {
  final VoidCallback onProfileTap;
  final VoidCallback onNotificationsTap;

  const HomeHeader({
    super.key,
    required this.onProfileTap,
    required this.onNotificationsTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      child: Stack(
        children: [
          Positioned(
            top: 40.h,
            left: 20.w,
            child: InkWell(
              onTap: onProfileTap,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.user4.image(
                    height: 40.r,
                    width: 40.r,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Ahmed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 45.h,
            right: 20.w,
            child: InkWell(
              onTap: onNotificationsTap,
              child: Assets.images.bell.image(
                height: 30.r,
                width: 30.r,
                fit: BoxFit.contain,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Assets.images.splash.image(
                height: 60.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. Upcoming Appointments Widget
class UpcomingAppointments extends StatelessWidget {
  final List<dynamic> appointments;
  const UpcomingAppointments({super.key, required this.appointments});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Upcoming Appointments',
          actionText: 'View All',
          onActionTap: () {
             Navigator.pushNamed(context, Routes.appointmentsScreen);
          },
        ),
        SizedBox(height: 10.h),
        if (appointments.isNotEmpty)
          AppointmentCard(
            doctorName: appointments[0]['doctor'],
            specialization: appointments[0]['specialization'],
            location: appointments[0]['location'],
            time: appointments[0]['time'],
            day: appointments[0]['day'],
            month: 'Sep',
            date: '18',
            onTap: () {},
          ),
      ],
    );
  }
}

// 3. Medical Summary Widget
class MedicalSummary extends StatelessWidget {
  const MedicalSummary({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          _buildCard('Recent', 'MRI Report', 'Sep 22, 2025 - PDF', iconData: Icons.description_outlined,
            onActionTap: () {
              Navigator.pushNamed(context, Routes.medicalHistoryScreen);
            },),
          SizedBox(width: 10.w),
          _buildCard(
            'Prescription',
            'Panadol',
            'After Eating',
            usePillImage: true,
            extra: '2 Pills',
            onActionTap: () {
              Navigator.pushNamed(context, Routes.prescriptionScreen);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String sub, String date, {IconData? iconData, bool usePillImage = false, String? extra, VoidCallback? onActionTap}) {
    bool isPrescription = title == 'Prescription';
    return Expanded(
      child: InkWell(
        onTap: onActionTap,
        child: Container(
          height: 178.h,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (usePillImage)
                    Image.asset(
                      'assets/images/pill.png',
                      width: 24.r,
                      height: 24.r,
                      fit: BoxFit.contain,
                      color: Colors.black,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.medication_outlined, size: 20.r, color: Colors.grey),
                    )
                  else if (iconData != null)
                    Icon(iconData, size: 20.r, color: Colors.grey),
                  SizedBox(width: 8.w),
                  Text(title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10.h),
              Text(sub, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              Text(date, style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
              if (extra != null) ...[
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(10.r)),
                  child: Text(extra, style: TextStyle(fontSize: 10.sp, color: AppColors.mainGreen, fontWeight: FontWeight.bold)),
                ),
              ],
              const Spacer(),
              if (isPrescription)
                Align(
                  alignment: Alignment.centerRight,
                  child: Transform.translate(
                    offset: Offset(0, -32.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTimeSlot('9:00\nPM', active: true),
                        SizedBox(height: 4.h),
                        _buildTimeSlot('10:00\nAM', active: true),
                      ],
                    ),
                  ),
                )
              else
                Center(
                  child: SizedBox(
                    width: 80.w,
                    height: 28.h,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.mainGreen),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'View',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.mainGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String time, {bool active = false}) {
    return SizedBox(
      width: 40.w,
      height: 28.h,
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: active ? AppColors.mainGreen : const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              time,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8.sp,
                color: active ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
                height: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 4. Nearby Facilities Widget
class NearbyFacilities extends StatelessWidget {
  final List<dynamic> facilities;
  const NearbyFacilities({super.key, required this.facilities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Nearby Facilities',
          onActionTap: () {},
        ),
        SizedBox(height: 10.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: facilities.length,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemBuilder: (context, index) {
            final List<String> facilityImages = [
              'assets/images/hospital-01.png',
              'assets/images/Vector.png',
              'assets/images/assay.png',
            ];

            return Container(
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.grey.shade100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16.r),
                  onTap: () {
                    // الانتقال لصفحة تفاصيل المرفق مع تمرير المرفق الحالي كـ Model
                    Navigator.pushNamed(
                      context,
                      Routes.facilityDetailsScreen,
                      arguments: FacilityModel.fromJson(facilities[index] as Map<String, dynamic>), 
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F8E9),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Image.asset(
                            facilityImages[index % facilityImages.length],
                            color: AppColors.mainGreen,
                            width: 24.r,
                            height: 24.r,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.local_hospital_outlined,
                              color: AppColors.mainGreen,
                              size: 24.r,
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                facilities[index]['name'],
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  Text(
                                    facilities[index]['distance'],
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Icon(
                                    Icons.star,
                                    size: 12.r,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    facilities[index]['rating'],
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.bookmark_outline,
                          color: Colors.grey.shade400,
                          size: 20.r,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
