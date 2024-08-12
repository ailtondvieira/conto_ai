import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../modules/splash/splash_page.dart';
import '../routes/app_pages.dart';
import 'app_colors.dart';
import 'app_translation.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conto.Ai',
      themeMode: ThemeMode.light,
      theme: ThemeData(primaryColor: AppColors.primary),
      getPages: AppPages.pages,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: SplashPage.route,
    );
  }
}
