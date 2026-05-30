import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class AddPrescriptionBottomSheet extends StatefulWidget {
  const AddPrescriptionBottomSheet({super.key});

  @override
  State<AddPrescriptionBottomSheet> createState() => _AddPrescriptionBottomSheetState();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddPrescriptionBottomSheet(),
    );
  }
}

class _AddPrescriptionBottomSheetState extends State<AddPrescriptionBottomSheet> {
  String selectedFrequency = 'Once';
  String selectedMealTiming = 'After Eating';
  String selectedPeriod = 'AM';
  List<String> selectedDays = ['S', 'M', 'T'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
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
                Text('Add Prescription', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: Colors.grey, size: 22.r),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            _buildLabel('Medicine Name'),
            _buildTextField('e.g., Aspirin'),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildLabel('Dose'), _buildTextField('e.g., 2 Pills')])),
                SizedBox(width: 15.w),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildLabel('Frequency'), _buildDropdown(['Once', 'Twice'], selectedFrequency, (val) => setState(() => selectedFrequency = val!))])),
              ],
            ),
            SizedBox(height: 15.h),
            _buildLabel('Time'),
            Row(
              children: [
                _buildTimeBox('09'),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5.w), child: Text(':', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold))),
                _buildTimeBox('00'),
                SizedBox(width: 15.w),
                Column(
                  children: [
                    _buildAMPM('AM'),
                    SizedBox(height: 5.h),
                    _buildAMPM('PM'),
                  ],
                )
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((day) => _buildDayCircle(day)).toList(),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildLabel('Duration'), _buildTextField('e.g., 2 Weeks')])),
                SizedBox(width: 15.w),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildLabel('Meal Timing'), _buildDropdown(['After Eating', 'Before Eating'], selectedMealTiming, (val) => setState(() => selectedMealTiming = val!))])),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: () => Navigator.pop(context), style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)), padding: EdgeInsets.symmetric(vertical: 12.h)), child: const Text('Cancel'))),
                SizedBox(width: 15.w),
                Expanded(child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: AppColors.mainGreen, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)), padding: EdgeInsets.symmetric(vertical: 12.h)), child: Text('Add', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)))),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Padding(padding: EdgeInsets.only(bottom: 8.h), child: Text(text, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)));

  Widget _buildTextField(String hint) => TextField(decoration: InputDecoration(hintText: hint, hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey), filled: true, fillColor: const Color(0xFFF5F5F5), contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.none)));

  Widget _buildDropdown(List<String> items, String current, Function(String?) onChange) => Container(padding: EdgeInsets.symmetric(horizontal: 10.w), decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(10.r)), child: DropdownButtonHideUnderline(child: DropdownButton<String>(value: current, items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(fontSize: 12.sp)))).toList(), onChanged: onChange, isExpanded: true)));

  Widget _buildTimeBox(String text) => Container(width: 60.w, height: 60.h, decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(10.r)), child: Center(child: Text(text, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold))));

  Widget _buildAMPM(String text) {
    bool isSelected = selectedPeriod == text;
    return GestureDetector(
      onTap: () => setState(() => selectedPeriod = text),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(color: isSelected ? AppColors.mainGreen : const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(4.r)),
        child: Text(text, style: TextStyle(fontSize: 10.sp, color: isSelected ? Colors.white : Colors.grey, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildDayCircle(String day) {
    bool isSelected = selectedDays.contains(day);
    return GestureDetector(
      onTap: () => setState(() => isSelected ? selectedDays.remove(day) : selectedDays.add(day)),
      child: CircleAvatar(radius: 18.r, backgroundColor: isSelected ? const Color(0xFFE8F5E9) : const Color(0xFFF5F5F5), child: Text(day, style: TextStyle(fontSize: 12.sp, color: isSelected ? AppColors.mainGreen : Colors.grey, fontWeight: FontWeight.bold))),
    );
  }
}
