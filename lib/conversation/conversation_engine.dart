class ConversationEngine {


  String respond(
      String input
  ) {


    final message =
        input.toLowerCase();


    if(message.contains("siapa kamu")) {

      return
      "Saya Kraz, Personal AI Assistant. "
      "Identity Core saya aktif.";

    }


    if(message.contains("apa kabar")) {

      return
      "Saya baik. Sistem Kraz berjalan normal.";

    }


    if(message.contains("proyek")) {

      return
      "Kita sedang membangun Kraz AI Assistant "
      "dengan sistem memory dan personality.";

    }


    return
    "Saya memahami pesan Anda. "
    "Mari kita lanjutkan percakapan.";

  }

}