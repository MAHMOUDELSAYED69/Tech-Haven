import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/apis/signup_api.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    emit(SignUpLoading());
    try {
      await SignUpService.signUp(name, email, password);
      emit(SignUpSuccess());
    } catch (err) {
      log(err.toString());
      emit(SignUpError( '$err, Try Again'));
      // emit(SignUpError('Failed To SignUp, Try Again'));
    }
  }
}
