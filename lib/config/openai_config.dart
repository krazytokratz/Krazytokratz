import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIConfig {
  OpenAIConfig._();

  static String get apiKey {
    final key = dotenv.env['OPENAI_API_KEY'];

    if (key == null || key.isEmpty) {
      throw Exception(
        'OPENAI_API_KEY tidak ditemukan di file .env',
      );
    }

    return key;
  }

  static const String baseUrl =
      'https://api.openai.com/v1';

  static const String model =
      'gpt-5';
}