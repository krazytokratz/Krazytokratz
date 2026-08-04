import '../brain/brain_engine.dart';

import 'assistant_context.dart';
import 'assistant_result.dart';

class AssistantService {
  final BrainEngine brain =
      BrainEngine();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    await brain.initialize();

    _initialized = true;
  }

  Future<AssistantResult> answer(
    AssistantContext context,
  ) async {
    if (!_initialized) {
      await initialize();
    }

    final response =
        await brain.process(
      context.message.trim(),
    );

    return AssistantResult(
      response: response,
    );
  }
}