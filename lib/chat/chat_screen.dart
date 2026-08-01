import 'package:flutter/material.dart';

import 'chat_controller.dart';
import 'chat_message.dart';



class ChatScreen extends StatefulWidget {


  final ChatController controller;



  const ChatScreen({

    super.key,

    required this.controller,

  });



  @override
  State<ChatScreen> createState() =>
      _ChatScreenState();


}








class _ChatScreenState extends State<ChatScreen> {



  final TextEditingController inputController =
      TextEditingController();



  bool initialized = false;







  @override
  void initState() {

    super.initState();

    initialize();

  }







  Future<void> initialize() async {


    await widget.controller.initialize();



    setState(() {


      initialized = true;


    });


  }








  Future<void> sendMessage() async {


    final text =

        inputController.text.trim();



    if(text.isEmpty) {

      return;

    }




    inputController.clear();




    await widget.controller.sendMessage(

      text,

    );



    setState(() {});



  }








  @override
  Widget build(BuildContext context) {


    if(!initialized) {


      return const Scaffold(


        body: Center(


          child: Text(

            "Loading Kraz Memory...",

          ),


        ),


      );


    }







    return Scaffold(


      appBar: AppBar(


        title: const Text(

          "Kraz AI Assistant",

        ),


      ),






      body: Column(


        children: [





          Expanded(


            child: ListView.builder(


              padding:

                  const EdgeInsets.all(16),



              itemCount:

                  widget.controller.messages.length,



              itemBuilder:

                  (context, index) {



                final message =

                    widget.controller.messages[index];




                return MessageBubble(

                  message: message,

                );


              },


            ),


          ),







          Container(


            padding:

                const EdgeInsets.all(8),



            child: Row(


              children: [



                Expanded(


                  child: TextField(


                    controller:

                        inputController,



                    decoration:

                        const InputDecoration(


                      hintText:

                          "Ketik pesan...",


                    ),


                    onSubmitted:

                        (_) => sendMessage(),


                  ),


                ),





                IconButton(


                  icon:

                      const Icon(

                        Icons.send,

                      ),



                  onPressed:

                      sendMessage,


                ),



              ],


            ),


          ),



        ],


      ),


    );


  }




}









class MessageBubble extends StatelessWidget {



  final ChatMessage message;




  const MessageBubble({

    super.key,

    required this.message,

  });








  @override
  Widget build(BuildContext context) {


    final alignment =

        message.isUser

            ? Alignment.centerRight

            : Alignment.centerLeft;





    return Align(


      alignment: alignment,



      child: Container(


        margin:

            const EdgeInsets.symmetric(

              vertical: 6,

            ),



        padding:

            const EdgeInsets.all(12),



        constraints:

            const BoxConstraints(

              maxWidth: 300,

            ),




        child: Text(


          message.text,


        ),


      ),


    );



  }



}