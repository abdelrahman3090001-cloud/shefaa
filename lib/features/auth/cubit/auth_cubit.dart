import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // كـ Software Engineer، قمت بتصحيح المناداة لتتوافق مع الكلاسات اليدوية (Stateless)
  AuthCubit() : super(const AuthInitial());

  // دالة تسجيل الدخول
  void login(String email, String password) async {
    emit(const AuthLoading());
    
    // محاكاة الاتصال بالسيرفر
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'admin@shefaa.com' && password == '123456') {
      emit(const AuthSuccess('Success'));
    } else {
      emit(const AuthError(error: 'Invalid Email or Password'));
    }
  }
}
