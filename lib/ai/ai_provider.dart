import 'ai_request.dart';
import 'ai_response.dart';

abstract class AIProvider {

  AIProviderType get type;

  Future<AIResponse> generate(
    AIRequest request,
  );

}

enum AIProviderType {

  openAI,

  gemini,

  claude,

  ollama,

  deepSeek,

  local,

}