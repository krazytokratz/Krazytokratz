import 'package:flutter_tts/flutter_tts.dart';

import '../voice/voice_cleaner.dart';


class AssistantVoice {


  final FlutterTts _tts =
      FlutterTts();




  Future<void> initialize() async {


    await _tts.setLanguage(
      "id-ID",
    );


    await _tts.setSpeechRate(
      0.45,
    );


    await _tts.setVolume(
      1.0,
    );


    await _tts.setPitch(
      1.0,
    );


  }






  Future<void> speak(

    String text,

  ) async {


    if (text.trim().isEmpty) {

      return;

    }




    final cleanedText =

        VoiceCleaner.clean(

          text,

        );




    if(cleanedText.isEmpty) {

      return;

    }





    await _tts.speak(

      cleanedText,

    );


  }






  Future<void> stop() async {


    await _tts.stop();


  }


}