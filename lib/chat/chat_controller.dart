import '../conversation/conversation_engine.dart';

import '../memory/conversation_memory.dart';
import '../memory/conversation_repository.dart';

import 'chat_message.dart';





class ChatController {



  final ConversationEngine engine =
      ConversationEngine();




  final ConversationRepository conversationRepository =
      ConversationRepository();




  final List<ChatMessage> messages =
      [];









  Future<void> initialize() async {


    await engine.initialize();



    await conversationRepository.load();




    _loadHistory();


  }









  void _loadHistory() {


    messages.clear();




    for(final item in conversationRepository.getAll()) {



      messages.add(

        ChatMessage(

          text:

              item.message,


          sender:

              item.role == "user"

                  ?

              MessageSender.user

                  :

              MessageSender.kraz,


          time:

              item.createdAt,


        ),

      );


    }


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






    await conversationRepository.addMessage(

      ConversationMemory(

        id:

            DateTime.now()

                .millisecondsSinceEpoch

                .toString(),


        role:

            "user",


        message:

            text,


        createdAt:

            DateTime.now(),


      ),

    );









    final response =

        await engine.respond(

          text,

        );








    final krazMessage =

        ChatMessage(

          text:

              response,


          sender:

              MessageSender.kraz,


          time:

              DateTime.now(),


        );






    messages.add(

      krazMessage,

    );







    await conversationRepository.addMessage(

      ConversationMemory(

        id:

            DateTime.now()

                .millisecondsSinceEpoch

                .toString(),


        role:

            "kraz",


        message:

            response,


        createdAt:

            DateTime.now(),


      ),

    );








    return krazMessage;



  }





}