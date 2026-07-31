import 'package:flutter/material.dart';

import '../avatar/kraz_avatar.dart';
import '../conversation/conversation_engine.dart';
import '../voice/kraz_voice.dart';



class HomeScreen extends StatefulWidget {


  const HomeScreen({
    super.key,
  });



  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();


}






class _HomeScreenState extends State<HomeScreen> {



  final TextEditingController controller =
      TextEditingController();



  final ConversationEngine engine =
      ConversationEngine();



  final KrazVoice voice =
      KrazVoice();





  String response =
      "Halo. Saya Krazytokratz.\n"
      "Anda dapat memanggil saya Kraz.";





  KrazState avatarState =
      KrazState.ready;







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


      avatarState =
          KrazState.speaking;


    });





    await voice.speak(
      result,
    );





    setState(() {


      avatarState =
          KrazState.ready;


    });


  }









  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body: SafeArea(


        child: Padding(


          padding:
              const EdgeInsets.all(24),



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
                      "Kirim",
                    ),



              ),



            ],


          ),


        ),


      ),


    );


  }



}