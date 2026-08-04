import 'decision_type.dart';

class DecisionResult {
  final DecisionType type;

  final bool useLocal;

  final bool useAI;

  final String response;

  final String context;

  const DecisionResult({
    required this.type,
    required this.useLocal,
    required this.useAI,
    required this.response,
    required this.context,
  });

  factory DecisionResult.local({
    required String response,
    required String context,
  }) {
    return DecisionResult(
      type: DecisionType.local,
      useLocal: true,
      useAI: false,
      response: response,
      context: context,
    );
  }

  factory DecisionResult.ai({
    required String context,
  }) {
    return DecisionResult(
      type: DecisionType.ai,
      useLocal: false,
      useAI: true,
      response: "",
      context: context,
    );
  }

  factory DecisionResult.planning({
    required String context,
  }) {
    return DecisionResult(
      type: DecisionType.planning,
      useLocal: false,
      useAI: true,
      response: "",
      context: context,
    );
  }

  factory DecisionResult.memory({
    required String response,
    required String context,
  }) {
    return DecisionResult(
      type: DecisionType.memory,
      useLocal: true,
      useAI: false,
      response: response,
      context: context,
    );
  }

  factory DecisionResult.tool({
    required String context,
  }) {
    return DecisionResult(
      type: DecisionType.tool,
      useLocal: false,
      useAI: true,
      response: "",
      context: context,
    );
  }
}