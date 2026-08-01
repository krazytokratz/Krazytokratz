import 'user_profile.dart';



class MemoryAnalyzer {



  final UserProfile userProfile;



  MemoryAnalyzer(
    this.userProfile,
  );








  bool analyze(
    String message,
  ) {


    final input =
        message.toLowerCase().trim();





    // ==========================
    // NAME
    // ==========================


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








    // ==========================
    // NICKNAME
    // ==========================


    if(
      input.startsWith(
        "panggil saya",
      )
    ) {


      final nickname =
          message
              .substring(12)
              .trim();



      if(nickname.isNotEmpty) {


        userProfile.updateNickname(
          nickname,
        );


        return true;

      }

    }









    // ==========================
    // JOB
    // ==========================


    if(
      input.contains(
        "saya bekerja sebagai",
      )
    ) {


      final job =
          message.replaceFirst(
            RegExp(
              "saya bekerja sebagai",
              caseSensitive: false,
            ),
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









    // ==========================
    // JOB + COMPANY
    // ==========================


    if(
      input.contains(
        "saya adalah",
      ) &&
      input.contains(
        "di",
      )
    ) {


      final data =
          message.split(
            RegExp(
              "di",
              caseSensitive: false,
            ),
          );



      if(data.length >= 2) {


        final job =
            data[0]
                .replaceFirst(
                  RegExp(
                    "saya adalah",
                    caseSensitive: false,
                  ),
                  "",
                )
                .trim();



        final company =
            data[1]
                .trim();



        if(job.isNotEmpty) {


          userProfile.updateOccupation(
            job,
          );


        }




        if(company.isNotEmpty) {


          userProfile.updateCompany(
            company,
          );


        }



        return true;


      }


    }









    // ==========================
    // COMPANY
    // ==========================


    if(
      input.contains(
        "saya bekerja di",
      )
    ) {


      final company =
          message.replaceFirst(
            RegExp(
              "saya bekerja di",
              caseSensitive: false,
            ),
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









    // ==========================
    // INTEREST
    // ==========================


    if(
      input.contains(
        "saya tertarik",
      )
    ) {


      final interest =
          message.replaceFirst(
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









    // ==========================
    // RESPONSE STYLE
    // ==========================


    if(
      input.contains(
        "saya suka penjelasan",
      )
    ) {


      final style =
          message.replaceFirst(
            RegExp(
              "saya suka penjelasan",
              caseSensitive: false,
            ),
            "",
          )
          .trim();



      if(style.isNotEmpty) {


        userProfile.updateResponseStyle(
          style,
        );


        return true;

      }

    }









    // ==========================
    // LEARNING
    // ==========================


    if(
      input.contains(
        "saya sedang belajar",
      )
    ) {


      final learning =
          message.replaceFirst(
            RegExp(
              "saya sedang belajar",
              caseSensitive: false,
            ),
            "",
          )
          .trim();



      if(learning.isNotEmpty) {


        userProfile.updateLearningInterest(
          learning,
        );


        return true;

      }

    }

// ==========================
// NAME (BERNAMA)
// ==========================

if (input.startsWith("saya bernama")) {
  final name = message.substring(12).trim();

  if (name.isNotEmpty) {
    userProfile.updateName(name);
    return true;
  }
}

// ==========================
// FULL NAME
// ==========================

if (input.startsWith("nama lengkap saya")) {
  final name = message.substring(18).trim();

  if (name.isNotEmpty) {
    userProfile.updateName(name);
    return true;
  }
}

// ==========================
// PROJECT
// ==========================

if (input.startsWith("saya sedang membuat")) {

  final project =
      message.substring(20).trim();

  if (project.isNotEmpty) {

    userProfile.updateProject(project);

    return true;
  }
}

// ==========================
// PROJECT DEVELOPMENT
// ==========================

if (input.startsWith("saya mengembangkan")) {

  final project =
      message.substring(19).trim();

  if (project.isNotEmpty) {

    userProfile.updateProject(project);

    return true;
  }
}

// ==========================
// HOBBY
// ==========================

if (input.startsWith("hobi saya")) {

  final hobby =
      message.substring(9).trim();

  if (hobby.isNotEmpty) {

    userProfile.updateHobby(hobby);

    return true;
  }
}

    return false;


  }







  String getProfileSummary() {


    return userProfile.summary();


  }





}