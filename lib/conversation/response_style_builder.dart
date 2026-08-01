import '../memory/user_profile.dart';



class ResponseStyleBuilder {



  String build(

    UserProfile profile,

  ) {



    final style =
        profile.preferredResponseStyle;



    if (

      style == null ||

      style.isEmpty

    ) {


      return

          "Berikan jawaban yang jelas, "
          "ramah, dan mudah dipahami.";


    }





    return

        "Sesuaikan gaya jawaban dengan "
        "preferensi pengguna: $style.";


  }



}