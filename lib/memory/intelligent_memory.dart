class IntelligentMemory {



  final String id;


  final String content;


  final String category;


  final String importance;


  final String source;


  final DateTime createdAt;






  IntelligentMemory({


    required this.id,


    required this.content,


    required this.category,


    required this.importance,


    required this.source,


    required this.createdAt,


  });









  // ==========================
  // CONVERT TO JSON
  // ==========================


  Map<String, dynamic> toJson() {


    return {


      "id": id,


      "content": content,


      "category": category,


      "importance": importance,


      "source": source,


      "createdAt":

          createdAt.toIso8601String(),


    };


  }









  // ==========================
  // LOAD FROM JSON
  // ==========================


  factory IntelligentMemory.fromJson(

    Map<String, dynamic> json,

  ) {


    return IntelligentMemory(


      id:

          json["id"],


      content:

          json["content"],


      category:

          json["category"],


      importance:

          json["importance"],


      source:

          json["source"],


      createdAt:

          DateTime.parse(

            json["createdAt"],

          ),


    );


  }









  // ==========================
  // SUMMARY
  // ==========================


  String summary() {


    return """

Memory:

Content:
$content

Category:
$category

Importance:
$importance

Source:
$source

Created:
$createdAt

""";


  }





}