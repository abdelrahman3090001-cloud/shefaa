import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/onboarding_model.dart';
import 'widgets/onboarding_item.dart';
import 'widgets/welcome_screen.dart'; // استيراد شاشة الـ Welcome

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _onboardingData = [
    OnboardingModel(
      title: 'Member',
      description: 'Take full control of your health journey:',
      image: 'assets/images/splash.png',
      bulletPoints: [
        'Find & Book:Locate hospitals and pharmacies or book top doctors instantly.',
        'Medical Records: Securely upload and organize all your health documents in one place.',
        'Smart Reminders: Get automated notifications so you never miss a medication dose.',
      ],
    ),
    OnboardingModel(
      title: 'Caregiver',
      description: 'Stay connected and ensure their safety.',
      image: 'assets/images/splash.png',
      bulletPoints: [
        'Real-time Tracking: Monitor real-time location for constant peace of mind..',
        'AI Safety Alerts: Receive instant alerts if our AI detects health risks.',
        'Care Management: Seamlessly view appointments and manage prescriptions.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingItem(
                model: _onboardingData[index],
              );
            },
          ),
          Positioned(
            bottom: 40.h,
            left: 20.w,
            right: 20.w,
            child: SizedBox(
              height: 50.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 1. النقاط (Indicators) في المنتصف
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        height: 8.h,
                        width: _currentPage == index ? 24.w : 8.w,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFF2E7D32)
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                  ),

                  // 2. زر Skip في أقصى اليمين
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // كـ Software Engineer، ده الكود اللي بيخلي الزرار يتحرك:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
