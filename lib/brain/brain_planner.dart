import 'brain_decision.dart';

class BrainPlanner {
  BrainDecision analyze(
    String message,
  ) {
    final text = message.toLowerCase();

    if (text.contains("chatgpt") ||
        text.contains("gemini") ||
        text.contains("claude") ||
        text.contains("ai")) {
      return const BrainDecision(
        useMemory: true,
        useAI: true,
        saveMemory: true,
      );
    }

    return BrainDecision.defaultDecision();
  }
}