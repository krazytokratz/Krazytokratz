import '../memory/persistent_memory.dart';
import '../memory/memory_test.dart';

import '../memory/project_manager.dart';
import '../memory/project_initializer.dart';

import '../chat/chat_controller.dart';

import 'kraz_logger.dart';



class KrazBoot {


  late PersistentMemory memory;


  late ProjectManager projectManager;


  late ChatController chatController;



  Future<void> start() async {


    KrazLogger.boot(
      "==============================",
    );


    KrazLogger.boot(
      "        KRAZ BOOT SEQUENCE",
    );


    KrazLogger.boot(
      "==============================",
    );



    // ==========================
    // MEMORY SYSTEM
    // ==========================


    KrazLogger.boot(
      "Loading Memory System...",
    );


    memory =
        PersistentMemory();



    final memoryTest =
        MemoryTest(
          memory,
        );



    await memoryTest.run();



    KrazLogger.boot(
      "Memory Ready",
    );



    // ==========================
    // PROJECT MEMORY
    // ==========================


    KrazLogger.boot(
      "Loading Project Memory...",
    );



    projectManager =
        ProjectManager();



    final projectInitializer =
        ProjectInitializer();



    await projectInitializer.initialize(
      projectManager,
    );



    KrazLogger.boot(
      "Project Memory Ready",
    );



    // ==========================
    // CHAT SYSTEM
    // ==========================


    KrazLogger.boot(
      "Loading Assistant System...",
    );



    chatController =
        ChatController();



    await chatController.initialize();



    KrazLogger.boot(
      "Assistant Ready",
    );



    KrazLogger.boot(
      "==============================",
    );


    KrazLogger.boot(
      "        KRAZ ONLINE",
    );


    KrazLogger.boot(
      "==============================",
    );


  }

}