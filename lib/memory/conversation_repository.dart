import 'conversation_memory.dart';
import 'conversation_storage.dart';





class ConversationRepository {



  final ConversationStorage storage =
      ConversationStorage();




  List<ConversationMemory> conversations = [];







  // ==========================
  // LOAD HISTORY
  // ==========================


  Future<void> load() async {


    conversations =

        await storage.loadConversation();


  }







  // ==========================
  // ADD MESSAGE
  // ==========================


  Future<void> addMessage(

    ConversationMemory memory,

  ) async {


    conversations.add(

      memory,

    );



    await storage.saveConversation(

      conversations,

    );


  }







  // ==========================
  // GET HISTORY
  // ==========================


  List<ConversationMemory> getAll() {


    return conversations;


  }







  // ==========================
  // GET LAST MESSAGE
  // ==========================


  ConversationMemory? getLast() {


    if(conversations.isEmpty) {


      return null;


    }




    return conversations.last;


  }







  // ==========================
  // CLEAR HISTORY
  // ==========================


  Future<void> clear() async {


    conversations.clear();



    await storage.clearConversation();


  }







}