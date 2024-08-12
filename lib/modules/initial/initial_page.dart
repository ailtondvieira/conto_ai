import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_card_widget.dart';
import '../story_teller/story_teller_page.dart';
import 'initial_controller.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  static const route = '/inicial';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo-pink.png',
          height: 125,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'title_initial'.tr,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: InitialController.categories.map(
                  (category) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(StoryTellerPage.route, arguments: category);
                      },
                      child: AppCardWidget(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              category.icon,
                              height: 65,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
