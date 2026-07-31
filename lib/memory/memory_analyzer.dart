import 'user_profile.dart';


class MemoryAnalyzer {



  final UserProfile userProfile;



  MemoryAnalyzer(
    this.userProfile,
  );






  // ==========================
  // ANALYZE USER MESSAGE
  // ==========================


  bool analyze(
    String message,
  ) {


    final input =
        message.toLowerCase().trim();





    // ======================
    // NAME DETECTION
    // ======================


    if(
      input.startsWith(
        "nama saya",
      )
    ) {


      final name =
          message
              .substring(9)
              .trim();



      if(name.isNotEmpty) {


        userProfile.updateName(
          name,
        );


        return true;

      }


    }







    // ======================
    // JOB DETECTION
    // ======================


    if(
      input.contains(
        "saya bekerja sebagai",
      )
    ) {


      final job =
          message
              .toLowerCase()
              .replaceFirst(
                "saya bekerja sebagai",
                "",
              )
              .trim();



      if(job.isNotEmpty) {


        userProfile.updateOccupation(
          job,
        );


        return true;

      }


    }








    // ======================
    // COMPANY DETECTION
    // ======================


    if(
      input.contains(
        "saya bekerja di",
      )
    ) {


      final company =
          message
              .toLowerCase()
              .replaceFirst(
                "saya bekerja di",
                "",
              )
              .trim();



      if(company.isNotEmpty) {


        userProfile.updateCompany(
          company,
        );


        return true;

      }


    }








    // ======================
    // INTEREST DETECTION
    // ======================


    if(
      input.contains(
        "saya tertarik",
      )
    ) {


      final interest =
          message
              .replaceFirst(
                RegExp(
                  "saya tertarik",
                  caseSensitive: false,
                ),
                "",
              )
              .trim();



      if(interest.isNotEmpty) {


        userProfile.updateInterest(
          interest,
        );


        return true;

      }


    }






    return false;


  }






  // ==========================
  // PROFILE INFORMATION
  // ==========================


  String getProfileSummary() {


    return userProfile.summary();


  }





}