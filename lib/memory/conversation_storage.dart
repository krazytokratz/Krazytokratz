import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'conversation_memory.dart';





class ConversationStorage {



  static const String conversationKey =
      "kraz_conversation_history";







  // ==========================
  // SAVE CONVERSATION
  // ==========================


  Future<void> saveConversation(

    List<ConversationMemory> conversations,

  ) async {


    final prefs =
        await SharedPreferences.getInstance();




    final data =

        conversations

            .map(

              (item) =>

                  item.toJson(),

            )

            .toList();




    await prefs.setString(

      conversationKey,

      jsonEncode(data),

    );


  }









  // ==========================
  // LOAD CONVERSATION
  // ==========================


  Future<List<ConversationMemory>> loadConversation() async {


    final prefs =

        await SharedPreferences.getInstance();




    final data =

        prefs.getString(

          conversationKey,

        );




    if(data == null) {


      return [];


    }






    final List<dynamic> jsonList =

        jsonDecode(

          data,

        );






    return jsonList

        .map(

          (item) =>

              ConversationMemory.fromJson(

                item,

              ),

        )

        .toList();



  }









  // ==========================
  // DELETE HISTORY
  // ==========================


  Future<void> clearConversation() async {


    final prefs =

        await SharedPreferences.getInstance();




    await prefs.remove(

      conversationKey,

    );


  }







}