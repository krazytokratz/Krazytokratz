import '../../brain/brain_context.dart';
import '../response_generator.dart';

import 'conversation_handler.dart';

class ProfileHandler
    implements ConversationHandler {

  final ResponseGenerator generator =
      ResponseGenerator();

  @override
  Future<String?> handle(
    BrainContext context,
  ) async {

    final lower =
        context.lowercaseMessage;

    if (!lower.contains("profil saya")) {
      return null;
    }

    return generator.generate(
      memoryResponse:
          context.profileManager.profile.summary(),
      defaultResponse:
          "Profil belum tersedia.",
      profile:
          context.profileManager.profile,
    );
  }
}