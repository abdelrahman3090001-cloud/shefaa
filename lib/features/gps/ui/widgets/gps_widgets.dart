import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom-text_form_field.dart';
import '../../data/models/facility_model.dart';

// 1. GPS Header
class GpsHeader extends StatelessWidget {
  final List<FacilityModel>? facilities;
  const GpsHeader({super.key, this.facilities});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.h,
      padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 30), 
          Text(
            'Find Medical Services',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context, 
                Routes.bookmarkedServicesScreen,
                arguments: facilities ?? <FacilityModel>[],
              );
            },
            child: Icon(Icons.bookmark_outline, color: AppColors.white, size: 26.r),
          ),
        ],
      ),
    );
  }
}

// 2. Gps Search Bar
class GpsSearchBar extends StatelessWidget {
  const GpsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: const CustomTextFormField(
        hintText: 'Search facilities..',
        suffixIcon: Icon(Icons.search, color: AppColors.gray),
      ),
    );
  }
}

// 3. Gps Categories
class GpsCategories extends StatefulWidget {
  const GpsCategories({super.key});

  @override
  State<GpsCategories> createState() => _GpsCategoriesState();
}

class _GpsCategoriesState extends State<GpsCategories> {
  int selectedIndex = 0;

  final List<Map<String, String>> categories = [
    {'name': 'Hospital', 'iconPath': 'assets/images/hospital-01.png'},
    {'name': 'Pharmacy', 'iconPath': 'assets/images/Vector.png'},
    {'name': 'Laboratory', 'iconPath': 'assets/images/assay.png'},
    {'name': 'Clinic', 'iconPath': 'assets/images/44444 Icon.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: List.generate(categories.length, (index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.deepGreen : AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: isSelected ? Colors.transparent : AppColors.grayShade300),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    categories[index]['iconPath']!,
                    color: isSelected ? AppColors.white : AppColors.gray,
                    colorBlendMode: BlendMode.srcIn,
                    width: 15.r,
                    height: 15.r,
                    errorBuilder: (context, error, stackTrace) => 
                      Icon(Icons.category_outlined, size: 15.r, color: isSelected ? AppColors.white : AppColors.gray),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    categories[index]['name']!,
                    style: TextStyle(
                      color: isSelected ? AppColors.white : AppColors.gray,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// 4. Map View
class GpsMapView extends StatelessWidget {
  const GpsMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.r),
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: AppColors.lightGreen,
        border: Border.all(color: AppColors.grayShade300),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: Stack(
          children: [
            Center(
              child: Icon(Icons.location_on, color: AppColors.error, size: 40.r),
            ),
          ],
        ),
      ),
    );
  }
}
