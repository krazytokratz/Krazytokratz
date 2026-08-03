import 'ai_provider.dart';
import 'ai_request.dart';
import 'ai_response.dart';

class AIService {

  AIProvider provider;

  AIService({
    required this.provider,
  });

  Future<void> initialize() async {}

  Future<AIResponse> generate(
    AIRequest request,
  ) async {

    return await provider.generate(
      request,
    );

  }

  void changeProvider(
    AIProvider newProvider,
  ) {

    provider = newProvider;

  }

}