import 'package:flutter/material.dart';

import 'memory/persistent_memory.dart';
import 'memory/memory_test.dart';

import 'memory/project_manager.dart';
import 'memory/project_initializer.dart';

import 'chat/chat_controller.dart';
import 'chat/chat_screen.dart';





Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();





  // ==============================
  // INITIALIZE KRAZ MEMORY SYSTEM
  // ==============================


  final memory =

      PersistentMemory();




  final memoryTest =

      MemoryTest(

        memory,

      );




  await memoryTest.run();







  // ==============================
  // INITIALIZE PROJECT MEMORY
  // ==============================


  final projectManager =

      ProjectManager();




  final projectInitializer =

      ProjectInitializer();




  await projectInitializer.initialize(

    projectManager,

  );







  // ==============================
  // INITIALIZE CHAT SYSTEM
  // ==============================


  final chatController =

      ChatController();




  await chatController.initialize();








  // ==============================
  // START KRAZ APP
  // ==============================


  runApp(

    KrazApp(

      memory: memory,

      projectManager: projectManager,

      chatController: chatController,

    ),

  );


}









class KrazApp extends StatelessWidget {



  final PersistentMemory memory;


  final ProjectManager projectManager;


  final ChatController chatController;






  const KrazApp({


    super.key,


    required this.memory,


    required this.projectManager,


    required this.chatController,


  });






  @override
  Widget build(BuildContext context) {


    return MaterialApp(


      debugShowCheckedModeBanner: false,



      title:

          "Kraz AI Assistant",





      theme:

          ThemeData(


            primarySwatch:

                Colors.blue,


          ),





      home:

          ChatScreen(


            controller:

                chatController,


          ),



    );


  }



}
