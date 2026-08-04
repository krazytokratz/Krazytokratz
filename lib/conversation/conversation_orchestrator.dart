import 'handler_router.dart';

class ConversationOrchestrator {

  final HandlerRouter router;

  ConversationOrchestrator({

    required this.router,

  });

  Future<String?> process(

    String message,

  ) async {

    final response =

        await router.handle(

      message,

    );

    return response;

  }

}