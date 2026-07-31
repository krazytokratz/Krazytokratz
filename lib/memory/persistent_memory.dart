import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';



class PersistentMemory {



  Future<void> save(
    String key,
    String value,
  ) async {


    final prefs =
        await SharedPreferences.getInstance();



    await prefs.setString(
      key,
      value,
    );



    debugPrint(
      "KRAZ MEMORY SAVED: $key = $value",
    );


  }







  Future<String?> read(
    String key,
  ) async {


    final prefs =
        await SharedPreferences.getInstance();



    final result =
        prefs.getString(
          key,
        );



    debugPrint(
      "KRAZ MEMORY READ: $key = $result",
    );



    return result;


  }







  Future<bool> exists(
    String key,
  ) async {


    final prefs =
        await SharedPreferences.getInstance();



    return prefs.containsKey(
      key,
    );


  }







  Future<void> remove(
    String key,
  ) async {


    final prefs =
        await SharedPreferences.getInstance();



    await prefs.remove(
      key,
    );


  }







  Future<void> clear() async {


    final prefs =
        await SharedPreferences.getInstance();



    await prefs.clear();


  }


}