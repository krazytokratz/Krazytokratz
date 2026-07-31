import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get openAIApiKey {
    return dotenv.env['OPENAI_API_KEY'] ?? '';
  }

  static const String openAIUrl =
      'https://api.openai.com/v1/responses';
}