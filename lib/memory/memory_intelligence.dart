import 'memory_model.dart';
import 'memory_category.dart';



class MemoryIntelligence {



  /// 
  /// Mencari memory berdasarkan kategori
  ///
  List<Memory> filterByCategory(

    List<Memory> memories,

    MemoryCategory category,

  ) {


    return memories
        .where(
          (memory) =>
              memory.category == category,
        )
        .toList();


  }






  ///
  /// Mencari memory berdasarkan kata kunci
  ///
  List<Memory> search(

    List<Memory> memories,

    String keyword,

  ) {


    final query =
        keyword.toLowerCase();



    return memories.where(

      (memory) {


        return

          memory.content
              .toLowerCase()
              .contains(query)

          ||

          memory.key
              .toLowerCase()
              .contains(query);

      },

    ).toList();


  }








  ///
  /// Mengurutkan memory berdasarkan tingkat kepentingan
  ///
  List<Memory> rankByImportance(

    List<Memory> memories,

  ) {


    final result =
        List<Memory>.from(
          memories,
        );



    result.sort(

      (a,b) =>

          b.importance
          .compareTo(
            a.importance,
          ),

    );



    return result;


  }








  ///
  /// Mengambil memory paling relevan
  ///
  Memory? getMostRelevant(

    List<Memory> memories,

  ) {


    if(memories.isEmpty){

      return null;

    }



    final ranked =
        rankByImportance(
          memories,
        );



    return ranked.first;


  }








  ///
  /// Mengecek apakah memory sudah ada
  ///
  bool existsSimilar(

    List<Memory> memories,

    String content,

  ) {


    final query =
        content.toLowerCase();



    return memories.any(

      (memory) =>

          memory.content
          .toLowerCase()
          .contains(query),

    );


  }





}