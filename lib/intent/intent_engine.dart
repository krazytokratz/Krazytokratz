import '../conversation/intent_detector.dart';
import '../conversation/intent_handler.dart';

class IntentEngine {
  final IntentDetector detector =
      IntentDetector();

  final IntentHandler handler =
      IntentHandler();

  IntentType detect(
    String message,
  ) {
    return detector.detect(message);
  }

  String? process(
    String message,
  ) {
    final intent =
        detector.detect(message);

    return handler.handle(
      intent,
    );
  }

  bool hasIntent(
    String message,
  ) {
    return process(message) != null;
  }
}