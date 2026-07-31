import '../core/kraz_identity.dart';

import '../memory/memory_service.dart';
import '../memory/user_profile.dart';
import '../memory/memory_analyzer.dart';
import '../memory/profile_storage.dart';



class ConversationEngine {



  final MemoryService memoryService;

  final UserProfile userProfile;

  final MemoryAnalyzer analyzer;

  final ProfileStorage profileStorage;





  ConversationEngine({

    required this.memoryService,

    required this.userProfile,

    required this.analyzer,

    required this.profileStorage,

  });








  Future<String> respond(
    String input,
  ) async {



    final message =
        input.trim();





    // ==========================
    // ANALYZE MEMORY
    // ==========================


    final learned =
        analyzer.analyze(
          message,
        );



    if(learned) {


      await profileStorage.saveProfile(
        userProfile,
      );


      return
      "Baik. Saya memahami informasi tersebut "
      "dan akan mengingatnya.";

    }







    // ==========================
    // ASK PROFILE
    // ==========================


    final lower =
        message.toLowerCase();




    if(
      lower.contains(
        "siapa nama saya",
      )
    ) {


      if(userProfile.name != null) {


        return
        "Nama Anda adalah "
        "${userProfile.name}. "
        "Saya masih mengingatnya.";


      }


      return
      "Maaf, saya belum mengetahui nama Anda.";


    }







    if(
      lower.contains(
        "saya bekerja dimana",
      )
    ) {


      if(userProfile.company != null) {


        return
        "Anda bekerja di "
        "${userProfile.company}.";


      }


      return
      "Saya belum memiliki informasi perusahaan Anda.";


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
    // PROFILE SUMMARY
    // ==========================


    if(
      lower.contains(
        "profil saya",
      )
    ) {


      return
      userProfile.summary();


    }







    return
    "Saya memahami pesan Anda. "
    "Mari kita lanjutkan percakapan.";

  }



}