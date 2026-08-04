class ThinkingResult {
  final String intent;

  final String memoryContext;

  final String response;

  final bool useAI;

  const ThinkingResult({
    required this.intent,
    required this.memoryContext,
    required this.response,
    required this.useAI,
  });
}