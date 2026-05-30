import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class DependentFilterBottomSheet extends StatelessWidget {
  const DependentFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter & Sort',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: Colors.grey, size: 22.r),
              ),
            ],
          ),
          SizedBox(height: 25.h),
          _buildFilterSection('Sort Order', ['Newest', 'Oldest']),
          _buildFilterSection('Document Category', ['All', 'PDF', 'Image']),
          _buildFilterSection('Date Range', ['All Time', 'Last 3 Months', 'Last Year']),
          SizedBox(height: 35.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  'Clear All Filters',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainGreen,
                  padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'Apply',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _buildFilterSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12.h),
        Column(
          children: options.map((opt) => Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              children: [
                SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: Radio(
                    value: opt,
                    groupValue: options[0], // القيمة المختارة افتراضياً
                    activeColor: AppColors.mainGreen,
                    onChanged: (v) {},
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  opt,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                ),
              ],
            ),
          )).toList(),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const DependentFilterBottomSheet(),
    );
  }
}
