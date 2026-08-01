import '../core/kraz_identity.dart';

import '../memory/profile_manager.dart';
import '../memory/memory_analyzer.dart';
import '../memory/memory_service.dart';
import '../memory/memory_repository.dart';
import '../memory/persistent_memory.dart';

import 'intent_detector.dart';
import 'intent_handler.dart';
import 'response_generator.dart';



class ConversationEngine {


  final ProfileManager profileManager =
      ProfileManager();



  final MemoryService memoryService =
      MemoryService();



  final PersistentMemory persistentMemory =
      PersistentMemory();



  late MemoryRepository memoryRepository;



  final IntentDetector intentDetector =
      IntentDetector();



  final IntentHandler intentHandler =
      IntentHandler();



  final ResponseGenerator responseGenerator =
      ResponseGenerator();



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

      lower.contains("siapa saya") ||

      lower.contains("siapa nama saya") ||

      lower.contains("ingat saya") ||

      lower.contains("apa yang kamu tahu tentang saya")

    ) {


      if (

        profileManager.hasName

      ) {


        return

            "Saya mengenal Anda sebagai "
            "${profileManager.profile.name}.\n\n"
            "${profileManager.profile.summary()}";


      }



      return

          "Saya belum memiliki informasi "
          "yang cukup tentang Anda.";


    }







    if (

      lower.contains("profil saya")

    ) {


      return

          profileManager.profile.summary();


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


      if (

        profileManager.hasName

      ) {


        return

            "Halo ${profileManager.profile.name}.\n"
            "Senang bertemu kembali.";


      }



      return

          "Halo.\n"
          "Senang bertemu kembali.";


    }







    if (

      lower.contains("siapa kamu") ||

      lower.contains("siapa dirimu")

    ) {


      return

          KrazIdentity.introduction();


    }







    if (

      profileManager.hasName

    ) {


      return

          "Baik ${profileManager.profile.name}.\n\n"
          "Saya memahami pesan Anda "
          "dan akan membantu berdasarkan "
          "informasi yang sudah saya ingat.";


    }





    return

        "Saya memahami pesan Anda.\n"
        "Saya masih belajar menjadi asisten "
        "yang lebih baik.";


  }


}