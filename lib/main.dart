import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/kraz_boot.dart';

import 'chat/chat_controller.dart';
import 'chat/chat_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();


  await dotenv.load(
    fileName: ".env",
  );


  final krazBoot =
      KrazBoot();


  await krazBoot.start();


  runApp(
    KrazApp(
      chatController:
          krazBoot.chatController,
    ),
  );

}



class KrazApp extends StatelessWidget {


  final ChatController chatController;


  const KrazApp({

    super.key,

    required this.chatController,

  });



  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      debugShowCheckedModeBanner:
          false,


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