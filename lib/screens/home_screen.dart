import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../avatar/kraz_avatar.dart';
import '../conversation/conversation_engine.dart';
import '../voice/voice_cleaner.dart';




class HomeScreen extends StatefulWidget {


  const HomeScreen({
    super.key,
  });




  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();



}







class _HomeScreenState extends State<HomeScreen> {



  final FlutterTts tts =
      FlutterTts();




  final TextEditingController controller =
      TextEditingController();




  final ConversationEngine engine =
      ConversationEngine();






  String response =

      "Halo.\n\n"
      "Saya Krazytokratz.\n\n"
      "Anda dapat memanggil saya Kraz.";






  KrazState avatarState =
      KrazState.ready;








  @override
  void initState() {


    super.initState();


    initializeKraz();


  }








  Future<void> initializeKraz() async {


    await engine.initialize();


  }









  Future<void> speak(
    String text,
  ) async {



    setState(() {


      avatarState =
          KrazState.speaking;


    });





    await tts.setLanguage(
      "id-ID",
    );





    await tts.setSpeechRate(
      0.45,
    );





    await tts.setPitch(
      1.0,
    );





    await tts.speak(

      VoiceCleaner.clean(
        text,
      ),

    );






    setState(() {


      avatarState =
          KrazState.ready;


    });



  }









  Future<void> sendMessage() async {


    final input =
        controller.text.trim();





    if(input.isEmpty) {


      return;


    }







    setState(() {


      avatarState =
          KrazState.thinking;


    });






    controller.clear();






    final result =
        await engine.respond(
          input,
        );






    setState(() {


      response =
          result;


    });






    await speak(
      result,
    );



  }









  @override
  Widget build(
    BuildContext context,
  ) {


    return Scaffold(



      body: SafeArea(



        child: Padding(



          padding:
              const EdgeInsets.all(30),





          child: Column(



            mainAxisAlignment:
                MainAxisAlignment.center,




            children: [





              KrazAvatar(

                state:
                    avatarState,

              ),






              const SizedBox(

                height: 30,

              ),







              Text(

                response,

                textAlign:
                    TextAlign.center,



                style:
                    const TextStyle(

                      fontSize: 18,

                      height: 1.5,

                    ),


              ),








              const SizedBox(

                height: 30,

              ),







              TextField(


                controller:
                    controller,



                decoration:
                    const InputDecoration(

                      hintText:
                          "Berbicara dengan Kraz",


                      border:
                          OutlineInputBorder(),

                    ),


              ),









              const SizedBox(

                height: 20,

              ),









              ElevatedButton.icon(



                onPressed:
                    sendMessage,



                icon:
                    const Icon(
                      Icons.send,
                    ),



                label:
                    const Text(
                      "Kirim ke Kraz",
                    ),



              ),





            ],



          ),



        ),



      ),



    );


  }









  @override
  void dispose() {


    controller.dispose();


    super.dispose();


  }




}