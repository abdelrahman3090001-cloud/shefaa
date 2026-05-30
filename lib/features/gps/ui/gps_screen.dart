import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/features/gps/cubit/gps_cubit.dart';
import 'package:shefaa/features/gps/cubit/gps_state.dart';
import 'package:shefaa/features/gps/ui/widgets/gps_widgets.dart';
import 'package:shefaa/features/gps/data/repos/gps_repo.dart';
import 'package:shefaa/features/gps/data/models/facility_model.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';

class GpsScreen extends StatelessWidget {
  const GpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GpsCubit(GpsRepo())..getGpsData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<GpsCubit, GpsState>(
          builder: (context, state) {
            List<FacilityModel> facilities = [];
            if (state is GpsSuccess) {
              facilities = state.facilities;
            }

            return Column(
              children: [
                GpsHeader(facilities: facilities),
                const GpsSearchBar(),
                const GpsCategories(),
                const GpsMapView(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nearby Facilities',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: state is GpsLoading
                      ? const Center(child: CircularProgressIndicator(color: AppColors.mainGreen))
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemCount: facilities.length,
                          itemBuilder: (context, index) {
                            final facility = facilities[index];
                            
                            final List<String> facilityImages = [
                              'assets/images/Vector.png',
                              'assets/images/assay.png',
                              'assets/images/hospital-01.png',
                            ];

                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.facilityDetailsScreen,
                                  arguments: facility,
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 12.h),
                                padding: EdgeInsets.all(12.r),
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
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.r),
                                      decoration: BoxDecoration(
                                        color: AppColors.softGreen,
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
                                            facility.name,
                                            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 2.h),
                                          Row(
                                            children: [
                                              Text(facility.distance, style: TextStyle(fontSize: 11.sp, color:AppColors.mainGreen)),
                                              SizedBox(width: 8.w),
                                              Icon(Icons.star, size: 12.r, color: Colors.amber),
                                              SizedBox(width: 2.w),
                                              Text(facility.rating, style: TextStyle(fontSize: 11.sp, color:AppColors.mainGreen)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const GpsBookmarkButton(), // تم استبدال الأيقونة الثابتة بالويدجيت التفاعلي
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBottomNavBar(
              currentIndex: 2,
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

// ويدجيت زر الـ Bookmark التفاعلي الخاص بشاشة GPS
class GpsBookmarkButton extends StatefulWidget {
  const GpsBookmarkButton({super.key});

  @override
  State<GpsBookmarkButton> createState() => _GpsBookmarkButtonState();
}

class _GpsBookmarkButtonState extends State<GpsBookmarkButton> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isBookmarked = !isBookmarked;
        });
      },
      child: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
        color: isBookmarked ? AppColors.mainGreen : Colors.grey.shade400,
        size: 20.r,
      ),
    );
  }
}
