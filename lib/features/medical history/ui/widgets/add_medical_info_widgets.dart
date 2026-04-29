import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import 'package:shefaa/core/widgets/app_button.dart';
import 'package:shefaa/core/widgets/custom-text_form_field.dart';

class AddMedicalInfoBottomSheet extends StatefulWidget {
  const AddMedicalInfoBottomSheet({super.key});

  @override
  State<AddMedicalInfoBottomSheet> createState() => _AddMedicalInfoBottomSheetState();
}

class _AddMedicalInfoBottomSheetState extends State<AddMedicalInfoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Medical Information',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            _buildLabel('Blood Type'),
            CustomTextFormField(hintText: 'e.g. O+'),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Weight (kg)'),
                      CustomTextFormField(hintText: 'e.g. 80'),
                    ],
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Height (cm)'),
                      CustomTextFormField(hintText: 'e.g. 180'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            _buildLabel('Chronic Conditions'),
            CustomTextFormField(hintText: 'e.g. Type 1 Diabetes'),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Allergic Drug'),
                      CustomTextFormField(hintText: 'e.g. Penicillin'),
                    ],
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Allergic Food'),
                      CustomTextFormField(hintText: 'e.g. Milk'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            _buildLabel('Insurance Provider'),
            CustomTextFormField(hintText: 'e.g. MetLife'),
            SizedBox(height: 15.h),
            _buildLabel('Insurance ID'),
            CustomTextFormField(hintText: 'e.g. 2938104321'),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Text('Cancel', style: TextStyle(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: AppButton(
                    title: 'Save',
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }
}

void showAddMedicalInfoBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: const AddMedicalInfoBottomSheet(),
    ),
  );
}
