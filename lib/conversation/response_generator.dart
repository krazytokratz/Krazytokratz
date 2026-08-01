import '../memory/user_profile.dart';



class ResponseGenerator {



  String generate({

    required String? memoryResponse,

    required String defaultResponse,

    UserProfile? profile,

  }) {



    String response;



    if (

      memoryResponse != null &&

      memoryResponse.trim().isNotEmpty

    ) {


      response = memoryResponse;


    } else {


      response = defaultResponse;


    }





    return _applyStyle(

      response,

      profile,

    );


  }







  String _applyStyle(

    String response,

    UserProfile? profile,

  ) {



    if (

      profile == null

    ) {


      return response;


    }






    final name =
        profile.name;



    if (

      name != null &&

      name.isNotEmpty &&

      !response.contains(name)

    ) {


      return

          "$response\n\n"
          "— $name";


    }





    return response;


  }




}