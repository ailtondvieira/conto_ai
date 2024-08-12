import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../initial/initial_page.dart';
import 'widgets/introduction_step.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  int selectedPage = 0;
  late final codeTextControl = TextEditingController();

  void changeSelectedPage(int newPage) {
    selectedPage = newPage;
    update();
  }

  void goNavigate(bool isToNext) {
    if (isToNext && (selectedPage + 2) > pages.length) {
      Get.offNamed(InitialPage.route);
      return;
    }
    pageController.animateToPage(
      isToNext ? ++selectedPage : --selectedPage,
      duration: const Duration(milliseconds: 1),
      curve: Curves.decelerate,
    );
    changeSelectedPage(pageController.page?.toInt() ?? selectedPage);
  }

  late final List<IntroductionStep> pages = [
    IntroductionStep(
      step: 1,
      title: 'title_onboarding1'.tr,
      subTitle: 'text_onboarding1'.tr,
      imageUrl: 'assets/images/onboarding2.png',
    ),
    IntroductionStep(
      step: 2,
      title: 'title_onboarding2'.tr,
      subTitle: 'text_onboarding2'.tr,
      imageUrl: 'assets/images/onboarding1.png',
    ),
  ];
}
