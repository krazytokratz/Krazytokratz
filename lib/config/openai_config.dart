import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIConfig {

  static String get apiKey {

    final key =
        dotenv.env["OPENAI_API_KEY"] ?? "";

    if (key.isEmpty) {

      throw Exception(
        "OPENAI_API_KEY tidak ditemukan pada file .env",
      );

    }

    return key;

  }

  static String get model {

    return dotenv.env["OPENAI_MODEL"] ??
        "gpt-5";

  }

}