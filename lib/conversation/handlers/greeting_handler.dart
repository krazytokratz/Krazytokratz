import '../../brain/brain_context.dart';
import '../response_generator.dart';

import 'conversation_handler.dart';

class GreetingHandler
    implements ConversationHandler {

  final ResponseGenerator generator =
      ResponseGenerator();

  @override
  Future<String?> handle(
    BrainContext context,
  ) async {
    final lower =
        context.lowercaseMessage;

    if (!(lower.contains("halo") ||
        lower.contains("hai") ||
        lower.contains("selamat pagi") ||
        lower.contains("selamat siang") ||
        lower.contains("selamat sore") ||
        lower.contains("selamat malam"))) {
      return null;
    }

    return generator.generate(
      memoryResponse:
          context.hasUser
              ? "Halo ${context.profileManager.profile.name}.\n"
                  "Senang bertemu kembali."
              : "Halo.\n"
                  "Senang bertemu kembali.",
      defaultResponse: "Halo.",
      profile:
          context.profileManager.profile,
    );
  }
}