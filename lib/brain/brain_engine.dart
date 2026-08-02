import '../conversation/conversation_engine.dart';
import '../intent/intent_engine.dart';
import '../response/response_engine.dart';

import 'brain_context.dart';

class BrainEngine {
  final ConversationEngine conversationEngine =
      ConversationEngine();

  final IntentEngine intentEngine =
      IntentEngine();

  final ResponseEngine responseEngine =
      const ResponseEngine();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    await conversationEngine.initialize();

    _initialized = true;
  }

  Future<String> process(
    String message,
  ) async {
    if (!_initialized) {
      await initialize();
    }

    final context = BrainContext(
      message: message,
      profileManager:
          conversationEngine.profileManager,
      projectManager:
          conversationEngine.projectManager,
      timestamp: DateTime.now(),
    );

    return processContext(
      context,
    );
  }

  Future<String> processContext(
    BrainContext context,
  ) async {
    try {
      final quickIntent =
          intentEngine.process(
        context.message,
      );

      if (quickIntent != null) {
        return responseEngine.build(
          quickIntent,
        );
      }

      final response =
          await conversationEngine.respond(
        context.message,
      );

      return responseEngine.build(
        response,
      );
    } catch (_) {
      return responseEngine.errorResponse();
    }
  }
}