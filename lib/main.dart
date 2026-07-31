import 'package:flutter/material.dart';

import 'memory/persistent_memory.dart';
import 'memory/memory_test.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();


  // ==============================
  // INITIALIZE KRAZ MEMORY SYSTEM
  // ==============================

  final memory = PersistentMemory();


  // Jalankan memory test

  final test = MemoryTest(
    memory,
  );


  await test.run();



  // ==============================
  // START KRAZ APP
  // ==============================

  runApp(

    KrazApp(
      memory: memory,
    ),

  );

}





class KrazApp extends StatelessWidget {


  final PersistentMemory memory;



  const KrazApp({

    super.key,

    required this.memory,

  });



  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      debugShowCheckedModeBanner: false,


      title: "Kraz AI Assistant",


      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),


      home: KrazHomePage(

        memory: memory,

      ),

    );

  }

}






class KrazHomePage extends StatelessWidget {


  final PersistentMemory memory;



  const KrazHomePage({

    super.key,

    required this.memory,

  });





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: const Text(

          "Kraz AI Assistant",

        ),

      ),





      body: Center(


        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,


          children: [



            const Icon(

              Icons.memory,

              size: 80,

            ),





            const SizedBox(

              height: 20,

            ),





            const Text(

              "Kraz Memory System v1.0",

              style: TextStyle(

                fontSize: 22,

                fontWeight: FontWeight.bold,

              ),

            ),





            const SizedBox(

              height: 30,

            ),





            FutureBuilder<String?>(


              future: memory.read(

                "user_name",

              ),



              builder: (context, snapshot) {



                if(snapshot.connectionState ==

                    ConnectionState.waiting) {


                  return const Text(

                    "Checking Memory...",

                    style: TextStyle(

                      fontSize: 18,

                    ),

                  );


                }





                return Text(


                  "Remembered User: ${snapshot.data ?? "None"}",


                  style: const TextStyle(


                    fontSize: 18,


                  ),


                );



              },


            ),





          ],


        ),


      ),


    );


  }


}