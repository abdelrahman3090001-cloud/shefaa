import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_header.dart';

// 1. Header Widget
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      child: Stack(
        children: [
          Positioned(
            top: 50.h,
            left: 20.w,
            child: InkWell(
              onTap: () {},
              child: Icon(Icons.person_outline, color: Colors.white, size: 28.r),
            ),
          ),
          Positioned(
            top: 50.h,
            right: 20.w,
            child: InkWell(
              onTap: () {},
              child: Icon(Icons.notifications_none, color: Colors.white, size: 28.r),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Image.asset(
                'assets/images/splash.png',
                height: 100.h,
                color: Colors.white,
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Upcoming Appointments', 
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black)),
              InkWell(
                onTap: () {},
                child: Text('View All', 
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey, decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        if (appointments.isNotEmpty)
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 8))],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                    decoration: BoxDecoration(color: const Color(0xFF133B2C), borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      children: [
                        Text('Sep', style: TextStyle(color: Colors.white, fontSize: 13.sp)),
                        Text('18', style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(appointments[0]['doctor'], 
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: AppColors.mainGreen)),
                        Text('(${appointments[0]['specialization']})', style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 12.r, color: Colors.grey),
                            SizedBox(width: 4.w),
                            Text(appointments[0]['location'], style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(appointments[0]['time'], style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      Text(appointments[0]['day'], style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
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
          _buildCard('Recent', 'MRI Report', 'Sep 22, 2025 - PDF', Icons.description_outlined),
          SizedBox(width: 15.w),
          _buildCard('Prescription', 'Panadol', 'After Eating', Icons.medication_outlined, extra: '2 Pills'),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String sub, String date, IconData icon, {String? extra}) {
    bool isPrescription = title == 'Prescription';
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 8))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(icon, size: 18.r, color: Colors.grey),
              SizedBox(width: 5.w),
              Text(title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold))
            ]),
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
            SizedBox(height: 15.h),
            if (isPrescription)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeSlot('9:00\nPM'),
                  _buildTimeSlot('10:00\nAM', active: true),
                ],
              )
            else
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.mainGreen),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text('View', style: TextStyle(fontSize: 12.sp, color: AppColors.mainGreen)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String time, {bool active = false}) {
    return Container(
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: active ? AppColors.mainGreen : const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(time, textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 9.sp, color: active ? Colors.white : Colors.black87, fontWeight: FontWeight.bold)),
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text('Nearby Facilities', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: facilities.length,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(bottom: 12.h),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(16.r), 
                border: Border.all(color: Colors.grey.shade100),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(color: const Color(0xFFF1F8E9), borderRadius: BorderRadius.circular(12.r)),
                    child: Icon(index == 1 ? Icons.biotech_outlined : Icons.local_hospital_outlined, color: AppColors.mainGreen),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(facilities[index]['name'], style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Text(facilities[index]['distance'], style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                            SizedBox(width: 8.w),
                            Icon(Icons.star, size: 12.r, color: Colors.amber),
                            SizedBox(width: 2.w),
                            Text(facilities[index]['rating'], style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.bookmark_outline, color: Colors.grey.shade400, size: 20.r),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
