import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom-text_form_field.dart';

class DoctorSearchBar extends StatelessWidget {
  const DoctorSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Search for doctors...',
      suffixIcon: Icon(Icons.search, color: AppColors.mainGreen, size: 24.r),
    );
  }
}

class SpecialitiesGrid extends StatelessWidget {
  const SpecialitiesGrid({super.key});

  final List<Map<String, dynamic>> specialities = const [
    {'name': 'Cardiology', 'icon': Icons.favorite_outline},
    {'name': 'Dentistry', 'icon': Icons.medical_services_outlined},
    {'name': 'Neurology', 'icon': Icons.psychology_outlined},
    {'name': 'Ophthalmology', 'icon': Icons.visibility_outlined},
    {'name': 'Orthopedics', 'icon': Icons.personal_video_outlined},
    {'name': 'Pediatrics', 'icon': Icons.child_care_outlined},
    {'name': 'Radiology', 'icon': Icons.settings_input_antenna_outlined},
    {'name': 'Urology', 'icon': Icons.water_drop_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: specialities.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                  color: const Color(0xFFF1F8E9),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(specialities[index]['icon'], 
                    color: AppColors.mainGreen, size: 20.r),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  specialities[index]['name'],
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
