import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';
import '../data/models/user_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileInitial());

  void getUserProfile() async {
    emit(const ProfileLoading());
    
    // محاكاة جلب البيانات من السيرفر
    await Future.delayed(const Duration(seconds: 1));
    
    try {
      final user = UserModel.mock();
      emit(ProfileSuccess(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  void updateProfile(UserModel updatedUser) async {
    emit(const ProfileLoading());
    // محاكاة تحديث البيانات
    await Future.delayed(const Duration(seconds: 1));
    emit(ProfileSuccess(updatedUser));
  }
}
