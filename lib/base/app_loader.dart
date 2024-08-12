import 'package:get/get.dart';

mixin AppLoader on GetxController {
  bool isLoading = false;

  void changeLoading(bool newValue) {
    isLoading = newValue;
    update();
  }
}
