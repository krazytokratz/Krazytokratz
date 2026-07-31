import 'user_profile.dart';
import 'profile_storage.dart';



class ProfileManager {


  final ProfileStorage storage =
      ProfileStorage();



  UserProfile profile =
      UserProfile();





  Future<void> load() async {


    profile =
        await storage.loadProfile();


  }







  Future<void> save() async {


    await storage.saveProfile(
      profile,
    );


  }






  bool get hasName {


    return profile.name != null &&
        profile.name!.isNotEmpty;


  }



}