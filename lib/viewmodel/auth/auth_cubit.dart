import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_haven/data/apis/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationWebService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      Map<String, dynamic> result = await _authService.login(email, password);
      if (result['user']['verified'] == true) {
        emit(AuthOtpPending());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> verifyOtp(String email, String otpCode, AuthRole role) async {
    emit(AuthLoading());
    try {
      await _authService.verifyOtp(email, otpCode, role);
      emit(AuthOtpVerificationSuccess());
      emit(AuthLoginSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    emit(AuthLoading());
    try {
      await _authService.signUp(name, email, password);
      emit(AuthSignUpSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> refreshAccessToken() async {
    emit(AuthLoading());
    try {
      await _authService.refreshAccessToken();
      emit(AuthAuthenticatedRequestSuccess(null));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    emit(AuthInitial());
  }

  Future<bool> checkLoginStatus() async {
    emit(AuthLoading());
    try {
      bool isLoggedIn = await _authService.checkLoginStatus();
      if (isLoggedIn) {
        emit(AuthLoginSuccess());
        return true;
      } else {
        emit(AuthInitial());
        return false;
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
      return false;
    }
  }
}
