import 'package:get/get.dart';

import '../modules/initial/initial_controller.dart';
import '../modules/initial/initial_page.dart';
import '../modules/onboarding/onboarding_controller.dart';
import '../modules/onboarding/onboarding_page.dart';
import '../modules/splash/splash_page.dart';
import '../modules/story_teller/story_teller_controller.dart';
import '../modules/story_teller/story_teller_page.dart';

class AppPages {
  AppPages._();

  static List<GetPage> pages = [
    GetPage(
      name: SplashPage.route,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: OnboardingPage.route,
      page: () => const OnboardingPage(),
      binding: BindingsBuilder.put(() => OnboardingController()),
    ),
    GetPage(
      name: InitialPage.route,
      page: () => const InitialPage(),
      binding: BindingsBuilder.put(() => InitialController()),
    ),
    GetPage(
      name: StoryTellerPage.route,
      page: () => const StoryTellerPage(),
      binding: BindingsBuilder.put(() => StoryTellerController()),
    ),
  ];
}
