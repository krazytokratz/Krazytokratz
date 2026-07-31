import 'dart:convert';



class UserProfile {



  String? name;

  String? nickname;

  String? occupation;

  String? company;

  String? interest;






  UserProfile({

    this.name,

    this.nickname,

    this.occupation,

    this.company,

    this.interest,

  });






  // ==========================
  // UPDATE METHODS
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

    interest = value;

  }







  // ==========================
  // JSON
  // ==========================


  Map<String, dynamic> toMap() {


    return {

      "name": name,

      "nickname": nickname,

      "occupation": occupation,

      "company": company,

      "interest": interest,

    };


  }






  factory UserProfile.fromMap(
    Map<String, dynamic> map,
  ) {


    return UserProfile(

      name:
          map["name"],


      nickname:
          map["nickname"],


      occupation:
          map["occupation"],


      company:
          map["company"],


      interest:
          map["interest"],


    );


  }







  String toJson() {


    return jsonEncode(
      toMap(),
    );


  }







  factory UserProfile.fromJson(
    String source,
  ) {


    return UserProfile.fromMap(
      jsonDecode(source),
    );


  }






  // COMPATIBILITY
  // dengan ProfileStorage lama


  String toJsonString() {


    return toJson();


  }







  factory UserProfile.fromJsonString(
    String source,
  ) {


    return UserProfile.fromJson(
      source,
    );


  }







  String summary() {


    return """

Profil Anda:

Nama:
${name ?? "-"}


Panggilan:
${nickname ?? "-"}


Pekerjaan:
${occupation ?? "-"}


Perusahaan:
${company ?? "-"}


Minat:
${interest ?? "-"}


""";


  }



}