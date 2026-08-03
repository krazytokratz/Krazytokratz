import 'package:flutter_tts/flutter_tts.dart';


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


    await _tts.speak(
      text,
    );


  }



  Future<void> stop() async {

    await _tts.stop();

  }


}