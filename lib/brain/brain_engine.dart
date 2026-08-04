import '../ai/ai_request.dart';
import '../ai/ai_response.dart';
import '../ai/ai_service.dart';
import '../ai/openai_provider.dart';
import '../ai/prompt_builder.dart';
import '../ai/prompt_context.dart';
import '../ai/prompt_strategy.dart';

import '../conversation/conversation_engine.dart';

class BrainEngine {
  final ConversationEngine conversationEngine =
      ConversationEngine();

  final PromptBuilder promptBuilder =
      PromptBuilder();

  late AIService aiService;

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    await conversationEngine.initialize();

    aiService = AIService(
      provider: OpenAIProvider(),
    );

    await aiService.initialize();

    _initialized = true;
  }

  Future<String> process(
    String message,
  ) async {
    if (!_initialized) {
      await initialize();
    }

    // ===============================
    // LOCAL ENGINE
    // ===============================

    final local =
        await conversationEngine.respond(
      message,
    );

    if (local.trim().isNotEmpty) {
      return local;
    }

    // ===============================
    // BUILD PROMPT
    // ===============================

    final prompt =
        promptBuilder.build(
      PromptContext(
        strategy:
            PromptStrategy.normal,
        profile: "",
        memory:
            conversationEngine
                .memoryContext,
        project: "",
        activeContext:
            conversationEngine
                .activeContext,
        lastMessage:
            conversationEngine
                .lastMessage,
        currentMessage:
            message,
      ),
    );

    // ===============================
    // OPENAI
    // ===============================

    final AIResponse response =
        await aiService.generate(
      AIRequest(
        prompt: prompt,
      ),
    );

    // ===============================
    // SIMPAN KE SESSION
    // ===============================

    conversationEngine
        .registerAssistantResponse(
      response.text,
    );

    return response.text;
  }
}