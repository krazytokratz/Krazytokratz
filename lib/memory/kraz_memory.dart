import 'package:shared_preferences/shared_preferences.dart';



class KrazMemory {



  static const String userNameKey =
      "user_name";






  Future<void> saveUserName(
    String name,
  ) async {


    final prefs =
        await SharedPreferences.getInstance();



    await prefs.setString(
      userNameKey,
      name,
    );


  }








  Future<String?> getUserName() async {


    final prefs =
        await SharedPreferences.getInstance();



    return prefs.getString(
      userNameKey,
    );


  }








  Future<bool> hasUserName() async {


    final prefs =
        await SharedPreferences.getInstance();



    return prefs.containsKey(
      userNameKey,
    );


  }






  Future<void> clearMemory() async {


    final prefs =
        await SharedPreferences.getInstance();



    await prefs.clear();


  }



}