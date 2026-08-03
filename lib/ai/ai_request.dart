class AIRequest {
  final String prompt;

  final String? systemPrompt;

  final String model;

  final double temperature;

  final int? maxTokens;

  const AIRequest({
    required this.prompt,
    this.systemPrompt,
    this.model = "gpt-5",
    this.temperature = 0.7,
    this.maxTokens,
  });
}