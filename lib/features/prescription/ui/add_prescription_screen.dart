import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';

class AddPrescriptionBottomSheet extends StatefulWidget {
  const AddPrescriptionBottomSheet({super.key});

  @override
  State<AddPrescriptionBottomSheet> createState() => _AddPrescriptionBottomSheetState();
}

class _AddPrescriptionBottomSheetState extends State<AddPrescriptionBottomSheet> {
  String selectedPeriod = 'AM';
  int selectedDayIndex = 0;
  final List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

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
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Prescription',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: Colors.grey, size: 24.r),
                ),
              ],
            ),
            SizedBox(height: 15.h),

            // Medicine Name
            _buildLabel('Medicine Name'),
            _buildTextField('e.g. Aspirin'),
            SizedBox(height: 15.h),

            // Dose & Frequency
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Dose'),
                      _buildTextField('e.g. 2 Pills'),
                    ],
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Frequency'),
                      _buildDropdownField('Once'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),

            // Time Selector
            _buildLabel('Time'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTimeBox('09'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(':', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
                ),
                _buildTimeBox('00'),
                SizedBox(width: 15.w),
                Column(
                  children: [
                    _buildPeriodButton('AM'),
                    SizedBox(height: 5.h),
                    _buildPeriodButton('PM'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Days Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(days.length, (index) => _buildDayCircle(index)),
            ),
            SizedBox(height: 20.h),

            // Duration & Meal Timing
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Duration'),
                      _buildTextField('e.g. 2 Weeks'),
                    ],
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Meal Timing'),
                      _buildDropdownField('After Eating'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),

            // Footer Buttons
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
                    title: 'Add',
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
      child: Text(text, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.black54)),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 13.sp, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: TextStyle(fontSize: 13.sp, color: Colors.black87)),
          Icon(Icons.keyboard_arrow_down, size: 20.r, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildTimeBox(String text) {
    return Container(
      width: 65.w,
      height: 65.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(text, style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: Colors.black87)),
    );
  }

  Widget _buildPeriodButton(String period) {
    bool isSelected = selectedPeriod == period;
    return GestureDetector(
      onTap: () => setState(() => selectedPeriod = period),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(6.r),
          border: isSelected ? null : Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          period,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDayCircle(int index) {
    bool isSelected = selectedDayIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedDayIndex = index),
      child: Container(
        width: 38.r,
        height: 38.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainGreen.withOpacity(0.1) : const Color(0xFFF5F5F5),
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: AppColors.mainGreen) : null,
        ),
        child: Text(
          days[index],
          style: TextStyle(
            color: isSelected ? AppColors.mainGreen : Colors.grey,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Function to show the bottom sheet
void showAddPrescriptionBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: const AddPrescriptionBottomSheet(),
    ),
  );
}
