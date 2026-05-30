import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import 'package:shefaa/core/widgets/app_button.dart';

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
            // Header with Close Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Medical Information',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: Colors.grey, size: 24.r),
                ),
              ],
            ),
            SizedBox(height: 15.h),

            // Blood Type
            _buildLabel('Blood Type'),
            _buildTextField('e.g. O+'),
            SizedBox(height: 15.h),

            // Weight & Height Row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Weight (kg)'),
                      _buildTextField('e.g. 90'),
                    ],
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Height (cm)'),
                      _buildTextField('e.g. 180'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),

            // Chronic Conditions
            _buildLabel('Chronic Conditions'),
            _buildTextField('e.g. Type 1 Diabetes', isLarge: true),
            SizedBox(height: 15.h),

            // Allergies Row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Allergies (Drug)'),
                      _buildTextField('e.g. Penicillin'),
                    ],
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Allergies (Food)'),
                      _buildTextField('e.g. Milk'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),

            // Insurance Provider
            _buildLabel('Insurance Provider'),
            _buildTextField('e.g. MetLife'),
            SizedBox(height: 15.h),

            // Insurance ID
            _buildLabel('Insurance ID'),
            _buildTextField('e.g. W987654321'),
            SizedBox(height: 30.h),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
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
        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isLarge = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        maxLines: isLarge ? 2 : 1,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 13.sp, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        ),
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
