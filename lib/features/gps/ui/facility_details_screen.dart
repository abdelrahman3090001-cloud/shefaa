import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_bottom_nav_bar.dart';
import '../data/models/facility_model.dart';

class FacilityDetailsScreen extends StatelessWidget {
  final FacilityModel facility;

  const FacilityDetailsScreen({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7), // خلفية فاتحة لتمييز الكروت البيضاء
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
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 15.w, right: 15.w),
        child: AppBottomNavBar(
          currentIndex: 2, 
          onTap: (index) {},
        ),
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
          colors: [AppColors.NpGreen, AppColors.mainGreen],
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

  Widget _buildFacilityCard() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.r,
                height: 100.r,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEDED),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(Icons.image_outlined, size: 40.r, color: Colors.grey),
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
                            facility.name,
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                        ),
                        const BookmarkButton(), // استخدام الودجيت التفاعلي الجديد هنا
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text('${facility.distance} away ${facility.rating} ★',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                    Text('Open 24 hours',
                      style: TextStyle(fontSize: 12.sp, color: AppColors.mainGreen, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.call, color: Colors.white, size: 18.r),
                        SizedBox(width: 8.w),
                        Text('Call', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map, color: Colors.white, size: 18.r),
                        SizedBox(width: 8.w),
                        Text('Get Directions', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                      ],
                    ),
                  ),
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
            TextButton(
              onPressed: () {},
              child: const Text('+ Add Review',
                style: TextStyle(color: AppColors.mainGreen, fontWeight: FontWeight.bold)
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        _buildReviewItem(
          'Bassem Waheed',
          '4.0',
          'Decent center with different variety of medical clinics',
        ),
        SizedBox(height: 15.h),
        _buildReviewItem(
          'Ahmed Gamal', 
          '1.0', 
          'The Delivery service is. i don\'t recommend it'
        ),
      ],
    );
  }

  Widget _buildReviewItem(String name, String rating, String comment) {
    double numericRating = double.tryParse(rating) ?? 0.0;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(rating, style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              SizedBox(width: 4.w),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < numericRating.floor() ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 14.r,
                  );
                }),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            comment,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600, height: 1.4),
          ),
        ],
      ),
    );
  }
}

// ويدجيت زر الـ Bookmark التفاعلي
class BookmarkButton extends StatefulWidget {
  const BookmarkButton({super.key});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
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
        color: AppColors.mainGreen,
        size: 24.r,
      ),
    );
  }
}
