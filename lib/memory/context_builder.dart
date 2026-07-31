import 'memory_model.dart';
import 'memory_category.dart';





class UserContext {


  final String? name;


  final List<Memory> memories;





  UserContext({

    this.name,

    required this.memories,

  });








  String summary() {


    final buffer = StringBuffer();




    if(name != null && name!.isNotEmpty) {


      buffer.writeln(

        "Nama pengguna: $name",

      );


    }






    if(memories.isNotEmpty) {


      buffer.writeln(

        "\nInformasi yang diketahui:",

      );



      for(final memory in memories) {


        buffer.writeln(

          "- ${memory.content}",

        );


      }


    }






    return buffer.toString().trim();


  }





}









class ContextBuilder {





  UserContext build(

    List<Memory> memories,

  ) {



    String? name;





    final identityMemories =

        memories

            .where(

              (memory) =>

                  memory.category ==

                  MemoryCategory.identity,

            )

            .toList();







    for(final memory in identityMemories) {


      final extracted =

          _extractName(

            memory.content,

          );



      if(extracted != null) {


        name = extracted;


        break;


      }


    }







    return UserContext(

      name: name,

      memories: memories,

    );



  }









  String? _extractName(

    String text,

  ) {


    final lower =

        text.toLowerCase();






    if(

      lower.contains(

        "nama saya",

      )

    ) {



      final index =

          lower.indexOf(

            "nama saya",

          );



      final result =

          text

              .substring(

                index + 9,

              )

              .trim();





      if(result.isNotEmpty) {


        return result

            .replaceAll(

              ".",

              "",

            )

            .trim();


      }


    }







    if(

      lower.contains(

        "saya adalah",

      )

    ) {



      final index =

          lower.indexOf(

            "saya adalah",

          );



      final result =

          text

              .substring(

                index + 11,

              )

              .trim();





      if(result.isNotEmpty) {


        return result

            .replaceAll(

              ".",

              "",

            )

            .trim();


      }


    }






    return null;


  }






}