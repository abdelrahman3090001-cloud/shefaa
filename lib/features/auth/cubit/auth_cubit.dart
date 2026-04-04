import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  // دالة تسجيل الدخول
  void login(String email, String password) async {
    emit(const AuthLoading());
    
    // محاكاة الاتصال بالسيرفر (Software Engineer Tip: نضع تأخير بسيط لاختبار الـ Loading)
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'admin@shefaa.com' && password == '123456') {
      emit(const AuthSuccess());
    } else {
      emit(const AuthError(error: 'Invalid Email or Password'));
    }
  }
}
