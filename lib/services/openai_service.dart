import 'package:openai_dart/openai_dart.dart';

import '../config/app_config.dart';

class OpenAIService {
  late final OpenAIClient _client;

  OpenAIService()
      : _client = OpenAIClient.withApiKey(
          AppConfig.openAIApiKey,
        );

  Future<String> ask({
    required String prompt,
  }) async {
    try {
      final response =
          await _client.responses.create(
        CreateResponseRequest(
          model: "gpt-5.5",
          input: ResponseInput.text(
            prompt,
          ),
        ),
      );

      return response.outputText;
    } on ApiException catch (e) {
      return "OpenAI API Error (${e.statusCode})\n${e.message}";
    } on OpenAIException catch (e) {
      return "OpenAI Client Error\n$e";
    } catch (e) {
      return "Error\n$e";
    }
  }

  void dispose() {
    _client.close();
  }
}