import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import '../../data/models/medical_record_model.dart';

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
                      hintText: 'Mohamed',
                      hintStyle: TextStyle(fontSize: 13.sp, color: Colors.black87),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 3.w),
        InkWell(
          onTap: () => showFilterBottomSheet(context),
          child: Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Icon(Icons.tune, color: AppColors.mainGreen, size: 22.r),
          ),
        ),
      ],
    );
  }
}

class MedicalRecordCard extends StatelessWidget {
  final MedicalRecordModel record;
  const MedicalRecordCard({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
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
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60.r,
                height: 60.r,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.title,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${record.date} - ${record.type}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const Divider(color: Color(0xFFF0F0F0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton('Download', Icons.download_outlined),
              Container(height: 20.h, width: 1, color: Colors.grey.shade200),
              _buildActionButton('Share', Icons.share_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => Container(
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
          SizedBox(height: 3.h),
        ],
      ),
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
      SizedBox(height: 5.h),
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
                  groupValue: options[0],
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
