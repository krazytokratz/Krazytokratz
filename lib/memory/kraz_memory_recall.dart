import 'intelligent_memory_retriever.dart';


class KrazMemoryRecall {


  final IntelligentMemoryRetriever retriever =
      IntelligentMemoryRetriever();



  Future<void> initialize() async {

    await retriever.initialize();

  }





  Future<String?> recall(
    String message,
  ) async {


    final input =
        message.toLowerCase().trim();



    // ==================================
    // RECALL ALL MEMORY
    // ==================================

    if (

      input.contains("apa yang kamu ingat") ||

      input.contains("ingat saya") ||

      input.contains("apa yang kamu tahu tentang saya") ||

      input.contains("ceritakan tentang saya")

    ) {


      return await retriever.recallAll();


    }





    // ==================================
    // RECALL IDENTITY
    // ==================================

    if (

      input.contains("siapa saya") ||

      input.contains("nama saya") ||

      input.contains("ingat nama saya")

    ) {


      return await retriever.recallIdentity();


    }





    // ==================================
    // RECALL PROJECT
    // ==================================

    if (

      input.contains("apa proyek saya") ||

      input.contains("proyek saya") ||

      input.contains("sedang membuat apa") ||

      input.contains("sedang mengembangkan apa")

    ) {


      return await retriever.recallProject();


    }





    // ==================================
    // RECALL PREFERENCE
    // ==================================

    if (

      input.contains("apa yang saya suka") ||

      input.contains("preferensi saya") ||

      input.contains("kesukaan saya")

    ) {


      return await retriever.recallPreference();


    }





    // ==================================
    // RECALL LEARNING
    // ==================================

    if (

      input.contains("apa yang saya pelajari") ||

      input.contains("yang sedang saya belajar")

    ) {


      return await retriever.recallLearning();


    }





    return null;


  }



}