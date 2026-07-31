import 'memory_model.dart';
import 'memory_category.dart';





class MemoryRetriever {



  List<Memory> retrieve({

    required List<Memory> memories,

    String? keyword,

    MemoryCategory? category,

    int minimumImportance = 0,

  }) {



    List<Memory> result =

        List.from(

          memories,

        );






    // ==========================
    // CATEGORY FILTER
    // ==========================


    if(category != null) {


      result =

          result

              .where(

                (memory) =>

                    memory.category == category,

              )

              .toList();


    }








    // ==========================
    // IMPORTANCE FILTER
    // ==========================


    result =

        result

            .where(

              (memory) =>

                  memory.importance >=

                  minimumImportance,

            )

            .toList();









    // ==========================
    // KEYWORD SEARCH
    // ==========================


    if(

      keyword != null &&

      keyword.trim().isNotEmpty

    ) {



      final searchText =

          keyword

              .toLowerCase()

              .trim();





      result =

          result

              .where(

                (memory) =>

                    memory.content

                        .toLowerCase()

                        .contains(

                          searchText,

                        ),

              )

              .toList();



    }








    // ==========================
    // SORT BY IMPORTANCE
    // ==========================


    result.sort(

      (a,b) =>

          b.importance

              .compareTo(

                a.importance,

              ),

    );






    return result;


  }









  Memory? findBestMatch({

    required List<Memory> memories,

    required String keyword,

  }) {



    final results =

        retrieve(

          memories: memories,

          keyword: keyword,

        );





    if(results.isEmpty) {


      return null;


    }





    return results.first;


  }






}