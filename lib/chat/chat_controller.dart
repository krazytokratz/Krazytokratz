import '../conversation/conversation_engine.dart';

import 'chat_message.dart';



class ChatController {



  final ConversationEngine engine =
      ConversationEngine();




  final List<ChatMessage> messages =
      [];






  Future<void> initialize() async {


    await engine.initialize();


  }







  Future<ChatMessage> sendMessage(

    String text,

  ) async {



    final userMessage =

        ChatMessage(

          text: text,

          sender:

              MessageSender.user,

          time:

              DateTime.now(),

        );



    messages.add(

      userMessage,

    );







    final response =

        await engine.respond(

          text,

        );







    final krazMessage =

        ChatMessage(

          text: response,

          sender:

              MessageSender.kraz,

          time:

              DateTime.now(),

        );




    messages.add(

      krazMessage,

    );





    return krazMessage;



  }





}