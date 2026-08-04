import '../../ai/ai_request.dart';
import '../../ai/ai_response.dart';
import '../../ai/ai_service.dart';
import '../../ai/openai_provider.dart';

class AIHandler {
  late AIService _ai;

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    _ai = AIService(
      provider: OpenAIProvider(),
    );

    await _ai.initialize();

    _initialized = true;
  }

  Future<String?> handle(
    String message,
  ) async {
    if (!_initialized) {
      await initialize();
    }

    final AIResponse response =
        await _ai.generate(
      AIRequest(
        prompt: message,
      ),
    );

    return response.text;
  }
}