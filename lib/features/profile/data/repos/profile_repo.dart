import '../models/user_model.dart';

class ProfileRepo {
  Future<UserModel> getUserProfile() async {
    // محاكاة طلب من السيرفر
    await Future.delayed(const Duration(seconds: 1));
    return UserModel.mock();
  }

  Future<void> updateProfile(UserModel user) async {
    // محاكاة تحديث البيانات
    await Future.delayed(const Duration(seconds: 1));
  }
}
