import 'package:flutter_tts/flutter_tts.dart';



class KrazVoice {


  final FlutterTts _tts =
      FlutterTts();





  Future<void> speak(
    String text,
  ) async {


    await _tts.setLanguage(
      "id-ID",
    );


    await _tts.setSpeechRate(
      0.45,
    );


    await _tts.setPitch(
      1.0,
    );



    await _tts.speak(
      text,
    );


  }


}