import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repos/profil2_repo.dart';
import 'profil2_state.dart';

class Profil2Cubit extends Cubit<Profil2State> {
  final Profil2Repo _profil2repo;
  Profil2Cubit(this._profil2repo) : super(Profil2Initial());

  void getUserProfile() async {
    emit(Profil2Loading());
    try {
      final user = await _profil2repo.getUserProfile();
      emit(Profil2Success(user));
    } catch (e) {
      emit(Profil2Error(e.toString()));
    }
  }

  void changePassword({required String oldPassword, required String newPassword}) async {
    emit(ChangePasswordLoading());
    try {
      await _profil2repo.changePassword(oldPassword, newPassword);
      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordError(e.toString()));
    }
  }

  void deleteAccount() async {
    try {
      await _profil2repo.deleteAccount();
      // هنا ممكن نضيف حالة نجاح للحذف أو ننتقل لصفحة تسجيل الدخول
    } catch (e) {
      // التعامل مع الخطأ
    }
  }
}
