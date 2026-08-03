class AIResponse {
  final String text;

  final String? model;

  final bool success;

  final String? error;

  const AIResponse({
    required this.text,
    this.model,
    this.success = true,
    this.error,
  });

  const AIResponse.error(
    this.error,
  )   : text = "",
        model = null,
        success = false;
}