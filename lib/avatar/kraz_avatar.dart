import 'package:flutter/material.dart';


enum KrazState {

  ready,

  listening,

  thinking,

  speaking,

}



class KrazAvatar extends StatelessWidget {


  final KrazState state;



  const KrazAvatar({

    super.key,

    this.state = KrazState.ready,

  });





  String get statusText {


    switch(state) {


      case KrazState.ready:

        return "Ready";



      case KrazState.listening:

        return "Listening...";



      case KrazState.thinking:

        return "Thinking...";



      case KrazState.speaking:

        return "Speaking...";


    }

  }







  IconData get faceIcon {


    switch(state) {


      case KrazState.ready:

        return Icons.face;



      case KrazState.listening:

        return Icons.hearing;



      case KrazState.thinking:

        return Icons.psychology;



      case KrazState.speaking:

        return Icons.record_voice_over;


    }

  }







  @override
  Widget build(BuildContext context) {


    return Column(


      mainAxisSize:
          MainAxisSize.min,


      children: [



        Container(


          width: 160,

          height: 160,


          decoration: BoxDecoration(


            shape:
                BoxShape.circle,


            border:

              Border.all(

                color:
                    Colors.lightBlueAccent,

                width: 3,

              ),


          ),




          child: Icon(


            faceIcon,


            size: 90,


            color:
                Colors.lightBlueAccent,


          ),



        ),





        const SizedBox(

          height: 20,

        ),





        Text(


          "KRAZ",


          style:

            const TextStyle(

              fontSize: 32,

              fontWeight:

                  FontWeight.bold,

              letterSpacing: 4,

            ),


        ),





        const SizedBox(

          height: 8,

        ),





        Text(


          statusText,


          style:

            const TextStyle(

              color:
                  Colors.white70,

              fontSize: 16,

            ),


        ),



      ],


    );


  }


}