import '../../brain/brain_context.dart';
import '../response_generator.dart';

import 'conversation_handler.dart';

class ProjectHandler
    implements ConversationHandler {

  final ResponseGenerator generator =
      ResponseGenerator();

  @override
  Future<String?> handle(
    BrainContext context,
  ) async {

    final lower =
        context.lowercaseMessage;

    if (!(lower.contains("apa proyek saya") ||
        lower.contains("proyek saya") ||
        lower.contains("ingat proyek saya") ||
        lower.contains("apa yang sedang saya buat"))) {
      return null;
    }

    if (!context.hasProject) {
      return generator.generate(
        memoryResponse: null,
        defaultResponse:
            "Saya belum memiliki informasi tentang proyek Anda.",
        profile:
            context.profileManager.profile,
      );
    }

    return generator.generate(
      memoryResponse:
          context.projectManager.summary(),
      defaultResponse:
          "Belum ada proyek.",
      profile:
          context.profileManager.profile,
    );
  }
}