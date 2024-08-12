import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/app_colors.dart';
import '../onboarding_controller.dart';
import 'introduction_step.dart';

class OnboardingPageStructure extends StatelessWidget {
  final List<IntroductionStep>? introductionList;
  final Color? backgroudColor;
  final Color? foregroundColor;
  final TextStyle? skipTextStyle;

  final Function()? onTapSkipButton;
  
  const OnboardingPageStructure({
    super.key,
    this.introductionList,
    this.onTapSkipButton,
    this.backgroudColor,
    this.foregroundColor,
    this.skipTextStyle = const TextStyle(fontSize: 18),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                      AppColors.backgroundDark.withOpacity(0.8),
                    ),
                  ),
                  onPressed: onTapSkipButton,
                  child: Text(
                    'skip'.tr,
                    style: skipTextStyle,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GetBuilder<OnboardingController>(
              builder: (control) {
                return PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: control.pageController,
                  onPageChanged: control.changeSelectedPage,
                  children: introductionList!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
