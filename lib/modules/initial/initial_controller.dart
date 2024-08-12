import 'package:get/get.dart';

import '../../infra/category_model.dart';

class InitialController extends GetxController {
  static final List<CategoryModel> categories = [
    CategoryModel(
      title: 'nature'.tr,
      icon: 'assets/icons/naturee.png',
    ),
    CategoryModel(
      title: 'adventure'.tr,
      icon: 'assets/icons/adventure.png',
    ),
    CategoryModel(
      title: 'hero'.tr,
      icon: 'assets/icons/hero.png',
    ),
    CategoryModel(
      title: 'planets'.tr,
      icon: 'assets/icons/planets.png',
    ),
    CategoryModel(
      title: 'animals'.tr,
      icon: 'assets/icons/animals.png',
    ),
    CategoryModel(
      title: 'religious'.tr,
      icon: 'assets/icons/bible.png',
    ),
  ];
}
