import '../../brain/brain_context.dart';

abstract class ConversationHandler {
  Future<String?> handle(
    BrainContext context,
  );
}