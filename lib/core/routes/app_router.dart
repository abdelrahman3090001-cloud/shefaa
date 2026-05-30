import 'package:flutter/material.dart';
import 'package:shefaa/core/routes/routes.dart';
import 'package:shefaa/features/auth/ui/sign_up/create_account_patient_screen.dart';
import 'package:shefaa/features/auth/ui/sign_up/create_account_screen.dart';
import 'package:shefaa/features/auth/ui/forgot_password/forgot_password_scrren.dart';
import 'package:shefaa/features/auth/ui/forgot_password/forgot_password2_screen.dart';
import 'package:shefaa/features/auth/ui/forgot_password/forgot_password3_screen.dart';
import 'package:shefaa/features/auth/ui/login_screen.dart';
import 'package:shefaa/features/home/ui/home_screen.dart';
import 'package:shefaa/features/gps/ui/gps_screen.dart';
import 'package:shefaa/features/gps/ui/facility_details_screen.dart';
import 'package:shefaa/features/gps/ui/bookmarked_services_screen.dart';
import 'package:shefaa/features/gps/data/models/facility_model.dart';
import 'package:shefaa/features/profil2/ui/add_dependent2-screen.dart';
import 'package:shefaa/features/profil2/ui/my_dependents_screen.dart';
import 'package:shefaa/features/profil2/ui/settings2_screen.dart';
import 'package:shefaa/features/profile/ui/account_screen.dart';
import 'package:shefaa/features/profile/ui/change_password_screen.dart';
import 'package:shefaa/features/profile/ui/settings_screen.dart';
import 'package:shefaa/features/welcome/ui/onboarding_screen.dart';
import 'package:shefaa/features/welcome/ui/widgets/welcome_screen.dart';
import 'package:shefaa/features/welcome/ui/splash_screen.dart';
import 'package:shefaa/features/appointments/ui/appointments_screen.dart';
import 'package:shefaa/features/find_doctor/ui/find_doctor_screen.dart';
import 'package:shefaa/features/find_doctor/ui/doctor_search_results_screen.dart';
import 'package:shefaa/features/find_doctor/ui/doctor_details_screen.dart';
import 'package:shefaa/features/find_doctor/ui/book_appointment_screen.dart';
import 'package:shefaa/features/find_doctor/ui/bookmarked_doctors_screen.dart';
import 'package:shefaa/features/find_doctor/data/models/doctor_model.dart';
import 'package:shefaa/features/prescription/ui/prescription_screen.dart';
import 'package:shefaa/features/medical history/ui/medical_history_screen.dart';
import 'package:shefaa/features/medical history/ui/medical_information_screen.dart';
import 'package:shefaa/features/guardian_home_screen/ui/guardian_home_screen.dart';
import 'package:shefaa/features/dependent_appointments2/ui/dependent_appointments_screen.dart';
import 'package:shefaa/features/real_time_location2/ui/real_time_location2_screen.dart';
import 'package:shefaa/features/dependent_medical_history2/ui/dependent_medical_history2_screen.dart';
import 'package:shefaa/features/dependent_perscriptions2/ui/dependent_perscriptions2_screen.dart';
import 'package:shefaa/features/profil2/ui/account2_screen.dart';
import 'package:shefaa/features/profil2/ui/change_password2_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return _buildRoute(const SplashScreen());

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

      case Routes.gpsScreen:
        return _buildRoute(const GpsScreen());

      case Routes.facilityDetailsScreen:
        final facility = settings.arguments as FacilityModel;
        return _buildRoute(FacilityDetailsScreen(facility: facility));

      case Routes.bookmarkedServicesScreen:
        final facilities = settings.arguments as List<FacilityModel>;
        return _buildRoute(BookmarkedServicesScreen(facilities: facilities));

      // Profile Routes
      case Routes.accountScreen:
        return _buildRoute(const AccountScreen());
      
      case Routes.settingsScreen:
        return _buildRoute(const SettingsScreen());

      case Routes.changePasswordScreen:
        return _buildRoute(const ChangePasswordScreen());

      // Profil2 Routes
      case Routes.account2Screen:
        return _buildRoute(const Account2Screen());
      
      case Routes.changePassword2Screen:
        return _buildRoute(const ChangePassword2Screen());

      case Routes.settings2Screen:
        return _buildRoute(const Settings2Screen());
      
      case Routes.myDependentsScreen:
        return _buildRoute(const MyDependentsScreen());

      case Routes.addDependentScreen:
        return _buildRoute(const AddDependent2Screen());

      // Appointments Routes
      case Routes.appointmentsScreen:
        return _buildRoute(const AppointmentsScreen());

      // Find Doctor Routes
      case Routes.findDoctorScreen:
        return _buildRoute(const FindDoctorScreen());
      
      case Routes.doctorSearchResultsScreen:
        return _buildRoute(const DoctorSearchResultsScreen());
      
      case Routes.doctorDetailsScreen:
        final doctor = settings.arguments as DoctorModel;
        return _buildRoute(DoctorDetailsScreen(doctor: doctor));
      
      case Routes.bookAppointmentScreen:
        final doctor = settings.arguments as DoctorModel;
        return _buildRoute(BookAppointmentScreen(doctor: doctor));
      
      case Routes.bookmarkedDoctorsScreen:
        return _buildRoute(const BookmarkedDoctorsScreen());

      // Prescription Routes
      case Routes.prescriptionScreen:
        return _buildRoute(const PrescriptionScreen());

      // Medical History Routes
      case Routes.medicalHistoryScreen:
        return _buildRoute(const MedicalHistoryScreen());
      case Routes.medicalInformationScreen:
        return _buildRoute(const MedicalInformationScreen());

      // Guardian Routes
      case Routes.guardianHomeScreen:
        return _buildRoute(const GuardianHomeScreen());
      
      case Routes.dependentAppointments2Screen:
        return _buildRoute(const DependentAppointmentsScreen());
      
      case Routes.realTimeLocation2Screen:
        return _buildRoute(const RealTimeLocation2Screen());

      case Routes.dependentMedicalHistory2Screen:
        return _buildRoute(const DependentMedicalHistory2Screen());
      
      case Routes.dependentPrescriptions2Screen:
        return _buildRoute(const DependentPrescriptions2Screen());

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
