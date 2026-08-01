import 'conversation_engine.dart';


class KrazChatController {


  final ConversationEngine engine =
      ConversationEngine();



  Future<void> initialize() async {

    await engine.initialize();

  }





  Future<String> sendMessage(
    String message,
  ) async {


    return await engine.respond(
      message,
    );


  }


}