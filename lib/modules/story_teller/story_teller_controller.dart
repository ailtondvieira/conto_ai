import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../base/app_constants.dart';
import '../../base/app_loader.dart';

class StoryTellerController extends GetxController with AppLoader {
  late FlutterTts flutterTts;
  String storyText = '';
  bool isChoicesVisible = false;
  List<String> choices = [];
  List<String> allStory = [];
  int lastChoice = 0;
  bool finished = false;

  @override
  void onInit() {
    super.onInit();
    flutterTts = FlutterTts();
    startChat();
  }

  @override
  void onClose() {
    super.onClose();
    flutterTts.stop();
  }

  Future<void> tryAgain() async {
    if (allStory.isEmpty) {
      await startChat();
    } else {
      onChoiceSelected(lastChoice);
    }
  }

  Future<void> startChat() async {
    try {
      changeLoading(true);

      var currentLocale = Get.locale ?? Get.deviceLocale;
      String promptPt =
          'Crie uma história do gênero ${Get.arguments} com 3 opções para escolher e consequentemente definir o futuro da história.\n'
          'Use as seguintes regras.\n'
          '${AppConstants.promptDefaultPt}';

      String promptEn =
          'Create a story in the ${Get.arguments} genre with 3 options to choose from and consequently define the future of the story.\n'
          'Use the following rules.\n'
          '${AppConstants.promptDefaultEn}';

      String? selectedPrompt;
      if (currentLocale?.languageCode == 'en') {
        selectedPrompt = promptEn;
      } else {
        selectedPrompt = promptPt;
      }

      final response = await Gemini.instance.chat([
        Content(parts: [Parts(text: selectedPrompt)])
      ]);

      var data = response?.content?.parts?.first.text ?? '';
      updateStoryAndChoices(data);
      if (choices.isNotEmpty && storyText.isNotEmpty) {
        flutterTts.speak(storyText);
      }
    } finally {
      changeLoading(false);
    }
  }

  Future<void> continueChat(int index) async {
    try {
      changeLoading(true);

      lastChoice = index;
      String? lastChoiceS = '';

      if (choices.isNotEmpty) {
        lastChoiceS = choices[index];
        allStory.add(
          'História: $storyText\n'
          'Opções: $choices\n',
        );
      }
      var currentLocale = Get.locale ?? Get.deviceLocale;

      String promptPt =
          'Continue a história: $allStory com base na escolha do usuário: "$lastChoiceS"; \n'
          'Inclua a continuação da história e forneça 3 novas opções para escolher (no mesmo padrão da anterior); \n'
          'Com as mesmas regras:\n'
          '${AppConstants.promptDefaultPt}'
          'Mantenha a continuidade da história com base na escolha anterior ou finalizando caso o usuário escolheu a opção errada.';

      String promptEn =
          'Continue the story: $allStory based on the user\'s choice: "$lastChoiceS"; \n'
          'Include the continuation of the story and provide 3 new options to choose from (following the same pattern as before); \n'
          'With the same rules:\n'
          '${AppConstants.promptDefaultEn}'
          'Maintain the continuity of the story based on the previous choice or end it if the user chose the wrong option.';
      String? selectedPrompt;
      if (currentLocale?.languageCode == 'en') {
        selectedPrompt = promptEn;
      } else {
        selectedPrompt = promptPt;
      }

      final response = await Gemini.instance.chat([
        Content(parts: [Parts(text: selectedPrompt)])
      ]);

      var data = response?.content?.parts?.first.text ?? '';
      updateStoryAndChoices(data);
      if (data.contains('fimDaHistória') || data.contains('endOfStory')) {
        finished = true;
      }
      if (choices.isNotEmpty && storyText.isNotEmpty) {
        flutterTts.speak(storyText);
      }
    } finally {
      changeLoading(false);
    }
  }

  void updateStoryAndChoices(String data) {
    final result = extractStoryAndChoices(data);
    storyText = result['story'];
    choices = result['choices'] as List<String>;

    isChoicesVisible = true;
    update();
  }

  Map<String, dynamic> extractStoryAndChoices(String text) {
    final mapDefault = <String, dynamic>{
      'story': text.trim(),
      'choices': <String>[],
    };

    final splitted = text.split('#');
    if (splitted.length < 2) return mapDefault;

    final storyTextOne = splitted[0].trim();
    String choicesTextOne = splitted[1].trim();

    if (splitted.length > 2) {
      splitted.removeAt(0);
      choicesTextOne = splitted.join('\n');
    }

    RegExp? optionsPattern;
    var currentLocale = Get.locale ?? Get.deviceLocale;
    if (currentLocale?.languageCode == 'en') {
      optionsPattern = RegExp(
        r'Option \d+:\s*(.*?)(?=Option \d+:|$)',
        dotAll: true,
      );
    } else {
      optionsPattern = RegExp(
        r'Opção \d+:\s*(.*?)(?=Opção \d+:|$)',
        dotAll: true,
      );
    }

    final matches = optionsPattern.allMatches(choicesTextOne);

    final List<String> choices = [];
    for (final match in matches) {
      final valueSToAdd = match.group(1)?.trim() ?? '';
      choices.add(valueSToAdd);
    }

    return {
      'story': storyTextOne,
      'choices': choices,
    };
  }

  Future<void> onChoiceSelected(int index) async {
    isChoicesVisible = false;
    flutterTts.stop();
    await continueChat(index);
  }
}
