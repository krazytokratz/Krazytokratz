import 'package:shared_preferences/shared_preferences.dart';

import 'user_profile.dart';



class ProfileStorage {



  static const String profileKey =
      "kraz_user_profile";







  // ==========================
  // SAVE PROFILE
  // ==========================


  Future<void> saveProfile(
    UserProfile profile,
  ) async {


    final prefs =
        await SharedPreferences.getInstance();



    await prefs.setString(
      profileKey,
      profile.toJsonString(),
    );


  }








  // ==========================
  // LOAD PROFILE
  // ==========================


  Future<UserProfile> loadProfile() async {


    final prefs =
        await SharedPreferences.getInstance();



    final data =
        prefs.getString(
          profileKey,
        );



    if(data == null) {


      return UserProfile();


    }





    return UserProfile.fromJsonString(
      data,
    );


  }








  // ==========================
  // CHECK PROFILE
  // ==========================


  Future<bool> hasProfile() async {


    final prefs =
        await SharedPreferences.getInstance();



    return prefs.containsKey(
      profileKey,
    );


  }








  // ==========================
  // DELETE PROFILE
  // ==========================


  Future<void> deleteProfile() async {


    final prefs =
        await SharedPreferences.getInstance();



    await prefs.remove(
      profileKey,
    );


  }



}