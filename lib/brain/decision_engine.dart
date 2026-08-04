import 'decision_result.dart';
import 'decision_type.dart';

class DecisionEngine {
  Future<DecisionResult> decide({
    required String localResponse,
    required String memoryContext,
  }) async {
    final local =
        localResponse.trim();

    if (local.isNotEmpty) {
      return DecisionResult(
        type: DecisionType.local,
        useLocal: true,
        useAI: false,
        response: local,
        context: memoryContext,
      );
    }

    return DecisionResult(
      type: DecisionType.ai,
      useLocal: false,
      useAI: true,
      response: "",
      context: memoryContext,
    );
  }
}