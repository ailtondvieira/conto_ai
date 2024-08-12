import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/ia.json',
      height: 250,
    );
  }
}
