import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import 'core/kraz_identity.dart';
import 'memory/memory_service.dart';
import 'conversation/conversation_engine.dart';
import 'avatar/kraz_avatar.dart';
import 'memory/user_profile.dart';
import 'memory/memory_analyzer.dart';
import 'memory/profile_storage.dart';
import 'conversation/conversation_engine.dart';





Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();



  await dotenv.load(
    fileName: ".env",
  );



  debugPrint(
    "Initializing ${KrazIdentity.fullName} "
    "(${KrazIdentity.name}) "
    "v${KrazIdentity.version}",
  );



  runApp(
    const KrazApp(),
  );


}







class KrazApp extends StatelessWidget {


  const KrazApp({
    super.key,
  });





  @override
  Widget build(BuildContext context) {


    return MaterialApp(


      debugShowCheckedModeBanner: false,


      title: "Kraz",



      theme: ThemeData(


        brightness:
            Brightness.dark,


        scaffoldBackgroundColor:
            const Color(0xFF0D1B2A),


        useMaterial3:
            true,


      ),



      home:
          const HomePage(),


    );


  }


}








class HomePage extends StatefulWidget {


  const HomePage({
    super.key,
  });





  @override
  State<HomePage> createState() =>
      _HomePageState();


}









class _HomePageState extends State<HomePage> {



  final FlutterTts tts =
      FlutterTts();




  final MemoryService memoryService =
      MemoryService();




  late ConversationEngine engine;




  final TextEditingController controller =
      TextEditingController();





  String response =

      "Halo. Saya Krazytokratz. "
      "Anda dapat memanggil saya Kraz.";





  KrazState avatarState =
      KrazState.ready;







  @override
  void initState() {


    super.initState();



    engine =
        
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
      text,
    );




    setState(() {

      avatarState =
          KrazState.ready;

    });



  }








  Future<void> sendMessage() async {


    final input =
        controller.text.trim();



    if(input.isEmpty){

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
  Widget build(BuildContext context) {


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


}