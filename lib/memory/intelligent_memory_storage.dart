import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'intelligent_memory.dart';





class IntelligentMemoryStorage {



  static const String memoryKey =
      "kraz_intelligent_memory";









  // ==========================
  // SAVE MEMORY
  // ==========================


  Future<void> saveMemory(

    List<IntelligentMemory> memories,

  ) async {



    final prefs =

        await SharedPreferences.getInstance();





    final data =

        memories

            .map(

              (memory) =>

                  memory.toJson(),

            )

            .toList();






    await prefs.setString(

      memoryKey,

      jsonEncode(data),

    );



  }









  // ==========================
  // LOAD MEMORY
  // ==========================


  Future<List<IntelligentMemory>> loadMemory() async {



    final prefs =

        await SharedPreferences.getInstance();





    final data =

        prefs.getString(

          memoryKey,

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

              IntelligentMemory.fromJson(

                item,

              ),

        )

        .toList();



  }









  // ==========================
  // CLEAR MEMORY
  // ==========================


  Future<void> clearMemory() async {



    final prefs =

        await SharedPreferences.getInstance();





    await prefs.remove(

      memoryKey,

    );


  }







}