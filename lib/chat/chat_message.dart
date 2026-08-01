enum MessageSender {

  user,

  kraz,

}



class ChatMessage {



  final String text;


  final MessageSender sender;


  final DateTime time;





  ChatMessage({

    required this.text,

    required this.sender,

    required this.time,

  });





  bool get isUser {


    return sender == MessageSender.user;


  }



}