import 'ai_provider.dart';
import 'ai_request.dart';
import 'ai_response.dart';

import '../services/openai_service.dart';

class OpenAIProvider
    implements AIProvider {
  final OpenAIService service =
      OpenAIService();

  @override
  AIProviderType get type =>
      AIProviderType.openAI;

  @override
  Future<AIResponse> generate(
    AIRequest request,
  ) async {
    final answer =
        await service.ask(
      prompt: request.prompt,
    );

    return AIResponse(
      text: answer,
    );
  }
}