import '../core/kraz_identity.dart';

import '../memory/profile_manager.dart';
import '../memory/memory_analyzer.dart';
import '../memory/memory_repository.dart';
import '../memory/memory_model.dart';
import '../memory/memory_category.dart';




class ConversationEngine {



  final ProfileManager profileManager =
      ProfileManager();



  final MemoryRepository memoryRepository =
      MemoryRepository();



  late MemoryAnalyzer analyzer;







  Future<void> initialize() async {


    await profileManager.load();



    analyzer =
        MemoryAnalyzer(
          profileManager.profile,
        );


  }









  Future<String> respond(
    String input,
  ) async {



    final message =
        input.trim();





    final learned =
        analyzer.analyze(
          message,
        );







    if(learned) {


      await profileManager.save();



      return
      "Baik.\n"
      "Saya memahami informasi tersebut "
      "dan akan mengingatnya.";


    }







    final lower =
        message.toLowerCase();








    // ==========================
    // SAVE PROJECT MEMORY
    // ==========================


    if(
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


            id:
                now
                .millisecondsSinceEpoch
                .toString(),



            category:
                MemoryCategory.project,



            key:
                "project_memory",



            content:
                message,



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
    // GREETING
    // ==========================


    if(
      lower.contains("halo") ||
      lower.contains("hai")
    ) {


      final name =
          profileManager.profile.name;



      if(name != null) {


        return
        "Halo $name.\n"
        "Senang bertemu kembali.";


      }



      return
      "Halo.\n"
      "Senang bertemu kembali.";


    }









    // ==========================
    // IDENTITY
    // ==========================


    if(
      lower.contains(
        "siapa kamu",
      )
    ) {


      return
      KrazIdentity.introduction();


    }









    // ==========================
    // PROJECT MEMORY RECALL
    // ==========================


    if(
      lower.contains(
        "ingat proyek",
      ) ||
      lower.contains(
        "proyek saya",
      )
    ) {



      final memories =
          memoryRepository.findByCategory(
            MemoryCategory.project,
          );



      if(memories.isNotEmpty) {



        return

        "Saya mengingat proyek Anda:\n\n"

        "${memories.last.content}";


      }



      return
      "Saya belum memiliki informasi "
      "tentang proyek Anda.";

    }









    // ==========================
    // USER MEMORY RECALL
    // ==========================


    if(
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


      final profile =
          profileManager.profile;



      if(profile.name != null) {


        return

        "Saya mengenal Anda sebagai "
        "${profile.name}.\n\n"

        "${profile.summary()}";


      }




      return
      "Saya belum memiliki informasi "
      "yang cukup tentang Anda.";

    }









    // ==========================
    // PROFILE
    // ==========================


    if(
      lower.contains(
        "profil saya",
      )
    ) {


      return
      profileManager.profile.summary();


    }









    final name =
        profileManager.profile.name;



    if(name != null) {


      return

      "Baik $name.\n\n"
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