import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widgets/app_bottom_nav_bar.dart';
import '../data/models/facility_model.dart';

class BookmarkedServicesScreen extends StatelessWidget {
  final List<FacilityModel> facilities;

  const BookmarkedServicesScreen({super.key, required this.facilities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7), // لون الخلفية مطابق للـ Figma
      body: Column(
        children: [
          _buildHeader(context),
          // إضافة عنوان القسم "Bookmarks" كما في التصميم
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Row(
              children: [
                const Icon(Icons.bookmark, color: AppColors.mainGreen),
                SizedBox(width: 8.w),
                Text(
                  'Bookmarks',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: facilities.length,
              itemBuilder: (context, index) {
                final facility = facilities[index];
                
                final List<String> facilityImages = [
                  'assets/images/Vector.png',
                  'assets/images/assay.png',
                  'assets/images/hospital-01.png',
                ];

                return Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
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
                        // الانتقال لصفحة التفاصيل عند الضغط على الكارت بالكامل
                        Navigator.pushNamed(
                          context,
                          Routes.facilityDetailsScreen,
                          arguments: facility,
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
                                errorBuilder: (context, error, stackTrace) => const Icon(
                                  Icons.local_hospital_outlined,
                                  color: AppColors.mainGreen,
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    facility.name,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Text(
                                        "${facility.distance} away",
                                        style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        facility.rating,
                                        style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                                      ),
                                      Icon(Icons.star, size: 12.r, color: Colors.amber),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBottomNavBar(
            currentIndex: 2,
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
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.h,
      padding: EdgeInsets.only(top: 40.h, left: 10.w, right: 20.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.NpGreen,
            AppColors.mainGreen,
          ],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          Text(
            'Find Medical Services',
            style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
