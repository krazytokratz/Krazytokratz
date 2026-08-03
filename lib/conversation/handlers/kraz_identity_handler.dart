import '../../brain/brain_context.dart';
import '../../core/kraz_identity.dart';
import '../../core/kraz_personality.dart';

import '../response_generator.dart';

import 'conversation_handler.dart';

class KrazIdentityHandler
    implements ConversationHandler {

  final ResponseGenerator generator =
      ResponseGenerator();

  @override
  Future<String?> handle(
    BrainContext context,
  ) async {

    final lower =
        context.lowercaseMessage;

    if (!(lower.contains("siapa kamu") ||
        lower.contains("siapa dirimu"))) {
      return null;
    }

    return generator.generate(
      memoryResponse:
          "${KrazIdentity.introduction()}\n\n"
          "${KrazPersonality.introduction()}",
      defaultResponse:
          "Saya adalah Kraz.",
      profile:
          context.profileManager.profile,
    );
  }
}