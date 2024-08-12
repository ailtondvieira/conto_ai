import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_button_widget.dart';

class AppErrorWidget extends StatelessWidget {
  final String text;
  final VoidCallback? tryAgain;

  const AppErrorWidget({
    super.key,
    this.tryAgain,
    this.text = 'Aconteceu um erro, tente de novo.',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/errorr.png',
        ),
        const SizedBox(height: 15),
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (tryAgain != null)
          Column(
            children: [
              const SizedBox(height: 25),
              AppButtonDefault(
                text: 'try_again'.tr,
                onPressed: tryAgain,
              ),
            ],
          )
      ],
    );
  }
}
