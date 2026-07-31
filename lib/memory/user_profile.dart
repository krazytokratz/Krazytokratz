import 'dart:convert';



class UserProfile {


  String? name;

  String? nickname;

  String? occupation;

  String? company;

  String? interests;

  String? communicationStyle;

  String? preferredLanguage;





  UserProfile({

    this.name,

    this.nickname,

    this.occupation,

    this.company,

    this.interests,

    this.communicationStyle,

    this.preferredLanguage,

  });







  // ==========================
  // UPDATE DATA
  // ==========================


  void updateName(
    String value,
  ) {

    name = value;

  }





  void updateNickname(
    String value,
  ) {

    nickname = value;

  }





  void updateOccupation(
    String value,
  ) {

    occupation = value;

  }





  void updateCompany(
    String value,
  ) {

    company = value;

  }





  void updateInterest(
    String value,
  ) {

    interests = value;

  }





  void updateCommunicationStyle(
    String value,
  ) {

    communicationStyle = value;

  }





  void updateLanguage(
    String value,
  ) {

    preferredLanguage = value;

  }








  // ==========================
  // CONVERT TO JSON
  // ==========================


  String toJsonString() {


    return jsonEncode({

      "name": name,

      "nickname": nickname,

      "occupation": occupation,

      "company": company,

      "interests": interests,

      "communicationStyle":
          communicationStyle,

      "preferredLanguage":
          preferredLanguage,

    });


  }








  // ==========================
  // LOAD FROM JSON
  // ==========================


  factory UserProfile.fromJsonString(
    String data,
  ) {


    final json =
        jsonDecode(
          data,
        );



    return UserProfile(

      name:
          json["name"],


      nickname:
          json["nickname"],


      occupation:
          json["occupation"],


      company:
          json["company"],


      interests:
          json["interests"],


      communicationStyle:
          json["communicationStyle"],


      preferredLanguage:
          json["preferredLanguage"],

    );


  }








  // ==========================
  // SUMMARY
  // ==========================


  String summary() {


    return """

Nama:
${name ?? "-"}

Panggilan:
${nickname ?? "-"}

Pekerjaan:
${occupation ?? "-"}

Perusahaan:
${company ?? "-"}

Minat:
${interests ?? "-"}

Gaya komunikasi:
${communicationStyle ?? "-"}

Bahasa:
${preferredLanguage ?? "-"}

""";


  }


}