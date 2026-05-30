import 'package:flutter_bloc/flutter_bloc.dart';
import 'profil2_state.dart';
import '../data/models/user_profile_model.dart';

class Profil2Cubit extends Cubit<Profil2State> {
  Profil2Cubit() : super(Profil2Initial());

  void getUserProfile() {
    emit(Profil2Loading());
    // محاكاة جلب البيانات
    Future.delayed(const Duration(seconds: 1), () {
      final user = UserProfileModel(
        firstName: 'Ahmed',
        lastName: 'Mostafa',
        phoneNumber: '+20 01012345678',
        email: 'Ahmed.Mostafa@email.com',
        gender: 'Male',
      );
      emit(Profil2Success(user));
    });
  }

  void changePassword({required String oldPassword, required String newPassword}) {
    emit(ChangePasswordLoading());
    // محاكاة تغيير كلمة المرور
    Future.delayed(const Duration(seconds: 2), () {
      if (newPassword.length >= 8) {
        emit(ChangePasswordSuccess());
      } else {
        emit(ChangePasswordError('Password must be at least 8 characters long.'));
      }
    });
  }

  void deleteAccount() {
    // منطق حذف الحساب
  }
}
