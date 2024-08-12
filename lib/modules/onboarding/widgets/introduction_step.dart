import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/app_colors.dart';
import '../onboarding_controller.dart';

class IntroductionStep extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  final int step;
  final Widget? widgetOptional;

  const IntroductionStep({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.step,
    this.widgetOptional,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Image.asset(
            imageUrl,
            height: MediaQuery.sizeOf(context).height * 0.4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundDark,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  widgetOptional != null ? 15 : 0,
                ),
                child: widgetOptional,
              ),
              const SizedBox(height: 8),
              Text(
                subTitle,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}

class CircleStepWidget extends StatelessWidget {
  final int step;

  const CircleStepWidget({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (control) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                step == control.selectedPage ? AppColors.primary : Colors.grey,
          ),
        );
      },
    );
  }
}
