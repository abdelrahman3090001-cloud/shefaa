import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/core/widgets/dependent_selector_bottom_sheet.dart';
import 'package:shefaa/features/guardian_home_screen/ui/widgets/guardian_widgets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_bottom_nav_bar2.dart';
import '../cubit/dependent_appointments_cubit.dart';
import '../cubit/dependent_appointments_state.dart';

class DependentAppointmentsScreen extends StatefulWidget {
  const DependentAppointmentsScreen({super.key});

  @override
  State<DependentAppointmentsScreen> createState() => _DependentAppointmentsScreenState();
}

class _DependentAppointmentsScreenState extends State<DependentAppointmentsScreen> {
  // كـ Software Engineer: قمنا بإدارة حالة الشخص المختار هنا لضمان تفاعلية الصفحة بالكامل
  String selectedDependent = 'Sara Ahmed';
  final List<String> dependents = [
    'Sara Ahmed',
    'Mostafa Mohamed',
    'Rahma Mahmoud',
    'Karim Ahmed'
  ];

  @override
  Widget build(BuildContext context) {
    // البيانات الوهمية للمواعيد حسب الصورة (التي سيتم جلبها لاحقاً من الـ API)
    final List<Map<String, dynamic>> appointments = [
      {
        'doctor': 'Doctor Mohamed Refaat',
        'specialization': 'Orthopedic',
        'location': 'Future Life Clinics',
        'time': '7:45 PM',
        'day': 'Thursday',
        'date': '23',
        'month': 'Nov',
        'status': 'Confirmed',
        'statusColor': Colors.green,
      },
      {
        'doctor': 'Doctor Mohamed Refaat',
        'specialization': 'Orthopedic',
        'location': 'Future Life Clinics',
        'time': '7:45 PM',
        'day': 'Thursday',
        'date': '25',
        'month': 'Dec',
        'status': 'Pending',
        'statusColor': Colors.orange,
      },
      {
        'doctor': 'Doctor Mohamed Refaat',
        'specialization': 'Orthopedic',
        'location': 'Future Life Clinics',
        'time': '7:45 PM',
        'day': 'Thursday',
        'date': '15',
        'month': 'Jan',
        'status': 'Canceled',
        'statusColor': Colors.red,
      },
    ];

    return BlocProvider(
      create: (context) => DependentAppointmentsCubit()..getAppointments(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFB),
        body: Column(
          children: [
            // 1. Header مستطيل أخضر "Custom" ثابت كما في التصميم
            Container(
              width: double.infinity,
              height: 110.h,
              padding: EdgeInsets.only(top: 40.h),
              decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  AppColors.NpGreen,
                  AppColors.mainGreen,
                ],
              ),
              ),
                child: Center(
                child: Text(
                  'Dependent Appointments',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: BlocBuilder<DependentAppointmentsCubit, DependentAppointmentsState>(
                builder: (context, state) {
                  if (state is DependentAppointmentsLoading) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
                  }
                  
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        // زر التبديل بين التابعين مربوط بالـ Bottom Sheet الموحد في الـ core
                        UserSwitcher(
                          userName: selectedDependent,
                          onTap: () {
                            DependentSelectorBottomSheet.show(
                              context,
                              dependents: dependents,
                              selectedDependent: selectedDependent,
                              onDependentSelected: (name) {
                                setState(() {
                                  selectedDependent = name;
                                });
                              },
                            );
                          },
                        ),
                        SizedBox(height: 25.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            'Appointments',
                            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        // قائمة المواعيد
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: appointments.length,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemBuilder: (context, index) {
                            final appointment = appointments[index];
                            return _buildAppointmentItem(appointment);
                          },
                        ),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        // إضافة البار الأخضر "Custom" الخاص بصفحات المراقب
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBottomNavBar2(
              currentIndex: 1, // أيقونة المواعيد (الثانية) هي المختارة
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, Routes.guardianHomeScreen);
                    break;
                  case 2:
                    Navigator.pushNamed(context, Routes.gpsScreen);
                    break;
                  case 4:
                    Navigator.pushNamed(context, Routes.accountScreen);
                    break;
                }
              },
            ),
            SizedBox(height: 20.h), // العزل من تحت كما طلبت لضمان الشكل الجمالي
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentItem(Map<String, dynamic> appointment) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          // المربع الغامق للتاريخ
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xFF133B2C),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Text(appointment['month'], style: TextStyle(color: Colors.white, fontSize: 13.sp)),
                Text(appointment['date'], style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(width: 15.w),
          // تفاصيل الموعد
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appointment['doctor'], style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.mainGreen)),
                Text('(${appointment['specialization']})', style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 12.r, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(appointment['location'], style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 8.h),
                // الـ Status Badge مطابق للصورة
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: appointment['statusColor'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(radius: 3, backgroundColor: appointment['statusColor']),
                      SizedBox(width: 5.w),
                      Text(
                        appointment['status'],
                        style: TextStyle(fontSize: 10.sp, color: appointment['statusColor'], fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // الوقت واليوم
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(appointment['time'], style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              Text(appointment['day'], style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}









































