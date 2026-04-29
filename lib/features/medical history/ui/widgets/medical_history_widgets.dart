import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/theming/app_colors.dart';

class MedicalSearchBar extends StatelessWidget {
  const MedicalSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey, size: 20.r),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Documents Data',
                      hintStyle: TextStyle(fontSize: 13.sp, color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
        InkWell(
          onTap: () => showFilterBottomSheet(context),
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Icon(Icons.tune, color: AppColors.mainGreen, size: 20.r),
          ),
        ),
      ],
    );
  }
}

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      padding: EdgeInsets.all(20.r),
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
              Text('Filter & Sort', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
            ],
          ),
          SizedBox(height: 15.h),
          _buildFilterSection('Sort Date', ['Newest', 'Oldest']),
          _buildFilterSection('Document Category', ['All', 'PDF', 'Image']),
          _buildFilterSection('Date Range', ['All Time', 'Last 3 Months', 'Last Year']),
          SizedBox(height: 25.h),
          Row(
            children: [
              Expanded(child: TextButton(onPressed: () {}, child: const Text('Reset All Filters', style: TextStyle(color: Colors.grey)))),
              SizedBox(width: 15.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.mainGreen, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),
                  child: const Text('Apply', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildFilterSection(String title, List<String> options) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.grey)),
      SizedBox(height: 10.h),
      Wrap(
        spacing: 10.w,
        children: options.map((opt) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(value: opt, groupValue: options[0], onChanged: (v) {}),
            Text(opt, style: TextStyle(fontSize: 12.sp)),
          ],
        )).toList(),
      ),
      SizedBox(height: 15.h),
    ],
  );
}
