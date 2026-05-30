import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../data/models/doctor_model.dart';

class BookAppointmentScreen extends StatelessWidget {
  final DoctorModel doctor;
  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 1. Header مطابق للصورة (أخضر غامق، سهم، عنوان Book Appointment)
          Container(
            height: 110.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.mainGreen,
                  AppColors.deepGreen,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: EdgeInsets.only(top: 45.h, left: 15.w, right: 15.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.r),
                ),
                const Spacer(),
                Text(
                  'Book Appointment',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const SizedBox(width: 25), // لموازنة سهم الرجوع
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. كارت بيانات الطبيب المختصر
                  Container(
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.grey.shade100),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70.r,
                          height: 70.r,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(doctor.name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4.h),
                              Text(
                                "General Surgery Specialist - Fellow of the Royal College of Surgeons of London",
                                style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600, height: 1.3),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  Text(doctor.rating, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
                                  Icon(Icons.star, color: Colors.amber, size: 14.r),
                                  SizedBox(width: 5.w),
                                  Text("Overall Rating from 547 visitors", style: TextStyle(fontSize: 9.sp, color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 25.h),
                  // 3. فورم البيانات (Name)
                  Text("Name", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.h),
                  _buildTextField("Ahmed Mostafa"),
                  
                  SizedBox(height: 20.h),
                  // 4. فورم البيانات (Phone Number)
                  Text("Phone Number", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.h),
                  _buildTextField("+20 1012345678"),

                  SizedBox(height: 25.h),
                  // 5. تفاصيل الحجز النهائية
                  _buildIconText(
                      Image.asset('assets/images/img_5.png', width: 22.r, height: 22.r),
                      "Appointment Fees 500 EGP",
                      subText: "Cash at the Clinic"),
                  SizedBox(height: 25.h),
                  _buildIconText(Icons.calendar_today_outlined, "5:00 PM - 7:45 PM", subText: "Monday 06 April"),
                  SizedBox(height: 25.h),
                  _buildIconText(Icons.location_on_outlined, "El Shorouk: mekay mall el shorouk 7th district"),

                  SizedBox(height: 40.h),
                  // 6. زر التأكيد (Confirm)
                  AppButton(
                    title: 'Confirm',
                    onTap: () => _showSuccessDialog(context),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 13.sp, color: Colors.black87),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.mainGreen),
          borderRadius: BorderRadius.circular(44.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.mainGreen, width: 1.5),
          borderRadius: BorderRadius.circular(44.r),
        ),
        fillColor: const Color(0xFFFBFBFB),
        filled: true,
      ),
    );
  }

  Widget _buildIconText(dynamic icon, String title, {String? subText}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 22.r,
          height: 22.r,
          child: icon is IconData 
              ? Icon(icon, color: Colors.grey, size: 22.r) 
              : (icon is Widget ? icon : const SizedBox.shrink()),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade700, fontWeight: FontWeight.w500)),
              if (subText != null)
                Text(subText, style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700)),
            ],
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: AppColors.mainGreen, size: 70.r),
            SizedBox(height: 20.h),
            Text('Success!', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),
            Text('Your appointment has been successfully booked.', textAlign: TextAlign.center, style: TextStyle(fontSize: 14.sp, color: AppColors.gray)),
            SizedBox(height: 30.h),
            AppButton(
              title: 'Back to Home',
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
