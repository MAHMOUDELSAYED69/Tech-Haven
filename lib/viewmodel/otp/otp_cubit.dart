import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tech_haven/data/apis/otp_api.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  Future<void> verifyOtp(
      {required String email, required String otpCode}) async {
    emit(OtpLoading());
    try {
      final response = await OtpService.verifyOtp(email, otpCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(OtpSuccess());
      } else {
        emit(OtpError(response.data['message'] ?? 'Unknown error'));
      }
    } catch (err) {
      if (err is DioException) {
        log('Error: ${err.response?.data}');
        emit(OtpError(err.response?.data['message'] ??
            'Failed to verify OTP, Try Again'));
      } else {
        log('Error: $err');
        emit(OtpError('Failed to verify OTP, Try Again'));
      }
    }
  }
}
