import 'memory_category.dart';



class Memory {



  final String id;



  final String content;



  final MemoryCategory category;



  final int importance;



  final DateTime createdAt;







  Memory({


    required this.id,


    required this.content,


    required this.category,


    required this.importance,


    required this.createdAt,


  });








  Map<String, dynamic> toJson() {


    return {


      "id":
          id,


      "content":
          content,


      "category":
          category.name,


      "importance":
          importance,


      "createdAt":
          createdAt.toIso8601String(),


    };


  }









  factory Memory.fromJson(
    Map<String, dynamic> json,
  ) {


    return Memory(



      id:
          json["id"],



      content:
          json["content"],



      category:
          MemoryCategory.values.firstWhere(
            (item) =>
                item.name == json["category"],
          ),



      importance:
          json["importance"],



      createdAt:
          DateTime.parse(
            json["createdAt"],
          ),



    );


  }









  @override
  String toString() {


    return

    "${category.name} | "
    "$content";


  }





}
