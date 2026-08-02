import 'intelligent_memory.dart';





class MemoryClassifier {





  IntelligentMemory? classify(

    String message,

  ) {



    final input =

        message.toLowerCase().trim();







    // ==========================
    // IDENTITY
    // ==========================


    if(

      input.startsWith("nama saya") ||

      input.startsWith("saya bernama") ||

      input.startsWith("nama lengkap saya")

    ) {


      return IntelligentMemory(


        id:

            DateTime.now()

                .millisecondsSinceEpoch

                .toString(),



        content:

            message,



        category:

            "Identity",



        importance:

            "High",



        source:

            "Conversation",



        createdAt:

            DateTime.now(),


      );


    }









    // ==========================
    // PROJECT
    // ==========================


    if(

      input.contains("proyek") ||

      input.contains("project") ||

      input.contains("mengembangkan") ||

      input.contains("membuat aplikasi")

    ) {



      return IntelligentMemory(


        id:

            DateTime.now()

                .millisecondsSinceEpoch

                .toString(),



        content:

            message,



        category:

            "Project",



        importance:

            "High",



        source:

            "Conversation",



        createdAt:

            DateTime.now(),


      );


    }









    // ==========================
    // PREFERENCE
    // ==========================


    if(

      input.contains("saya suka") ||

      input.contains("saya senang") ||

      input.contains("saya lebih suka")

    ) {



      return IntelligentMemory(


        id:

            DateTime.now()

                .millisecondsSinceEpoch

                .toString(),



        content:

            message,



        category:

            "Preference",



        importance:

            "Medium",



        source:

            "Conversation",



        createdAt:

            DateTime.now(),


      );


    }









    // ==========================
    // LEARNING
    // ==========================


    if(

      input.contains("saya belajar") ||

      input.contains("saya sedang belajar")

    ) {



      return IntelligentMemory(


        id:

            DateTime.now()

                .millisecondsSinceEpoch

                .toString(),



        content:

            message,



        category:

            "Learning",



        importance:

            "Medium",



        source:

            "Conversation",



        createdAt:

            DateTime.now(),


      );


    }









    // ==========================
    // NO IMPORTANT MEMORY
    // ==========================


    return null;


  }





}