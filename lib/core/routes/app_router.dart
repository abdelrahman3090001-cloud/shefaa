import 'package:flutter/material.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/features/auth/ui/sign_up/create_account_patient_screen.dart';
import 'package:shefaa/features/auth/ui/sign_up/create_account_screen.dart';
import 'package:shefaa/features/auth/ui/forgot_password/forgot_password_scrren.dart';
import 'package:shefaa/features/auth/ui/forgot_password/forgot_password2_screen.dart';
import 'package:shefaa/features/auth/ui/forgot_password/forgot_password3_screen.dart';
import 'package:shefaa/features/auth/ui/login_screen.dart';
import 'package:shefaa/features/home/ui/home_screen.dart';
import 'package:shefaa/features/welcome/ui/onboarding_screen.dart';
import 'package:shefaa/features/welcome/ui/widgets/welcome_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return _buildRoute(const OnboardingScreen());

      case Routes.welcomeScreen:
        return _buildRoute(const WelcomeScreen());

      case Routes.loginScreen:
        return _buildRoute(const LoginScreen());

      case Routes.signUpScreen:
        return _buildRoute(const CreateAccountScreen());

      case Routes.signUpPatientScreen:
        return _buildRoute(const CreateAccountPatientScreen());

      case Routes.forgetPassword:
        return _buildRoute(const ForgotPasswordScreen());

      case Routes.verifyCode:
        return _buildRoute(const ForgotPassword2Screen());

      case Routes.resetPassword:
        return _buildRoute(const ForgotPassword3Screen());

      case Routes.homeScreen:
        return _buildRoute(const HomeScreen());

      default:
        return _buildRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  MaterialPageRoute _buildRoute(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
