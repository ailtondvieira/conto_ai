import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../base/app_colors.dart';
import '../../widgets/app_button_widget.dart';
import '../initial/initial_page.dart';
import 'onboarding_controller.dart';
import 'widgets/introduction_step.dart';
import 'widgets/onboarding_page_structure.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  static const route = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Material(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: OnboardingPageStructure(
                  introductionList: controller.pages,
                  onTapSkipButton: () {
                    Get.offNamed(InitialPage.route);
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(color: AppColors.primary.withOpacity(0.1)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppButtonDefault(
                        width: 100,
                        onPressed: () {
                          controller.goNavigate(false);
                        },
                        text: 'back'.tr,
                      ),
                      const Row(
                        children: [
                          CircleStepWidget(step: 0),
                          CircleStepWidget(step: 1),
                        ],
                      ),
                      AppButtonDefault(
                        width: 100,
                        buttonDark: true,
                        onPressed: () {
                          controller.goNavigate(true);
                        },
                        text: 'next'.tr,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
