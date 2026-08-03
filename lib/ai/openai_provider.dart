import 'ai_provider.dart';
import 'ai_request.dart';
import 'ai_response.dart';

class OpenAIProvider
    implements AIProvider {

  @override
  AIProviderType get type =>
      AIProviderType.openAI;

  @override
  Future<AIResponse> generate(
    AIRequest request,
  ) async {

    //
    // Sementara masih placeholder.
    // Tahap berikutnya akan
    // memanggil OpenAI API.
    //

    return AIResponse(

      text:
          "OPENAI : ${request.prompt}",

    );

  }

}