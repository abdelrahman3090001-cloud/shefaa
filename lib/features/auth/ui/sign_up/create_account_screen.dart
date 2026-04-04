import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_header.dart';
import '../../../../core/widgets/custom-text_form_field.dart';
import '../../../../core/routes/routes.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  int selectedType = 0; // 0: Patient, 1: Guardian
  DateTime? _selectedDate;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.mainGreen,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _mockNextStep() async {
    if (formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select your Date of Birth'), backgroundColor: Colors.orange),
        );
        return;
      }
      
      setState(() => isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => isLoading = false);
      
      if (!mounted) return;
      Navigator.pushNamed(context, Routes.signUpPatientScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AppHeader(
                child: Text(
                  'Create account',
                  style: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.h),
              _buildUserTypeToggle(),
              SizedBox(height: 10.h),
              Text(
                selectedType == 0 ? 'Patient' : 'Guardian',
                style: TextStyle(color: AppColors.mainGreen, fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('First Name'),
                    CustomTextFormField(
                      controller: firstNameController,
                      hintText: 'Your First Name',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 15.h),
                    _buildLabel('Last Name'),
                    CustomTextFormField(
                      controller: lastNameController,
                      hintText: 'Your Last Name',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 15.h),
                    _buildLabel('Phone Number'),
                    CustomTextFormField(
                      controller: phoneController,
                      hintText: 'Enter your Phone number',
                      validator: (v) => v!.length < 10 ? 'Invalid phone' : null,
                    ),
                    SizedBox(height: 15.h),
                    _buildLabel('Date of Birth'),
                    GestureDetector(
                      onTap: _pickDate,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDateBox(_selectedDate == null ? 'DD' : _selectedDate!.day.toString().padLeft(2, '0')),
                          _buildDateBox(_selectedDate == null ? 'MM' : _selectedDate!.month.toString().padLeft(2, '0')),
                          _buildDateBox(_selectedDate == null ? 'YYYY' : _selectedDate!.year.toString()),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    isLoading 
                      ? const Center(child: CircularProgressIndicator(color: AppColors.mainGreen))
                      : AppButton(
                          title: 'Continue',
                          onTap: _mockNextStep,
                        ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ", style: TextStyle(fontSize: 14.sp)),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, Routes.loginScreen),
                            child: Text(
                              "Log in",
                              style: TextStyle(color: AppColors.mainGreen, fontWeight: FontWeight.bold, fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserTypeToggle() {
    return Container(
      width: 160.w,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1B5E20),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(2, (index) {
          return GestureDetector(
            onTap: () => setState(() => selectedType = index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: selectedType == index ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Image.asset(
                index == 0 ? 'assets/images/User-4.png' : 'assets/images/Users-4.png',
                height: 25.h,
                width: 25.w,
                color: selectedType == index ? const Color(0xFF1B5E20) : Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(text, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  Widget _buildDateBox(String value) {
    return Container(
      width: 95.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20.sp),
        ],
      ),
    );
  }
}
