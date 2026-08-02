import '../core/kraz_identity.dart';
import '../core/kraz_personality.dart';

import '../memory/profile_manager.dart';
import '../memory/memory_analyzer.dart';
import '../memory/memory_service.dart';
import '../memory/memory_repository.dart';
import '../memory/persistent_memory.dart';
import '../memory/project_manager.dart';
import '../memory/memory_integration_engine.dart';

import 'intent_detector.dart';
import 'intent_handler.dart';
import 'response_generator.dart';
import 'response_style_builder.dart';



class ConversationEngine {



  final ProfileManager profileManager =
      ProfileManager();



  final MemoryService memoryService =
      MemoryService();



  final PersistentMemory persistentMemory =
      PersistentMemory();



  late MemoryRepository memoryRepository;



  final ProjectManager projectManager =
      ProjectManager();



  final MemoryIntegrationEngine memoryIntegrationEngine =
      MemoryIntegrationEngine();



  final IntentDetector intentDetector =
      IntentDetector();



  final IntentHandler intentHandler =
      IntentHandler();



  final ResponseGenerator responseGenerator =
      ResponseGenerator();



  final ResponseStyleBuilder responseStyleBuilder =
      ResponseStyleBuilder();



  late MemoryAnalyzer analyzer;







  ConversationEngine() {


    memoryRepository =
        MemoryRepository(

          memoryService: memoryService,

          persistentMemory: persistentMemory,

        );


  }









  Future<void> initialize() async {


    await profileManager.load();



    await projectManager.load();



    await memoryIntegrationEngine.initialize();




    analyzer =
        MemoryAnalyzer(

          profileManager.profile,

        );



    await memoryService.loadMemory();



  }









  Future<String> respond(

    String input,

  ) async {



    final message =
        input.trim();





    await memoryIntegrationEngine.analyzeAndStore(

      message,

    );





    final lower =
        message.toLowerCase();





    final intent =
        intentDetector.detect(

          message,

        );







    final learned =
        analyzer.analyze(

          message,

        );



    if (learned) {


      await profileManager.save();



      return

          "Baik.\n"
          "Saya memahami informasi tersebut "
          "dan akan mengingatnya.";


    }









    if (

      lower.contains("apa proyek saya") ||

      lower.contains("proyek saya") ||

      lower.contains("ingat proyek saya") ||

      lower.contains("apa yang sedang saya buat")

    ) {


      if(projectManager.hasProject) {


        return responseGenerator.generate(

          memoryResponse:

              projectManager.summary(),


          defaultResponse:

              "Saya belum memiliki informasi "
              "tentang proyek Anda.",


          profile:

              profileManager.profile,

        );


      }



      return responseGenerator.generate(

        memoryResponse: null,


        defaultResponse:

            "Saya belum memiliki informasi "
            "tentang proyek Anda.",


        profile:

            profileManager.profile,

      );


    }









    if (

      lower.contains("siapa saya") ||

      lower.contains("siapa nama saya") ||

      lower.contains("ingat saya") ||

      lower.contains("apa yang kamu tahu tentang saya")

    ) {


      if(profileManager.hasName) {


        return responseGenerator.generate(

          memoryResponse:

              "Saya mengenal Anda sebagai "
              "${profileManager.profile.name}.\n\n"
              "${profileManager.profile.summary()}",


          defaultResponse:

              "Saya belum memiliki informasi "
              "yang cukup tentang Anda.",


          profile:

              profileManager.profile,

        );


      }



      return responseGenerator.generate(

        memoryResponse: null,


        defaultResponse:

            "Saya belum memiliki informasi "
            "yang cukup tentang Anda.",


        profile:

            profileManager.profile,

      );


    }









    if (

      lower.contains("profil saya")

    ) {


      return responseGenerator.generate(

        memoryResponse:

            profileManager.profile.summary(),


        defaultResponse:

            "Profil belum tersedia.",


        profile:

            profileManager.profile,

      );


    }









    final quickResponse =

        intentHandler.handle(

          intent,

        );



    if (quickResponse != null) {


      return responseGenerator.generate(

        memoryResponse:

            quickResponse,


        defaultResponse:

            "Saya memahami pesan Anda.",


        profile:

            profileManager.profile,

      );


    }









    if (

      lower.contains("halo") ||

      lower.contains("hai") ||

      lower.contains("selamat pagi") ||

      lower.contains("selamat siang") ||

      lower.contains("selamat sore") ||

      lower.contains("selamat malam")

    ) {


      return responseGenerator.generate(

        memoryResponse:

            profileManager.hasName

                ?

            "Halo ${profileManager.profile.name}.\n"
            "Senang bertemu kembali."

                :

            "Halo.\n"
            "Senang bertemu kembali.",


        defaultResponse:

            "Halo.",


        profile:

            profileManager.profile,

      );


    }









    if (

      lower.contains("siapa kamu") ||

      lower.contains("siapa dirimu")

    ) {


      return responseGenerator.generate(

        memoryResponse:

            "${KrazIdentity.introduction()}\n\n"
            "${KrazPersonality.introduction()}",


        defaultResponse:

            "Saya adalah Kraz.",


        profile:

            profileManager.profile,

      );


    }









    final styleContext =

        responseStyleBuilder.build(

          profileManager.profile,

        );









    return responseGenerator.generate(

      memoryResponse:


          "$styleContext\n\n"
          "Baik ${profileManager.profile.name ?? ""}.\n"
          "Saya memahami pesan Anda "
          "dan akan membantu berdasarkan "
          "informasi yang sudah saya ingat.",


      defaultResponse:


          "Saya memahami pesan Anda.\n"
          "Saya masih belajar menjadi asisten "
          "yang lebih baik.",


      profile:

          profileManager.profile,


    );


  }


}