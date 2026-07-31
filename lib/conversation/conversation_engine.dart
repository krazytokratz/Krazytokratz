import '../core/kraz_identity.dart';


class ConversationEngine {


  Future<String> respond(
    String input,
  ) async {


    final message =
        input.toLowerCase().trim();



    // ==========================
    // IDENTITY
    // ==========================

    if(message.contains("siapa kamu")) {

      return KrazIdentity.introduction();

    }





    // ==========================
    // GREETING
    // ==========================

    if(
      message.contains("halo") ||
      message.contains("hai") ||
      message.contains("selamat")
    ) {


      return
      "Halo. Saya Kraz.\n"
      "Senang berbicara dengan Anda.";

    }






    // ==========================
    // PROJECT
    // ==========================

    if(message.contains("proyek")) {


      return
      "Saat ini saya sedang dikembangkan "
      "sebagai Personal AI Assistant "
      "Krazytokratz.";

    }






    // ==========================
    // DEFAULT
    // ==========================

    return
    "Saya memahami pesan Anda.\n"
    "Saya masih dalam tahap pengembangan "
    "Genesis v0.1.";


  }


}