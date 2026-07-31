import '../memory/memory_service.dart';
import '../core/kraz_identity.dart';

class ConversationEngine {


  final MemoryService memoryService;


  ConversationEngine(
    this.memoryService,
  );



  String respond(
    String input,
  ) {


    final message = input.toLowerCase();



    // =========================
    // IDENTITY
    // =========================

    if (message.contains("siapa kamu")) {

      return KrazIdentity.introduction();

    }




    // =========================
    // SAVE USER NAME
    // =========================

    if (message.startsWith("nama saya")) {


      final name =
          input
          .substring(9)
          .trim();



      if (name.isNotEmpty) {


        memoryService.remember(
          "user_name",
          name,
        );


        return
        "Baik. Saya akan mengingat nama Anda $name.";

      }


    }





    // =========================
    // RECALL USER NAME
    // =========================

    if (
      message.contains("siapa nama saya")
    ) {


      final name =
          memoryService.recall(
            "user_name",
          );



      if (name != null) {


        return
        "Nama Anda adalah $name.";

      }


      return
      "Saya belum mengetahui nama Anda.";

    }





    // =========================
    // MEMORY CHECK
    // =========================

    if (
      message.contains("apa yang kamu ingat")
    ) {


      final name =
          memoryService.recall(
            "user_name",
          );



      if (name != null) {


        return
        "Saya mengingat nama Anda $name.";

      }



      return
      "Saat ini memory saya masih kosong.";

    }





    // =========================
    // STATUS
    // =========================

    if (
      message.contains("apa kabar")
    ) {


      return
      "Saya baik. Sistem Kraz berjalan normal.";

    }





    // =========================
    // PROJECT
    // =========================

    if (
      message.contains("proyek")
    ) {


      return
      "Kita sedang membangun Kraz AI Assistant "
      "dengan sistem memory dan personality.";

    }





    // =========================
    // DEFAULT RESPONSE
    // =========================


    return
    "Saya memahami pesan Anda. "
    "Mari kita lanjutkan percakapan.";


  }


}