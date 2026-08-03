import '../brain/brain_engine.dart';

import 'assistant_context.dart';
import 'assistant_result.dart';

class AssistantService {
  final BrainEngine brain =
      BrainEngine();

  Future<void> initialize() async {
    await brain.initialize();
  }

  Future<AssistantResult> answer(
    AssistantContext context,
  ) async {
    final response =
        await brain.process(
      context.message,
    );

    return AssistantResult(
      response: response,
    );
  }
}