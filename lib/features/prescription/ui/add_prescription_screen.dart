import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom-text_form_field.dart';

class AddPrescriptionScreen extends StatefulWidget {
  const AddPrescriptionScreen({super.key});

  @override
  State<AddPrescriptionScreen> createState() => _AddPrescriptionScreenState();
}

class _AddPrescriptionScreenState extends State<AddPrescriptionScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: Column(
        children: [
          // 1. Header
          Container(
            height: 110.h,
            width: double.infinity,
            color: AppColors.deepGreen,
            padding: EdgeInsets.only(top: 45.h, left: 15.w, right: 15.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios_new,
                      color: Colors.white, size: 20.r),
                ),
                const Spacer(),
                Text(
                  'Add Prescription',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const SizedBox(width: 25),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.r),
              child: Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Medicine Name'),
                    CustomTextFormField(
                      hintText: 'Enter medicine name',
                      controller: _nameController,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('Dosage'),
                              CustomTextFormField(
                                hintText: 'e.g. 2 Pills',
                                controller: _dosageController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('Frequency'),
                              CustomTextFormField(
                                hintText: 'Daily',
                                suffixIcon: Icon(Icons.keyboard_arrow_down,
                                    color: AppColors.gray),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildTimeBox('09'),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(':',
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                          _buildTimeBox('00'),
                          SizedBox(width: 15.w),
                          Column(
                            children: [
                              _buildAmPmBox('AM', true),
                              SizedBox(height: 5.h),
                              _buildAmPmBox('PM', false),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    _buildLabel('Duration'),
                    CustomTextFormField(
                      hintText: 'Total days',
                      controller: _durationController,
                    ),
                    SizedBox(height: 15.h),
                    Text('Most common',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.mainGreen,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        _buildDurationChip('5 days'),
                        SizedBox(width: 10.w),
                        _buildDurationChip('10 days'),
                        SizedBox(width: 10.w),
                        _buildDurationChip('30 days'),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    AppButton(
                      title: 'Add',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(text,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTimeBox(String text) {
    return Container(
      width: 70.w,
      height: 70.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(text,
          style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildAmPmBox(String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.mainGreen : Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.mainGreen),
      ),
      child: Text(text,
          style: TextStyle(
              color: isSelected ? Colors.white : AppColors.mainGreen,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildDurationChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(text, style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
    );
  }
}
