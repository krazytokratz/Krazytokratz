import 'memory_category.dart';


class Memory {


  final String id;


  final MemoryCategory category;


  final String key;


  final String content;


  final int importance;


  final DateTime createdAt;


  final DateTime updatedAt;




  Memory({

    required this.id,

    required this.category,

    required this.key,

    required this.content,

    required this.importance,

    required this.createdAt,

    required this.updatedAt,

  });





  Map<String, dynamic> toJson() {


    return {

      "id": id,

      "category": category.name,

      "key": key,

      "content": content,

      "importance": importance,

      "createdAt":
          createdAt.toIso8601String(),

      "updatedAt":
          updatedAt.toIso8601String(),

    };

  }







  factory Memory.fromJson(

    Map<String, dynamic> json,

  ) {


    return Memory(


      id:
          json["id"] ?? "",



      category:

          MemoryCategory.values.firstWhere(

            (item) =>
                item.name ==
                json["category"],


            orElse: () =>
                MemoryCategory.knowledge,


          ),



      key:

          json["key"] ?? "",




      content:

          json["content"] ?? "",




      importance:

          json["importance"] ?? 0,




      createdAt:

          json["createdAt"] != null

          ? DateTime.parse(
              json["createdAt"],
            )

          : DateTime.now(),




      updatedAt:

          json["updatedAt"] != null

          ? DateTime.parse(
              json["updatedAt"],
            )

          : DateTime.now(),



    );


  }





  Memory copyWith({

    String? id,

    MemoryCategory? category,

    String? key,

    String? content,

    int? importance,

    DateTime? createdAt,

    DateTime? updatedAt,

  }) {


    return Memory(


      id:
          id ?? this.id,


      category:
          category ?? this.category,


      key:
          key ?? this.key,


      content:
          content ?? this.content,


      importance:
          importance ?? this.importance,


      createdAt:
          createdAt ?? this.createdAt,


      updatedAt:
          updatedAt ?? this.updatedAt,


    );


  }




}