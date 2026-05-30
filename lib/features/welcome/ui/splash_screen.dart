import 'package:flutter/material.dart';import 'package:video_player/video_player.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/videos/Video39.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.setLooping(false);

    _controller.addListener(() {
      if (_controller.value.isInitialized &&
          _controller.value.position >= _controller.value.duration) {
        _navigateToNext();
      }
    });
  }

  void _navigateToNext() {
    if (mounted) {
      Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.epGreen,
      body: _controller.value.isInitialized
          ? Center(
        child: SizedBox(
          // التحكم في الحجم هنا
          width: 850.w,
          height: 850.h,
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        ),
      )
          : const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
} // <--- تأكد من وجود هذا القوس لإغلاق الكلاس