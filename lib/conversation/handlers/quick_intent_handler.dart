import '../../brain/brain_context.dart';

import '../intent_detector.dart';
import '../intent_handler.dart';
import '../response_generator.dart';

import 'conversation_handler.dart';

class QuickIntentHandler
    implements ConversationHandler {

  final IntentDetector detector =
      IntentDetector();

  final IntentHandler handler =
      IntentHandler();

  final ResponseGenerator generator =
      ResponseGenerator();

  @override
  Future<String?> handle(
    BrainContext context,
  ) async {

    final intent =
        detector.detect(
      context.message,
    );

    final response =
        handler.handle(
      intent,
    );

    if (response == null) {
      return null;
    }

    return generator.generate(
      memoryResponse:
          response,
      defaultResponse:
          "Saya memahami pesan Anda.",
      profile:
          context.profileManager.profile,
    );
  }
}