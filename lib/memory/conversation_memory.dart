class ConversationMemory {


  final String id;


  final String role;


  final String message;


  final DateTime createdAt;





  ConversationMemory({

    required this.id,

    required this.role,

    required this.message,

    required this.createdAt,

  });






  // ==========================
  // CREATE FROM DATA
  // ==========================


  factory ConversationMemory.fromJson(

    Map<String, dynamic> json,

  ) {


    return ConversationMemory(

      id:

          json["id"],


      role:

          json["role"],


      message:

          json["message"],


      createdAt:

          DateTime.parse(

            json["createdAt"],

          ),


    );


  }







  // ==========================
  // CONVERT TO JSON
  // ==========================


  Map<String, dynamic> toJson() {


    return {


      "id":

          id,


      "role":

          role,


      "message":

          message,


      "createdAt":

          createdAt.toIso8601String(),


    };


  }







  // ==========================
  // DISPLAY FORMAT
  // ==========================


  String display() {


    return

        "$role: $message";


  }


}