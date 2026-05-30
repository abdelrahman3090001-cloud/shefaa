import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/core/widgets/dependent_selector_bottom_sheet.dart';
import '../cubit/guardian_home_cubit.dart';
import '../cubit/guardian_home_state.dart';
import 'widgets/guardian_widgets.dart';
import 'widgets/guardian_profile_drawer.dart';
import 'widgets/guardian_notifications_drawer.dart';
import '../../home/ui/widgets/home_widgets.dart';
import '../../../../core/widgets/appointment_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/app_bottom_nav_bar2.dart';
import '../../../../core/theming/app_colors.dart';

class GuardianHomeScreen extends StatefulWidget {
  const GuardianHomeScreen({super.key});

  @override
  State<GuardianHomeScreen> createState() => _GuardianHomeScreenState();
}

class _GuardianHomeScreenState extends State<GuardianHomeScreen> {
  // كـ Software Engineer: قمنا بإضافة ScaffoldKey للتحكم في فتح الـ Drawers من الهيدر
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedDependent = 'Sara Ahmed';
  final List<String> dependents = [
    'Sara Ahmed',
    'Mostafa Mohamed',
    'Rahma Mahmoud',
    'Karim Ahmed'
  ];

  @override
  Widget build(BuildContext context) {
    // البيانات التي ستتغير بناءً على الاختيار
    final locationData = {
      'name': selectedDependent,
      'lastSeen': 'Live 2m ago',
    };

    final List<Map<String, dynamic>> appointments = [
      {
        'doctor': 'Doctor Mohamed Refaat',
        'specialization': 'Orthopedic',
        'location': 'Future Life Clinics',
        'time': '7:45 PM',
        'day': 'Thursday',
        'date': '23',
        'month': 'Nov',
        'status': 'Confirmed'
      }
    ];

    return BlocProvider(
      create: (context) => GuardianHomeCubit()..getGuardianHomeData(),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFFFBFBFB),
        // ربط الـ Drawers الجديدة
        drawer: const GuardianProfileDrawer(),
        endDrawer: const GuardianNotificationsDrawer(),
        body: BlocBuilder<GuardianHomeCubit, GuardianHomeState>(
          builder: (context, state) {
            if (state is GuardianHomeLoading) {
              return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
            } else if (state is GuardianHomeSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GuardianHeader(
                      onProfileTap: () => _scaffoldKey.currentState!.openDrawer(),
                      onNotificationsTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                    ),
                    SizedBox(height: 10.h),
                    // عند الضغط هنا يفتح الـ Bottom Sheet الجاهز في الـ core
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
                    SizedBox(height: 10.h),
                    RealTimeLocation(lastSeen: locationData['lastSeen']!),
                    SizedBox(height: 15.h),
                    const SectionHeader(title: 'Appointments'),
                    SizedBox(height: 8.h),
                    AppointmentCard(
                      doctorName: appointments[0]['doctor'],
                      specialization: appointments[0]['specialization'],
                      location: appointments[0]['location'],
                      time: appointments[0]['time'],
                      day: appointments[0]['day'],
                      month: appointments[0]['month'],
                      date: appointments[0]['date'],
                      onTap: () {},
                    ),
                    const MedicalSummary(),
                    SizedBox(height: 8.h),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBottomNavBar2(
              currentIndex: 0,
              onTap: (index) {
                // التنقل بين الصفحات يتم هنا
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
