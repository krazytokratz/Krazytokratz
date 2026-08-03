import '../../brain/brain_context.dart';
import '../response_generator.dart';

import 'conversation_handler.dart';

class IdentityHandler
    implements ConversationHandler {

  final ResponseGenerator generator =
      ResponseGenerator();

  @override
  Future<String?> handle(
    BrainContext context,
  ) async {

    final lower =
        context.lowercaseMessage;

    if (!(lower.contains("siapa saya") ||
        lower.contains("siapa nama saya") ||
        lower.contains("ingat saya") ||
        lower.contains("apa yang kamu tahu tentang saya"))) {
      return null;
    }

    if (!context.hasUser) {
      return generator.generate(
        memoryResponse: null,
        defaultResponse:
            "Saya belum memiliki informasi yang cukup tentang Anda.",
        profile:
            context.profileManager.profile,
      );
    }

    return generator.generate(
      memoryResponse:
          "Saya mengenal Anda sebagai "
          "${context.profileManager.profile.name}.\n\n"
          "${context.profileManager.profile.summary()}",
      defaultResponse:
          "Saya belum memiliki informasi.",
      profile:
          context.profileManager.profile,
    );
  }
}