import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech_haven/utils/constants/routes.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  static const int initialTime = 120; // 2 minutes in seconds
  int _remainingTime = initialTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
        _navigateToLoginScreen();
      }
    });
  }

  String get _formattedTime {
    final minutes = (_remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _navigateToLoginScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, RouteManager.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _formattedTime,
        style: context.textTheme.bodyLarge?.copyWith(color: ColorManager.red),
      ),
    );
  }
}
