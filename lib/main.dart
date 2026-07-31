import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/kraz_identity.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(
    fileName: ".env",
  );

  debugPrint(
    "Initializing ${KrazIdentity.name} v${KrazIdentity.version}",
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

        brightness: Brightness.dark,

        scaffoldBackgroundColor:
            const Color(0xFF081018),

        useMaterial3: true,

      ),

      home: const KrazDashboard(),

    );

  }

}




class KrazDashboard extends StatefulWidget {

  const KrazDashboard({
    super.key,
  });


  @override
  State<KrazDashboard> createState() =>
      _KrazDashboardState();

}




class _KrazDashboardState
    extends State<KrazDashboard> {


  final FlutterTts tts =
      FlutterTts();



  Future<void> bicara() async {


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

      "Halo. Saya Kraz. "
      "Sistem inti saya aktif. "
      "Saya siap menjadi asisten pribadi Anda.",

    );

  }




  void memoryCheck() {


    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(

        content: Text(
          "Memory System: Foundation Ready",
        ),

      ),

    );

  }





  Widget statusCard(
      IconData icon,
      String title,
      String status,
  ) {


    return Card(

      color:
          const Color(0xFF13293D),


      child: ListTile(

        leading: Icon(

          icon,

          color:
              Colors.lightBlueAccent,

        ),


        title: Text(
          title,
        ),


        subtitle: Text(
          status,
        ),

      ),

    );

  }






  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SafeArea(

        child: Padding(

          padding:
              const EdgeInsets.all(24),


          child: Column(

            children: [


              const SizedBox(
                height: 20,
              ),



              const Icon(

                Icons.smart_toy,

                size: 90,

                color:
                    Colors.lightBlueAccent,

              ),




              const SizedBox(
                height: 15,
              ),




              const Text(

                "KRAZ",

                style: TextStyle(

                  fontSize: 42,

                  fontWeight:
                      FontWeight.bold,

                  letterSpacing: 6,

                ),

              ),




              const Text(

                "Personal AI Assistant",

                style: TextStyle(

                  fontSize: 18,

                  color:
                      Colors.white70,

                ),

              ),




              const SizedBox(
                height: 20,
              ),




              Text(

                "ONLINE",

                style: TextStyle(

                  color:
                      Colors.greenAccent,

                  fontSize: 16,

                  fontWeight:
                      FontWeight.bold,

                ),

              ),





              const SizedBox(
                height: 30,
              ),




              statusCard(

                Icons.badge,

                "Identity Core",

                "Active",

              ),



              statusCard(

                Icons.psychology,

                "Personality Engine",

                "Active",

              ),



              statusCard(

                Icons.memory,

                "Memory System",

                "Foundation Ready",

              ),




              const Spacer(),




              SizedBox(

                width:
                    double.infinity,


                child: ElevatedButton.icon(

                  onPressed:
                      bicara,


                  icon:
                      const Icon(
                        Icons.mic,
                      ),


                  label:
                      const Text(
                        "Berbicara Dengan Kraz",
                      ),

                ),

              ),




              const SizedBox(
                height: 12,
              ),




              SizedBox(

                width:
                    double.infinity,


                child:
                    OutlinedButton.icon(

                  onPressed:
                      memoryCheck,


                  icon:
                      const Icon(
                        Icons.memory,
                      ),


                  label:
                      const Text(
                        "Cek Memory",
                      ),

                ),

              ),




              const SizedBox(
                height: 20,
              ),




              Text(

                "Kraz Foundation ${KrazIdentity.version}",

                style:

                    const TextStyle(

                      color:
                          Colors.white38,

                    ),

              ),


            ],

          ),

        ),

      ),

    );

  }

}