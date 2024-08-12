import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

import 'base/app_controller.dart';
import 'base/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Gemini.init(apiKey: 'AIzaSyCOgxsAxGEWgu7S4u8fWRyhBvzCuAE5_Ic');

  Get.put(AppController(), permanent: true);
  
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(const AppWidget());
}
