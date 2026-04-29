import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widgets/app_button.dart';

class FacilityDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> facility;

  const FacilityDetailsScreen({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFacilityCard(),
                  SizedBox(height: 25.h),
                  _buildReviewsSection(),
                ],
              ),
            ),
          ),
          _buildBottomNavBar(context),
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
          colors: [AppColors.mainGreen, AppColors.darkGreen],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
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

  Widget _buildFacilityCard() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.r,
                height: 80.r,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.business, color: Colors.grey, size: 40.r),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            facility['name'],
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                        ),
                        Icon(Icons.bookmark_outline, color: AppColors.mainGreen, size: 24.r),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(facility['distance'], style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 14.r),
                        SizedBox(width: 4.w),
                        Text(facility['rating'], style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                        SizedBox(width: 10.w),
                        Text('Open 24 hours', style: TextStyle(fontSize: 12.sp, color: AppColors.mainGreen)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  title: 'Call',
                  height: 45.h,
                  onTap: () {},
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: AppButton(
                  title: 'Get Directions',
                  height: 45.h,
                  backgroundColor: AppColors.deepGreen,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Reviews', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: Text('+ Add Review', style: TextStyle(color: AppColors.mainGreen))),
          ],
        ),
        _buildReviewItem('Bassem Walid', '4.0', 'Great center with a broad variety of medical labs.'),
        _buildReviewItem('Ahmed Gamal', '5.0', 'The delivery service is very recommend.'),
      ],
    );
  }

  Widget _buildReviewItem(String name, String rating, String comment) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(name, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(rating, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
              Icon(Icons.star, color: Colors.amber, size: 14.r),
            ],
          ),
          SizedBox(height: 4.h),
          Text(comment, style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700)),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAppBottomNavBarSimulated(context),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildAppBottomNavBarSimulated(BuildContext context) {
     return Container(
      height: 65.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.deepGreen,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(icon: const Icon(Icons.home_outlined, color: Colors.white70), onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst)),
          IconButton(icon: const Icon(Icons.person_outline, color: Colors.white70), onPressed: () {}),
          IconButton(icon: const Icon(Icons.location_on, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.medication_outlined, color: Colors.white70), onPressed: () {}),
          IconButton(icon: const Icon(Icons.assignment_outlined, color: Colors.white70), onPressed: () {}),
        ],
      ),
    );
  }
}
