import 'intent_detector.dart';

class IntentHandler {
  String? handle(IntentType intent) {
    switch (intent) {
      case IntentType.greeting:
        return "Halo.\nSenang bertemu kembali.";

      case IntentType.identity:
        return null;

      case IntentType.project:
        return null;

      case IntentType.profile:
        return null;

      case IntentType.remember:
        return null;

      case IntentType.unknown:
        return null;
    }
  }
}