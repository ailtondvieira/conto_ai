import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_error_widget.dart';
import '../../widgets/app_loading_widget.dart';
import '../../widgets/app_warning_widget.dart';
import 'story_teller_controller.dart';

class StoryTellerPage extends StatelessWidget {
  static const route = '/story-teller';

  const StoryTellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'app_bar_storyteller'.tr,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<StoryTellerController>(
            builder: (control) {
              if (control.isLoading) {
                return const AppLoadingWidget();
              }

              if (control.choices.isEmpty || control.storyText.isEmpty) {
                return AppErrorWidget(
                  text: 'error_build_story'.tr,
                  tryAgain: control.tryAgain,
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    control.storyText,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (control.isChoicesVisible && !control.finished) ...[
                    const SizedBox(height: 20),
                    Text(
                      'choice_option'.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ...List.generate(
                      control.choices.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          ),
                          child: IconButton.filledTonal(
                            onPressed: () => control.onChoiceSelected(index),
                            icon: Text(
                              control.choices[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                  if (control.finished) const AppWarningWidget(),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: GetBuilder<StoryTellerController>(
        builder: (control) {
          return FloatingActionButton.extended(
            onPressed: () {
              control.flutterTts.stop();
            },
            label: const Icon(Icons.music_off_outlined),
          );
        },
      ),
    );
  }
}
