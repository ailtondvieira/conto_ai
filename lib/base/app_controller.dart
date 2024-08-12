import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final List<Map> locales = [
    {'name': 'English', 'locale': const Locale('en', 'US')},
    {'name': 'Português', 'locale': const Locale('pt', 'BR')}
  ];

  Future<void> updateLocale(Locale locale) async {
    Future.delayed(const Duration(milliseconds: 200), () {
      Get.updateLocale(locale);
    });
  }
}
