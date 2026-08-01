import 'package:flutter/material.dart';

import 'memory/persistent_memory.dart';
import 'memory/memory_test.dart';

import 'memory/project_manager.dart';
import 'memory/project_initializer.dart';




Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();




  // ==============================
  // INITIALIZE KRAZ MEMORY SYSTEM
  // ==============================


  final memory =
      PersistentMemory();




  final test =
      MemoryTest(

        memory,

      );



  await test.run();








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
  // START KRAZ APP
  // ==============================


  runApp(

    KrazApp(

      memory: memory,

      projectManager: projectManager,

    ),

  );


}









class KrazApp extends StatelessWidget {



  final PersistentMemory memory;


  final ProjectManager projectManager;





  const KrazApp({


    super.key,


    required this.memory,


    required this.projectManager,


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


        projectManager: projectManager,


      ),



    );



  }



}









class KrazHomePage extends StatelessWidget {



  final PersistentMemory memory;


  final ProjectManager projectManager;





  const KrazHomePage({


    super.key,


    required this.memory,


    required this.projectManager,


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


          mainAxisAlignment:

              MainAxisAlignment.center,


          children: [

            const Icon(

              Icons.memory,

              size: 80,

            ),






            const SizedBox(

              height: 20,

            ),






            const Text(

              "Kraz Memory System v1.3.3",

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

                    "Loading User Memory...",

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






            const SizedBox(

              height: 20,

            ),






            Text(


              "Project: "

              "${projectManager.project.name ?? "None"}",


              style: const TextStyle(

                fontSize: 18,

              ),


            ),






            const SizedBox(

              height: 10,

            ),






            Text(


              "Status: "

              "${projectManager.project.status ?? "-"}",


              style: const TextStyle(

                fontSize: 16,

              ),


            ),





          ],


        ),


      ),


    );


  }


}