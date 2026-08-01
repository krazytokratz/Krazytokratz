import '../memory/persistent_memory.dart';
import '../memory/memory_service.dart';

import 'conversation_engine.dart';



class KrazChatController {


  late ConversationEngine engine;


  final PersistentMemory persistentMemory =
      PersistentMemory();



  final MemoryService memoryService =
      MemoryService();



  Future<void> initialize() async {


    engine = ConversationEngine();


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