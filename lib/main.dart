import 'package:flutter/material.dart';

import 'conversation/kraz_chat_controller.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();


  final controller =
      KrazChatController();


  await controller.initialize();


  runApp(

    KrazApp(

      controller: controller,

    ),

  );

}







class KrazApp extends StatelessWidget {


  final KrazChatController controller;



  const KrazApp({

    super.key,

    required this.controller,

  });



  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      debugShowCheckedModeBanner: false,


      title:
          "Kraz AI Assistant",



      theme:
          ThemeData(

            brightness:
                Brightness.dark,

            primarySwatch:
                Colors.blue,

          ),



      home:
          KrazChatPage(

            controller:
                controller,

          ),

    );


  }


}







class KrazChatPage extends StatefulWidget {


  final KrazChatController controller;



  const KrazChatPage({

    super.key,

    required this.controller,

  });



  @override
  State<KrazChatPage> createState() =>
      _KrazChatPageState();


}







class _KrazChatPageState
    extends State<KrazChatPage> {


  final TextEditingController inputController =
      TextEditingController();



  final List<_ChatMessage> messages =
      [];



  bool loading =
      false;







  Future<void> sendMessage() async {


    final text =
        inputController.text.trim();



    if (text.isEmpty) {

      return;

    }



    inputController.clear();



    setState(() {

      messages.add(

        _ChatMessage(

          text,

          true,

        ),

      );


      loading =
          true;


    });




    final response =
        await widget.controller.sendMessage(
          text,
        );




    setState(() {


      messages.add(

        _ChatMessage(

          response,

          false,

        ),

      );


      loading =
          false;


    });


  }







  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar:
          AppBar(

            title:
                const Text(

                  "Kraz AI Assistant",

                ),

          ),




      body:
          Column(

            children: [



              Expanded(

                child:
                    ListView.builder(

                      padding:
                          const EdgeInsets.all(12),



                      itemCount:
                          messages.length,



                      itemBuilder:
                          (context,index){


                            final message =
                                messages[index];



                            return Align(

                              alignment:
                                  message.user

                                  ? Alignment.centerRight

                                  : Alignment.centerLeft,



                              child:
                                  Container(

                                    margin:
                                        const EdgeInsets.symmetric(

                                          vertical: 5,

                                        ),



                                    padding:
                                        const EdgeInsets.all(12),



                                    decoration:
                                        BoxDecoration(

                                          color:
                                              message.user

                                              ? Colors.blue

                                              : Colors.grey[800],



                                          borderRadius:
                                              BorderRadius.circular(12),

                                        ),



                                    child:
                                        Text(

                                          message.text,

                                        ),

                                  ),

                            );


                      },

                    ),

              ),





              if (loading)

                const Padding(

                  padding:
                      EdgeInsets.all(8),

                  child:
                      Text(

                        "Kraz sedang berpikir...",

                      ),

                ),





              Row(

                children: [



                  Expanded(

                    child:
                        TextField(

                          controller:
                              inputController,



                          decoration:
                              const InputDecoration(

                                hintText:
                                    "Tulis pesan...",


                                contentPadding:
                                    EdgeInsets.all(12),

                              ),

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


            ],

          ),


    );


  }


}







class _ChatMessage {


  final String text;


  final bool user;



  _ChatMessage(

    this.text,

    this.user,

  );


}