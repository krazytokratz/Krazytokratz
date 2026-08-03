import '../assistant/assistant_context.dart';
import '../assistant/assistant_result.dart';
import '../assistant/assistant_service.dart';
import '../assistant/assistant_voice.dart';


import 'chat_message.dart';



class ChatController {


  final AssistantService assistant =
      AssistantService();


  final AssistantVoice voice =
      AssistantVoice();



  final List<ChatMessage> messages =
      [];



  Future<void> initialize() async {


    await assistant.initialize();


    await voice.initialize();


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



    final AssistantResult result =
        await assistant.answer(

          AssistantContext(
            message: text,
          ),

        );



    final krazMessage =
        ChatMessage(

          text:
              result.response,

          sender:
              MessageSender.kraz,

          time:
              DateTime.now(),

        );



    messages.add(
      krazMessage,
    );



    await voice.speak(
      result.response,
    );



    return krazMessage;


  }


}