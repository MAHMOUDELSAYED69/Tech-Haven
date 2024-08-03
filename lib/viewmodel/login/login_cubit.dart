import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_haven/data/apis/login_api.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await LoginService().login(email, password);
      emit(LoginSuccess());
    } catch (err) {
      log(err.toString());
      emit(LoginError('$err, Try Again'));
    }
  }
}
