import '../core/kraz_identity.dart';

import '../memory/profile_manager.dart';
import '../memory/memory_analyzer.dart';
import '../memory/memory_service.dart';
import '../memory/memory_repository.dart';
import '../memory/memory_model.dart';
import '../memory/memory_category.dart';
import '../memory/context_builder.dart';
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



  final ContextBuilder contextBuilder =
      ContextBuilder();



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



    final memories =
        memoryService.getAllMemories();



    final context =
        contextBuilder.build(
          memories,
        );





    // ==========================
    // LEARN USER INFORMATION
    // ==========================

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





    // ==========================
    // SAVE PROJECT MEMORY
    // ==========================

    if (

      lower.contains(
        "membuat aplikasi",
      ) ||

      lower.contains(
        "mengerjakan proyek",
      ) ||

      lower.contains(
        "sedang membuat",
      )

    ) {



      final now =
          DateTime.now();



      final memory =
          Memory(


            key:
                now
                    .millisecondsSinceEpoch
                    .toString(),



            id:
                now
                    .millisecondsSinceEpoch
                    .toString(),



            content:
                message,



            category:
                MemoryCategory.project,



            importance:
                8,



            createdAt:
                now,



            updatedAt:
                now,


          );



      await memoryRepository.saveMemory(
        memory,
      );



      return
          "Baik.\n"
          "Saya memahami ini sebagai informasi "
          "tentang proyek Anda dan akan mengingatnya.";


    }





    // ==========================
    // QUICK INTENT RESPONSE
    // ==========================

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





    // ==========================
    // GREETING
    // ==========================

    if (

      lower.contains("halo") ||

      lower.contains("hai") ||

      lower.contains("selamat pagi") ||

      lower.contains("selamat siang") ||

      lower.contains("selamat sore") ||

      lower.contains("selamat malam")

    ) {


      if (context.name != null) {


        return
            "Halo ${context.name}.\n"
            "Senang bertemu kembali.";


      }



      return
          "Halo.\n"
          "Senang bertemu kembali.";


    }





    // ==========================
    // KRAZ IDENTITY
    // ==========================

    if (

      lower.contains(
        "siapa kamu",
      ) ||

      lower.contains(
        "siapa dirimu",
      )

    ) {


      return
          KrazIdentity.introduction();


    }





    // ==========================
    // USER MEMORY
    // ==========================

    if (

      lower.contains(
        "siapa saya",
      ) ||

      lower.contains(
        "ingat saya",
      ) ||

      lower.contains(
        "apa yang kamu tahu tentang saya",
      )

    ) {


      if (context.name != null) {


        return

            "Saya mengenal Anda sebagai "
            "${context.name}.\n\n"
            "${context.summary()}";


      }



      return

          "Saya belum memiliki informasi "
          "yang cukup tentang Anda.";


    }





    // ==========================
    // PROJECT MEMORY
    // ==========================

    if (

      lower.contains(
        "ingat proyek",
      ) ||

      lower.contains(
        "proyek saya",
      )

    ) {



      final projects =

          memoryService.findByCategory(

            MemoryCategory.project,

          );



      if (projects.isNotEmpty) {


        return

            "Saya mengingat proyek Anda:\n\n"
            "${projects.last.content}";


      }



      return

          "Saya belum memiliki informasi "
          "tentang proyek Anda.";


    }





    // ==========================
    // PROFILE
    // ==========================

    if (

      lower.contains(
        "profil saya",
      )

    ) {


      return
          profileManager.profile.summary();


    }





    // ==========================
    // DEFAULT RESPONSE
    // ==========================

    if (

      context.name != null

    ) {


      return

          "Baik ${context.name}.\n\n"
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