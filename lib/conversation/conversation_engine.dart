import '../core/kraz_identity.dart';

import '../memory/profile_manager.dart';
import '../memory/memory_analyzer.dart';





class ConversationEngine {



  final ProfileManager profileManager =
      ProfileManager();



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
      ) ||
      lower.contains(
        "apa yang kamu ingat tentang saya",
      )
    ) {


      final profile =
          profileManager.profile;



      if(profile.name != null) {


        return

        "Saya mengenal Anda sebagai "
        "${profile.name}.\n\n"

        "Berikut informasi yang saya ingat:\n\n"

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









    // ==========================
    // PERSONAL RESPONSE
    // ==========================


    final name =
        profileManager.profile.name;



    final style =
        profileManager
            .profile
            .preferredResponseStyle;






    if(
      name != null &&
      style != null
    ) {


      return

      "Baik $name.\n\n"
      "Saya akan menjawab dengan gaya "
      "$style.\n\n"

      "Saya terus belajar memahami "
      "cara terbaik membantu Anda.";


    }








    if(
      name != null
    ) {


      return

      "Baik $name.\n\n"
      "Saya memahami pesan Anda.\n"
      "Saya akan membantu berdasarkan "
      "informasi yang sudah saya ingat.";


    }








    return

    "Saya memahami pesan Anda.\n"
    "Saya masih belajar menjadi asisten "
    "yang lebih baik.";




  }






}