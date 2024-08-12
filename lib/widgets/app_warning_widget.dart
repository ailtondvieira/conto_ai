import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWarningWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? tryAgain;

  const AppWarningWidget({
    super.key,
    this.tryAgain,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/finishedd.png',
        ),
        const SizedBox(height: 15),
        Text(
          text ?? 'end_history'.tr,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
