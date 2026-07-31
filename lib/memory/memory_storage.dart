import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'memory_model.dart';



class MemoryStorage {



  static const String storageKey =
      "kraz_memories";







  Future<void> save(

    List<Memory> memories,

  ) async {


    final prefs =
        await SharedPreferences.getInstance();



    final jsonList =

        memories

            .map(

              (memory) =>

                  memory.toJson(),

            )

            .toList();




    await prefs.setString(

      storageKey,

      jsonEncode(

        jsonList,

      ),

    );


  }







  Future<List<Memory>> load() async {


    final prefs =

        await SharedPreferences.getInstance();



    final data =

        prefs.getString(

          storageKey,

        );



    if(data == null){

      return [];

    }





    final List<dynamic> decoded =

        jsonDecode(

          data,

        );





    return decoded

        .map(

          (item) =>

              Memory.fromJson(

                item,

              ),

        )

        .toList();



  }








  Future<void> clear() async {


    final prefs =

        await SharedPreferences.getInstance();



    await prefs.remove(

      storageKey,

    );


  }





}