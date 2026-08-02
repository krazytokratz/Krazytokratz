import '../brain/brain_engine.dart';

class KrazCore {
  KrazCore._();

  static final KrazCore instance =
      KrazCore._();

  final BrainEngine brain =
      BrainEngine();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    await brain.initialize();

    _initialized = true;
  }

  Future<String> process(
    String message,
  ) async {
    if (!_initialized) {
      await initialize();
    }

    return brain.process(
      message,
    );
  }
}