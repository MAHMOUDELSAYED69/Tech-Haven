part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {}

class AuthSignUpSuccess extends AuthState {}

class AuthOtpVerificationSuccess extends AuthState {}

class AuthOtpPending extends AuthState {}

class AuthAuthenticatedRequestSuccess extends AuthState {
  final dynamic data;

  AuthAuthenticatedRequestSuccess(this.data);
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}
