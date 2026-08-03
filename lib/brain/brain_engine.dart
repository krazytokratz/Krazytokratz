import '../ai/ai_request.dart';
import '../ai/ai_response.dart';
import '../ai/ai_service.dart';
import '../ai/openai_provider.dart';

import '../conversation/conversation_engine.dart';

class BrainEngine {

  final ConversationEngine conversationEngine =
      ConversationEngine();

  late AIService aiService;

  Future<void> initialize() async {

    await conversationEngine.initialize();

    aiService = AIService(
      provider: OpenAIProvider(),
    );

    await aiService.initialize();

  }

  /// ==========================================================
  /// Method utama Brain
  /// ==========================================================
  Future<String> process(
    String message,
  ) async {

    return await think(message);

  }

  /// ==========================================================
  /// Proses berpikir Brain
  /// ==========================================================
  Future<String> think(
    String message,
  ) async {

    final localResponse =
        await conversationEngine.respond(
      message,
    );

    if (localResponse.trim().isNotEmpty) {
      return localResponse;
    }

    final AIResponse response =
        await aiService.generate(

      AIRequest(
        prompt: message,
      ),

    );

    return response.text;

  }

}