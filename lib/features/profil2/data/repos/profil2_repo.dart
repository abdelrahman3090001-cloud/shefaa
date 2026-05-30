import '../models/user_profile_model.dart';

class Profil2Repo {
  Future<UserProfileModel> getUserProfile() async {
    // محاكاة جلب البيانات من الـ API
    await Future.delayed(const Duration(seconds: 1));
    return UserProfileModel(
      firstName: 'Ahmed',
      lastName: 'Mostafa',
      phoneNumber: '+20 01012345678',
      email: 'Ahmed.Mostafa@email.com',
      gender: 'Male',
    );
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    // محاكاة عملية تغيير كلمة المرور
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> deleteAccount() async {
    // محاكاة حذف الحساب
    await Future.delayed(const Duration(seconds: 1));
  }
}
