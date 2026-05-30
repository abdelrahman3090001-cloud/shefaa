import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../data/models/doctor_model.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final DoctorModel doctor;
  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  int selectedLocationIndex = 1;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 1. Header
          Container(
            height: 110.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.deepGreen,
                  AppColors.mainGreen,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: EdgeInsets.only(top: 45.h, left: 15.w, right: 15.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.doctorSearchResultsScreen),
                  child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.r),
                ),
                const Spacer(flex: 2),
                Text(
                  'Find Doctors',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                const Spacer(flex: 2),
                InkWell(
                  onTap: () {
                    // زر المشاركة
                  },
                  child: ImageIcon(
                    const AssetImage('assets/images/img_6.png'),
                    size: 22.r,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 15.w),
                InkWell(
                  onTap: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                  child: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.white,
                    size: 22.r,
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. كارت بيانات الطبيب
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
                          width: 80.r,
                          height: 80.r,
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
                              Text(widget.doctor.name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4.h),
                              Text(
                                "General Surgery Specialist - Fellow of the Royal College of Surgeons of London",
                                style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600, height: 1.3),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  Text(widget.doctor.rating, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
                                  Icon(Icons.star, color: Colors.amber, size: 14.r),
                                  SizedBox(width: 5.w),
                                  Text("Overall Rating from 547 visitors", style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20.h),
                  // 3. الفروع
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildChip("El- Matareya", 0),
                        _buildChip("El- Shorouk", 1),
                        _buildChip("Heliopolis", 2),
                        _buildChip("Nasr City", 3),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20.h),
                  // 4. الرسوم
                  _buildIconText('assets/images/img_5.png', "Appointment Fees 500 EGP"),
                  
                  SizedBox(height: 25.h),
                  // 5. العنوان التفصيلي مع الخطوط
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade200, width: 1),
                        bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.grey, size: 20.r),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text("El Shorouk: mekay mall el shorouk 7th district", 
                            style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade700)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0055FF),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.directions, color: Colors.white, size: 14.r),
                              SizedBox(width: 4.w),
                              Text("Get Directions", style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40.h),
                  Center(
                    child: Text('Choose your appointment', 
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: AppColors.mainGreen)),
                  ),
                  SizedBox(height: 20.h),

                  // 6. جدول المواعيد
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios, size: 16.r, color: AppColors.mainGreen),
                      Expanded(child: _buildApptCard("Today", "3:00 PM\nTo\n10:00 PM", true)),
                      Expanded(child: _buildApptCard("Tomorrow", "5:00 PM\nTo\n7:45 PM", true)),
                      Expanded(child: _buildApptCard("Tue 07/24", "\nNo\nAvailable\nSlots", false)),
                      Icon(Icons.arrow_forward_ios, size: 16.r, color: AppColors.mainGreen),
                    ],
                  ),
                  
                  SizedBox(height: 15.h),
                  Center(
                    child: Text("Reservation required, first come, first served", 
                      style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
        child: AppBottomNavBar(
          currentIndex: 1,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
            }
          },
        ),
      ),
    );
  }

  Widget _buildChip(String text, int index) {
    bool isSelected = selectedLocationIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLocationIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.deepGreen : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: isSelected ? Colors.transparent : AppColors.mainGreen),
        ),
        child: Text(text, style: TextStyle(color: isSelected ? Colors.white : AppColors.mainGreen, fontSize: 11.sp, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildIconText(dynamic icon, String text) {
    return Row(
      children: [
        icon is String 
          ? Image.asset(icon, width: 20.r, height: 20.r)
          : Icon(icon as IconData, color: Colors.grey, size: 20.r),
        SizedBox(width: 8.w),
        Text(text, style: TextStyle(fontSize: 12.sp, color: Colors.black87, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildApptCard(String day, String time, bool isAvailable) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
            ),
            child: Text(day, textAlign: TextAlign.center, style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 60.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(time, textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 9.sp, color: isAvailable ? Colors.black87 : Colors.grey, height: 1.1)),
          ),
          InkWell(
            onTap: isAvailable ? () {
              Navigator.pushNamed(context, Routes.bookAppointmentScreen, arguments: widget.doctor);
            } : null,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: isAvailable ? AppColors.deepGreen : const Color(0xFFD0D0D0),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.r)),
              ),
              child: Text("Book", textAlign: TextAlign.center, 
                style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
